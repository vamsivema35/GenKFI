using System;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class needSql : System.Web.UI.Page
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
			strCurrPage = "Table SQL needed";
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			Session[ "kstrcurrPage" ] = strCurrPage;
			( (Literal)Master.FindControl( "titleLIT" ) ).Text = UtilClass.NormalizeUN( Context.User.Identity.Name ) + " : GenKFI Tax Programs - " + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + Roles.GetRolesForUser( MyUserRole.UserName() )[ 0 ];
			( (Literal)Master.FindControl( "headerLIT" ) ).Text = Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + strCurrPage;
			Session[ "homeLink" ] = "Default.aspx";

			UtilClass ec = new UtilClass();
			ec.ErrorRedir( this );
			ec.AdminOnly( strCurrPage );
			Response.BufferOutput = true;

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			// on some pages, we want to restrict to a single tax program
			// hide the drop down selection
			( (Panel)Master.FindControl( "tpSELPNL" ) ).Visible = false;

			#endregion
			if( !IsPostBack )
			{
				backBBLNK.NavigateUrl = "blockBatch.aspx?rhID=" + Request.QueryString[ "rhID" ];
				if( Session[ "strSQL" ] != null )
					sqlTXT.Text = Session[ "strSQL" ].ToString();
				else
					sqlTXT.Text = "No SQL sent to page, please go through the Form Builder process to regenerate the SQL for the tables/controls.";
				// now that we used it, clear it, it might be rather big
				Session.Remove( "strSQL" );
			}
		}

		protected void OnClick_sendEmailBTN( object sender , EventArgs e )
		{
			// get the emails
			// don't know if we have an email server we can use, so not going to implement this yet

		}
	}
}