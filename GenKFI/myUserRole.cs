//#define BEUSER

using System.Web;
using System.Web.Security;


namespace GenKFI
{
    /* this class is built to return one of two things
	either the regular User.Identity.Name and Role.IsUserInRole()
	or, if Session["impersonating"] != "", return that username and the role "USER".
	it will reduce the number of checks, and then, by construction of the above
	Session value, allow us to be able to view the app as another user

	@#@# perhaps make this a singleton, so we don't have to keep using static

	search and replaces
	User.Identity.Name		myUserRole.UserName
	Roles.IsUserInRole		myUserRole.IsUserInRole
	User.IsInRole			myUserRole.IsUserInRole
	*/
    public class MyUserRole
	{

		private static bool IsImpersonating()
		{
			System.Web.SessionState.HttpSessionState currentSession = HttpContext.Current.Session;
			System.Security.Principal.IPrincipal user = System.Web.HttpContext.Current.User;
			if( currentSession[ "impersonating" ] != null )
				return ( currentSession[ "impersonating" ].ToString() != "" );
			else
				return false;
		}

		static public string UserName()
		{
			System.Web.SessionState.HttpSessionState currentSession = HttpContext.Current.Session;
			System.Security.Principal.IPrincipal user = System.Web.HttpContext.Current.User;
			string un;
			// is impersonating, just get username in session
			if( IsImpersonating() )
				un = currentSession[ "impersonating" ].ToString();
			// not impersonating, return logged in user
			else
				un = user.Identity.Name;
			
			// trim domain
			un = UtilClass.NormalizeUN( un );
			
			return un;
		}

		static public bool IsUserInRole( string role )
		{
			//@#@# user testing
#if BEUSER
			if( role == "USER" )
				return true;
			else
				return false;
#endif


			System.Web.SessionState.HttpSessionState currentSession = HttpContext.Current.Session;
			System.Security.Principal.IPrincipal user = System.Web.HttpContext.Current.User;
    		return Roles.IsUserInRole( UtilClass.NormalizeUN( user.Identity.Name ), role );
		}
	}
}