using GenKFI.Properties;
using System;
using System.Web.Security;

namespace GenKFI
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start( object sender, EventArgs e )
		{
			if( !Roles.RoleExists( "DEV" ) )
				Roles.CreateRole( "DEV" );
			if( !Roles.RoleExists( "ADMIN" ) )
				Roles.CreateRole( "ADMIN" );
			if( !Roles.RoleExists( "SUPER" ) )
				Roles.CreateRole( "SUPER" );
			if( !Roles.RoleExists( "USER" ) )
				Roles.CreateRole( "USER" );

			//@#@# System.Diagnostics.Debug.WriteLine( "Application_Start               " + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );
		}

		protected void Session_Start( object sender, EventArgs e )
		{
			//@#@# System.Diagnostics.Debug.WriteLine( "Session_Start                   " + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );

		}

		protected void Application_BeginRequest( object sender, EventArgs e )
		{
			//@#@# System.Diagnostics.Debug.WriteLine( "Application_BeginRequest        " + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );

		}

		protected void Application_AuthenticateRequest( object sender, EventArgs e )              
		{
			// when a request comes in, it's when a user opens the website
			// so check if they are in a role here
			// if not, they become default a "USER"
			// the admins can change them later on the manage users page
            string Wuser = UtilClass.NormalizeUN( System.Security.Principal.WindowsIdentity.GetCurrent().Name );       
            if (UtilClass.NormalizeUN(System.Security.Principal.WindowsIdentity.GetCurrent().Name) == null)
            {
                System.Diagnostics.Debug.WriteLine("Blank User Name");
            }

            if (Roles.GetRolesForUser(UtilClass.NormalizeUN(System.Security.Principal.WindowsIdentity.GetCurrent().Name)).Length == 0)
			{
                Roles.AddUserToRole(UtilClass.NormalizeUN(System.Security.Principal.WindowsIdentity.GetCurrent().Name), "USER");
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif
                    string statement = "SELECT UserID ";
                    statement += "FROM aspnet_Users ";
                    statement += "WHERE UserName = '" + UtilClass.NormalizeUN(System.Security.Principal.WindowsIdentity.GetCurrent().Name) + "';";
					string uID = gc.DoScalar( statement ).ToString();
					statement = "INSERT INTO userExpires ( userIDFK, expires ) VALUES ( '" + uID + "', '9999-12-31 00:00:00' );";
					gc.DoExecute( statement );
					statement = "INSERT INTO userProgCode ( userIDFK, progCodeIDFK ) SELECT '" + uID + "', idProgCodes FROM progCodes WHERE removed = 0;";
					gc.DoExecute( statement );
				}
				catch( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}
			}
			//@#@# System.Diagnostics.Debug.WriteLine( "Application_AuthenticateRequest " + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );

		}

		protected void Application_Error( object sender, EventArgs e )
		{
			//@#@# System.Diagnostics.Debug.WriteLine( "Application_Error               " + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );

		}

		protected void Session_End( object sender, EventArgs e )
		{
			//@#@# System.Diagnostics.Debug.WriteLine( "Session_End                     " + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );

		}

		protected void Application_End( object sender, EventArgs e )
		{
			//@#@# System.Diagnostics.Debug.WriteLine( "Application_End                 " + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );

		}
	}
}