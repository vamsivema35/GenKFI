using System;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI
{
    public partial class Default : System.Web.UI.Page
	{
		string strCurrPage;

		protected void Page_Load( object sender, EventArgs e )
		{
			if( !IsPostBack )
			{

				#region common load code

				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
				//@#@# common code on all pages
				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

				GoodConn gc = new GoodConn();

				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
				// this is the only thing that changes across pages
				strCurrPage = "Main Page";
				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
				Session[ "kstrcurrPage" ] = strCurrPage;
				// test for role, only need this here, because the Global.asax will put them in next for any later pages if they don't have a role
				string[] roles = Roles.GetRolesForUser( MyUserRole.UserName() );
				string myRole = "";
				if( roles.Length > 0 )
					myRole = roles[ 0 ];
				( (Literal)Master.FindControl( "titleLIT" ) ).Text = UtilClass.NormalizeUN( Context.User.Identity.Name ) + " : GenKFI Tax Programs - " + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + myRole;
				( (Literal)Master.FindControl( "headerLIT" ) ).Text = Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + strCurrPage;
				Session[ "homeLink" ] = "Default.aspx";

                //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
                //@#@# common code on all pages
                //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

                #endregion

				// Only show IC Tools for Dev if in DEBUG
#if DEBUG
                ICToolsROW.Visible = true;
#else
                ICToolsROW.Visible = false;
#endif

				// hide table rows if they aren't allowed to see them
				if ( MyUserRole.IsUserInRole( "USER" ) )
				{
					// users get this now, so they can see the menu or key-through
					//@#@# keyModeROW.Visible = false;

					unassignedBatchesROW.Visible = false;
					reassignBatchesROW.Visible = false;
					closedBatchesROW.Visible = false;

					adminHeadROW.Visible = false;
					userStatsROW.Visible = false;
					manageUsersROW.Visible = false;
                    DcUtilityROW.Visible = false;

                    devHeadROW.Visible = false;
					ICToolsROW.Visible = false;
					jsEditROW.Visible = false;
					errorROW.Visible = false;
					formTemplatesROW.Visible = false;
				}
				if( !MyUserRole.IsUserInRole( "DEV" ) )
				{
                    devHeadROW.Visible = false;
                    ICToolsROW.Visible = false;
                    jsEditROW.Visible = false;
					errorROW.Visible = false;
					formTemplatesROW.Visible = false;
				}

				// moved this down, this is the first time we're getting the SecCode, which the errorCheck needs
				UtilClass ec = new UtilClass();
				ec.ErrorRedir( this );
				ec.AdminOnly( strCurrPage );
				Response.BufferOutput = true;

			}	// end not IsPostback
		}

		protected void OnClick_editLNK( object sender, EventArgs e )
		{
			// check that only one tax program is selected
			if( Session[ "tpSelHID" ].ToString().IndexOf( "ALL;" ) == -1 && Session[ "tpSelHID" ].ToString().Split( ';' ).Length == 1 )
			{
				// if so redirect to
				// utils/formBuilder/existForms.aspx&tp={selected tax program}
				Response.Redirect( ResolveClientUrl( "utils/formBuilder/existForms.aspx?tp=" + Session[ "tpSelHID" ].ToString() ), true );
			}
			// otherwise yell at them
			else
				ScriptManager.RegisterClientScriptBlock( this.Page, this.Page.GetType(), "alert", "alert( \"You have multiple tax programs selected. Please select only one tax program before trying to edit forms.\");", true );
		}

		protected void OnClick_keyModeBTN( object sender, EventArgs e )
		{
			// toggle the keyMode session value
			if( Session[ "keyMode" ] == null )
				Session[ "keyMode" ] = true;
			else
			{
				Session[ "keyMode" ] = !(bool)Session[ "keyMode" ];
				Page.Response.Redirect( Page.Request.Url.ToString(), true );
			}
		}
	}
}
