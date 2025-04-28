using System;
using System.Web;

namespace GenKFI
{
    /// <summary>
    /// Just a class to hold a complete URI and a title or name
    /// </summary>
    public class BreadCrumbNode
	{
		private readonly string strTitle = string.Empty;
		private readonly string strURL = string.Empty;
        public BreadCrumbNode( String strTitle )
		{
			this.strTitle = strTitle;
			strURL = HttpContext.Current.Request.Url.AbsoluteUri;
		}

		public string Title
		{
			get
			{
				return strTitle;
			}
		}

		public string URL
		{
			get
			{
				return strURL;
			}
		}
	}
}
