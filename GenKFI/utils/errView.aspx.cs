using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class ErrView : System.Web.UI.Page
	{
		string strCurrPage;
		
		protected void Page_Load( object sender, EventArgs e )
		{
			#region common load code

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			// this is the only thing that changes across pages
			strCurrPage = "View Previous Errors";
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			Session[ "kstrcurrPage" ] = strCurrPage;
			( (Literal)Master.FindControl( "titleLIT" ) ).Text = "GenKFI Tax Programs - Manage Users : " + Roles.GetRolesForUser( MyUserRole.UserName() )[ 0 ];
			( (Literal)Master.FindControl( "headerLIT" ) ).Text = "Admin : " + strCurrPage;
			Session[ "homeLink" ] = "Default.aspx";

			UtilClass ec = new UtilClass();
			ec.AdminOnly( strCurrPage );
			Response.BufferOutput = true;

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			#endregion

			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				string statement = "SELECT TOP 100 fblnResolved, fstrResolveMsg, fdtmWhen, fstrWhat, fstrWho, ";
				statement += "'<td>' + REPLACE( fstrWhere, SUBSTRING( fstrWhere, CHARINDEX( 'File', fstrWhere ) - 1, 1 ), '</td></tr><tr><td>' ) + '</td></tr>' AS whereTD ";
				statement += "FROM errMsg ORDER BY fdtmWhen DESC;";
				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				errListRPT.DataSource = null;
				errListRPT.DataBind();
				if( numRows > 0 )
				{
					errListRPT.DataSource = dt;
					errListRPT.DataBind();
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}
	}
}