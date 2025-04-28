using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using GenKFI.Properties;

namespace GenKFI
{
    public class UtilClass
	{
		// this is a list of pages only user type ADMIN can access
		// it is filled in the constructor with the strCurrpage values from the Page_Load of each admin only page
		// keep this in mind when adding more ADMIN only pages
		private ArrayList adminOnlyPages;
		public UtilClass()
		{
            adminOnlyPages = new ArrayList
            {
                // users and batch assignment
                "Manage Users/Roles",
                "Unbalanced Batches",
                "Unassigned Batches",
                "User Stats",
                // form building
                "Existing Forms",
                "Form Builder (Block/Batch)",
                "Form Builder",
                "Table SQL needed",
                "Form Test",
                "Testing Utility",
                "JS Auto-Complete Functions",
                // other
                "View Previous Errors"
            };
        }

		public void ErrorRedir( Page page )
		{
			System.Web.SessionState.HttpSessionState currentSession = HttpContext.Current.Session;
			System.Security.Principal.IPrincipal user = System.Web.HttpContext.Current.User;
			if( UtilClass.TrimDomain( user.Identity.Name ) == "none" )
			{
				currentSession[ "ErrorMsg" ] = "Invalid User";
				HttpContext.Current.Response.Redirect( page.ResolveClientUrl( "error.aspx" ), false );
			}

		}

		public void AdminOnly( string pageTitle )
		{
			System.Web.SessionState.HttpSessionState currentSession = HttpContext.Current.Session;
			System.Security.Principal.IPrincipal user = System.Web.HttpContext.Current.User;
			bool isAdminOnly = false;
			for( int i = 0; i < adminOnlyPages.Count; i++ )
			{
				if( pageTitle == (string)adminOnlyPages[ i ] )
					isAdminOnly = true;
			}

			if( !MyUserRole.IsUserInRole( "SUPER" ) &&
				!MyUserRole.IsUserInRole( "ADMIN" ) &&
				!MyUserRole.IsUserInRole( "DEV" ) &&
				isAdminOnly )
			{
				currentSession[ "ErrorMsg" ] = "You don't have permission to see the " + currentSession[ "kstrCurrPage" ].ToString().Trim() + " page ";
				HttpContext.Current.Response.Redirect( "error.aspx", false );
			}

			// get the expiration date, if needed
			if( currentSession[ "userExpires" ] == null )
			{
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif
					string statement = "SELECT expires FROM userExpires u, aspnet_Users a WHERE a.UserId = u.userIDFK AND a.LoweredUserName = '" + MyUserRole.UserName() + "';";
					currentSession[ "userExpires" ] = gc.DoScalar( statement );
					gc.Disconnect();
				}
				catch( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}
			}

			// check the value in the session, whether we just put it there or it was already there
			if( (DateTime)currentSession[ "userExpires" ] < DateTime.Now )
			{
				currentSession[ "ErrorMsg" ] = "Your access has been restricted. Your username is no longer allowed to access GenKFI. If this is in error, please contact your supervisor.";
				HttpContext.Current.Response.Redirect( "error.aspx", false );
			}
		}

		// this function will store a caught error in a table in the DB for later review
		// gc must already be open, or it will be opened and closed to insert the error message
		// to be used in a try/catch around a GoodConn
		public static void RecordError( GoodConn gc, Exception ex )
		{
			bool wasClosed = false;
			if( !gc.IsOpen )
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				wasClosed = true;
			}

			string statement = "INSERT INTO errMsg ( fdtmWhen, fstrWho, fstrWhat, fstrWhere, fblnResolved, fstrResolveMsg ) VALUES ( @fdtmWhen, @fstrWho, @fstrWhat, @fstrWhere, @fblnResolved, @fstrResolveMsg );";
			gc.ParamCommand( statement );
			gc.SetParam( "@fdtmWhen", SqlDbType.DateTime, DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );
			gc.SetParam( "@fstrWho", SqlDbType.Text, UtilClass.NormalizeUN( System.Web.HttpContext.Current.User.Identity.Name ) );
			gc.SetParam( "@fstrWhat", SqlDbType.Text, ex.Message + ( ex.InnerException != null ? " -> " + ex.InnerException.Message : "" ) );
			// get the entire stack trace, easier to debug later
			StackTrace st = new StackTrace( ex, true );
			string where = "Method=~M~@File=~F~@Line=~L~";
			string allWhere = "";
			int count = 1;
			foreach( StackFrame fr in st.GetFrames() )
			{
				if( fr.GetFileName() != null )
				{
					allWhere += "(" + count.ToString() + "):" + where.Replace( "~M~", fr.GetMethod().Name ).Replace( "~F~", fr.GetFileName() ).Replace( "~L~", fr.GetFileLineNumber().ToString() ) + "\n";
					count++;
				}
			}
			gc.SetParam( "@fstrWhere", SqlDbType.VarChar, allWhere );
			gc.SetParam( "@fblnResolved", SqlDbType.TinyInt, 0 );
			gc.SetParam( "@fstrResolveMsg", SqlDbType.VarChar, "" );
			gc.DoExecutePARAM();

			if( wasClosed )
				gc.Disconnect();
		}

		// needed for straight SQL statement building
		// not needed for the parameterized statements
		public static string Sanitize( string s )
		{
			return s.Replace( "'", "''" );
		}

		// a utility function to trim a domain name off the fully qualified username
		public static string TrimDomain( string s )
		{
			return s.Substring( s.LastIndexOf( "\\" ) + 1 );
		}

		// a function to take the User.Identity.Name or myUserRole.UserName() and make the domain all caps, and the username all lowercase
		// the system doesn't seem to be consistent on the case of the username, which we need for user reference in the DB
		public static string NormalizeUN( string un )
		{
			string ret = un;
			if( un.LastIndexOf( "\\" ) != -1 )
				ret = un.Substring( un.LastIndexOf( "\\" ) + 1 ).ToLower();
			return ret;
		}

		// a function to check if a table exists
		// takes the table name and a GoodConn object that must already be connected
		public static bool TableExists( string tableName, GoodConn gc )
		{
			// no table given, clearly it doesn't exist
			if( tableName == "" )
				return false;

			try
			{
				string statement = "SELECT TOP 1 * FROM " + tableName;
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				// if we made it here, the GoodConn didn't throw an exception, so we're good
				return true;
			}
			catch( Exception ex )
			{
				// if the exception is what we'd expect for a table not existing, reutrn false
				if( ex.InnerException.Message == "Invalid object name '" + tableName + "'." )
					return false;
				// if something else went wrong, let the caller deal with it
				else
					throw;
			}
		}

		// a function to check if a column in a table exists
		// takes the table name, column name and a GoodConn object that must already be connected
		public static bool ColumnExists( string tableName, string colName, GoodConn gc )
		{
			// if no column, then clearly it isn't there
			if( colName == "" )
				return false;

			try
			{
				string statement = "SELECT TOP 1 " + colName + " FROM " + tableName;
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				// if we made it here, the GoodConn didn't throw an exception, so we're good
				return true;
			}
			catch( Exception ex )
			{
				// if the exception is what we'd expect for a table not existing, reutrn false
				if( ex.InnerException.Message == "Invalid column name '" + colName + "'." )
					return false;
				// if something else went wrong, let the caller deal with it
				else
					throw;
			}
		}

		// very similar to the above function, this will check for all columns in the table for a form,
		// given the table name, a where filter to get the right form and an open GoodConn object
		// returns a list of missing columns
		public static List<string> AllColumnsExist( string tableName, string whereFilter, GoodConn gc )
		{
			List<string> ret = new List<string>();
			try
			{
				string statement = "SELECT fstrColumn FROM rfrControls WHERE " + whereFilter + " AND fstrTable = '" + tableName + "' AND flngOrder > 0;";
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					foreach( DataRow row in dt.Rows )
					{
						if( !ColumnExists( tableName, row[ "fstrColumn" ].ToString(), gc ) )
							ret.Add( row[ "fstrColumn" ].ToString() );
					}
				}
				return ret;
			}
			catch( Exception ex )
			{
                object kkex = ex;
				throw;
			}
		}
	}
}
