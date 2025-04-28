using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class ManageUserRoles2 : Page
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
			strCurrPage = "Manage Users/Roles";
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

			// hehe, coalesing operator in an if statement, hehe, clever me
			if( !IsPostBack || ( Request.Params["__EVENTARGUMENT"] ?? "" ) == "codes" )
			{
				// load and fill the filter control values
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif

					// roleDDL
					roleDDL.Items.Clear();
					roleDDL.Items.Add( new ListItem( "ALL", "ALL" ) );
					updateRoleDDL.Items.Clear();
					foreach( string r in Roles.GetAllRoles() )
					{
						roleDDL.Items.Add( new ListItem( r, r ) );
						updateRoleDDL.Items.Add( new ListItem( r, r ) );
					}

					// expiredCKB
					expiredCKB.Checked = false;

					gc.Disconnect();
				}
				catch( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}
				LoadUserData();
			}

		}

		private void LoadUserData()
		{
			string[] filters = { "", "" };

			// show expired?
			if( expiredCKB.Checked )
				filters[ 0 ] = "1";

			// a certain role?
			if( roleDDL.SelectedValue != "ALL" )
				filters[ 1 ] = UtilClass.Sanitize( roleDDL.SelectedValue );

			GoodConn gc = new GoodConn();
			DataTable dt;
			int numRows;
			string statement;

			// clean the repeater
			userListRPT.DataSource = null;
			userListRPT.DataBind();

			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				// load current users, based on the filter, if any
				// because expired and taxProg are in our own tables, we will filter for those first
				statement = "SELECT ";
				statement += "CONVERT( NVARCHAR(45), aspnet_Users.UserId ) + ';' + aspnet_Users.UserName AS ckbVal, ";
				statement += "aspnet_Users.UserName + CASE WHEN CONVERT( VARCHAR, expires, 20 ) < CONVERT( VARCHAR, GETDATE(), 20 ) THEN ' *' ELSE '' END AS UserName, ";
				statement += "aspnet_Roles.RoleName AS Role ";
				statement += "FROM ";
				statement += "aspnet_Users, ";
				statement += "userExpires, ";
				statement += "aspnet_Roles, ";
				statement += "aspnet_UsersInRoles ";
				statement += "WHERE ";
				statement += "userExpires.userIDFK = aspnet_Users.UserId AND ";
				statement += "aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId AND ";
				statement += "aspnet_UsersInRoles.UserId = aspnet_Users.UserId";

				// filter by UN, username only, trim off the domain
				if( searchTXT.Text != "" )
					statement += " AND RIGHT( aspnet_Users.UserName, LEN( aspnet_Users.UserName ) - CHARINDEX( '\\', aspnet_Users.UserName ) ) LIKE '%" + UtilClass.Sanitize( searchTXT.Text ) + "%'";

				// filter by expired
				// filter is clear, don't include expired, limit expired date to after now
				if( filters[ 0 ] == "" )
					statement += " AND CONVERT( VARCHAR, expires, 20 ) > CONVERT( VARCHAR, GETDATE(), 20 )";

				// filter by role
				if( filters[ 1 ] != "" )
					statement += " AND aspnet_Roles.LoweredRoleName = '" + filters[ 1 ].ToLower() + "' AND aspnet_UsersInRoles.UserId = aspnet_Users.UserId AND aspnet_UsersInRoles.RoleId = aspnet_Roles.RoleId";
				// no role filter, remove those tables from the statment
				// still need it for the role listing

				statement += " ORDER BY aspnet_Users.UserName";
				gc.DoSelect( statement );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					userListRPT.DataSource = dt;
					userListRPT.DataBind();
					( (Literal)userListRPT.Controls[ 0 ].Controls[ 0 ].FindControl( "countLIT" ) ).Text = numRows.ToString();
				}

				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		// update selected user with any changes in the role or programs list
		protected void OnClick_updateUserBTN( object sender, EventArgs e )
		{
			// this gives us a list of what is checked
			string strChecked = Request.Form[ "checkUser" ];
			string[] strCheckedList = strChecked.Split( ',' );

			// nothing checked, nothing to do
			if( strCheckedList.Length == 0 )
				return;

			// a user can only change roles at or below their level
			// DEV can change anyone
			// ADMIN can not change to DEV
			// SUPER can only change to SUPER or USER
			// USER can't change anything
			string thisUserRole = Roles.GetRolesForUser( MyUserRole.UserName() )[ 0 ];
			if( ( thisUserRole == "DEV" ) ||
				( thisUserRole == "ADMIN" && updateRoleDDL.SelectedValue != "DEV" ) ||
				( thisUserRole == "SUPER" && ( updateRoleDDL.SelectedValue == "SUPER" || updateRoleDDL.SelectedValue == "USER" ) ) )
			{
				for( int i = 0; i < strCheckedList.Length; i++ )
				{
					string uName = strCheckedList[ i ].Split( ';' )[ 1 ];
					string oldRole = Roles.GetRolesForUser( uName )[ 0 ];
					if( updateRoleDDL.SelectedValue != oldRole )
					{
						// add to new role
						Roles.AddUserToRole( uName, updateRoleDDL.SelectedValue );
						// and remove from old role
						Roles.RemoveUserFromRole( uName, oldRole );
					}
				}
				// reload to reflect the changes
				LoadUserData();
			}
			else
			{
				ScriptManager.RegisterClientScriptBlock( this.Page, this.Page.GetType(), "alert", "alert( \"Your user level is not high enough to make this change. Changes have NOT been saved.\");", true );
				return;
			}
		}

		// just update the exire value for the selected user
		protected void OnClick_invalidateUserBTN( object sender, EventArgs e )
		{
			// this gives us a list of what is checked
			string strChecked = Request.Form[ "checkUser" ];
			string[] strCheckedList = strChecked.Split( ',' );

			// nothing checked, nothing to do
			if( strCheckedList.Length == 0 )
				return;

			// update the expired table
			GoodConn gc = new GoodConn();
			string statement = "";
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				statement = "UPDATE userExpires SET expires = CASE WHEN CONVERT( VARCHAR, expires, 20 ) < CONVERT( VARCHAR, GETDATE(), 20 ) THEN '9999-12-31' ELSE GETDATE() END WHERE userIDFK IN( ";
				// put the uIDs in the statement
				for( int i = 0; i < strCheckedList.Length; i++ )
				{
					string uID = strCheckedList[ i ].Split( ';' )[ 0 ];
					statement += "'" + UtilClass.Sanitize( uID ) + "', ";
				}
				// finish and execute
				statement = statement.Substring( 0, statement.Length - 2 ) + ");";
				gc.DoExecute( statement );
				gc.Disconnect();
				// reload to reflect the changes
				LoadUserData();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}
        protected void OnClick_AddUserBTN(object sender, EventArgs e)
        {
            Roles.AddUserToRole(searchTXT.Text, "USER");
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                string statement = "SELECT UserID FROM aspnet_Users WHERE UserName = '" + searchTXT.Text + "'";
                string uID = gc.DoScalar(statement).ToString();
                statement = "INSERT INTO userExpires ( userIDFK, expires ) VALUES ( '" + uID + "', '9999-12-31 00:00:00' );";
                gc.DoExecute(statement);
                statement = "INSERT INTO userProgCode ( userIDFK, progCodeIDFK ) SELECT '" + uID + "', idProgCodes FROM progCodes WHERE removed = 0;";
                gc.DoExecute(statement);
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

            LoadUserData();
        }

		// find the user name closest to the entered text, and select it in the listbox
		protected void OnClick_doSearchBTN( object sender, EventArgs e )
		{
			// just reload, the function will get the search text and filters
			LoadUserData();
		}

		// just clear the box and reload everyone
		protected void OnClick_clearSearchBTN( object sender, EventArgs e )
		{
			searchTXT.Text = "";
			LoadUserData();
		}

		// simply clear the filters and reload the user list
		protected void OnClick_clearFiltersBTN( object sender, EventArgs e )
		{
			expiredCKB.Checked = false;
			roleDDL.SelectedValue = "ALL";
			LoadUserData();
		}

		// filter the users displayed in the listbox based on filter controls
		protected void OnClick_applyFiltersBTN( object sender, EventArgs e )
		{
			// just load, it will get the filters and search text itself
			LoadUserData();
		}

	}
}