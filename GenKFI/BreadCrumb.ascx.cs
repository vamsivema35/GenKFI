using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI
{
	public partial class BreadCrumb : System.Web.UI.UserControl
	{
		public String strURLGroup = "";

		public BreadCrumb()
		{
		}


		private List<BreadCrumbNode> URLList
		{
			get
			{
				if( HttpContext.Current.Session[ "KEY_" + strURLGroup ] == null )
					HttpContext.Current.Session[ "KEY_" + strURLGroup ] = new List<BreadCrumbNode>();

				return (List<BreadCrumbNode>)HttpContext.Current.Session[ "KEY_" + strURLGroup ];

			}
			set
			{
				HttpContext.Current.Session[ "KEY_" + strURLGroup ] = value;
			}
		}

		public void Add( BreadCrumbNode bcn )
		{
			// if this page isn't already in the queue, add it
			BreadCrumbNode[] bcnArr = URLList.ToArray();
			int gotIt = -1;
			for( int i = 0; i < bcnArr.Length; i++ )
			{
				if( bcn.URL == bcnArr[ i ].URL )
				{
					gotIt = i;
					break;
				}
			}
			if( gotIt != -1 )
				URLList.RemoveAt( gotIt );
			URLList.Add( bcn );
			if( URLList.Count > 5 )
				URLList.RemoveAt( 0 );
		}

		public void Add( string strTitle )
		{
			Add( new BreadCrumbNode( strTitle ) );
		}

		protected override void Render( HtmlTextWriter writer )
		{
			// base.Render(writer);
			BreadCrumbNode[] bcnArr = URLList.ToArray();
			if( bcnArr.Length > 0 )
			{
				for( int i = 0; i < bcnArr.Length - 1; i++ )
				{
					writer.Write( "<a href=\"" );
					writer.Write( bcnArr[ i ].URL );
					writer.Write( "\">" );
					writer.Write( bcnArr[ i ].Title );
					writer.Write( "</a>" );
					writer.Write( " --> " );
				}

				writer.Write( "<b>" );
				writer.Write( bcnArr[ bcnArr.Length - 1 ].Title );
				writer.Write( "</b>" );
			}
		}

		protected void Page_Load( object sender, EventArgs e )
		{
			// only save on first load
			if( !IsPostBack && Page.Master != null )
			{
				string title = ( (Literal)Page.Master.FindControl( "headerLIT" ) ).Text;
				if( title.IndexOf( " : " ) != -1 )
					title = title.Substring( title.IndexOf( " : " ) + 3 );
				Add( title );
			}
		}
	}
}