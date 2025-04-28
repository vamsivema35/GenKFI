using System;

namespace GenKFI.utils
{
    public partial class Error : System.Web.UI.Page
	{
		protected void Page_Load( object sender, EventArgs e )
		{
			errorLIT.Text = MyUserRole.UserName() + " : " + Session[ "ErrorMsg" ];
			Session[ "ErrorMsg" ] = "";
		}
	}
}
