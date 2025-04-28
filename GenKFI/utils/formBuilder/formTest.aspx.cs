using GenKFI.Properties;
using System;
using System.Data;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class FormTest : Page
    {
		/*
		taken from formBuild.aspx
		removed all control building references
		we only need to load the controls and the provided image
		*/


		protected void Page_Load( object sender, EventArgs e )
		{
			UtilClass ec = new UtilClass();
			ec.ErrorRedir( this );
			ec.AdminOnly( "Form Test" );
			Response.BufferOutput = true;


			ViewState[ "chID" ] = Request.QueryString[ "chID" ];
			ViewState[ "rhID" ] = Request.QueryString[ "rhID" ];

			// for some JS on the master, set the type
			( (HiddenField)Master.FindControl( "typeHID" ) ).Value = "test";

			if( !IsPostBack )
			{

				// get the header values we need
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif

                    string statement = "SELECT rh.fstrFileType, rh.fstrTaxProgram, ";
                    statement += "rh.flngTaxYear, ch.fstrTaxForm, ch.flngBlock, ch.fstrTable ";
					statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
					statement += "WHERE ch.idControlHeaders = " + ViewState[ "chID" ].ToString();
					statement += " AND ch.flngReturnHeadersIDFK = rh.idReturnHeaders;";
					gc.DoSelect( statement );
					DataTable dt = new DataTable();
					int numRows = gc.ReadSelect( out dt );
					if( numRows > 0 )
					{
						// fill the header info, never changes
						fileTypeTXT.Text = dt.Rows[ 0 ][ "fstrFileType" ].ToString();
						taxYearTXT.Text = dt.Rows[ 0 ][ "flngTaxYear" ].ToString();
						taxProgTXT.Text = dt.Rows[ 0 ][ "fstrTaxProgram" ].ToString();
						titleLBL.Text = dt.Rows[ 0 ][ "fstrTaxForm" ].ToString();
						blockTXT.Text = dt.Rows[ 0 ][ "flngBlock" ].ToString();
						tableTXT.Text = dt.Rows[ 0 ][ "fstrTable" ].ToString();
						if( Session[ "kestrImagePath" ] != null )
							( (Image)Master.FindControl( "imgImage" ) ).ImageUrl = "noFront/imageLoad.aspx";
					}

					gc.Disconnect();
				}
				catch( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}

				// and load
				LoadControls();
			}
		}

		// load up any existing controls and plot them plus a checkbox for selection
		private void LoadControls()
		{
			GoodConn gc = new GoodConn();
			string keFocus = "";
			string statement = "";
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				// get the control IDs, just to make sure they are there for us to work with, and for the first focus control
				statement = "SELECT fstrInputID ";
				statement += "FROM rfrControls ";
				statement += "WHERE flngControlHeadersIDFK = " + ViewState[ "chID" ].ToString();
				statement += " AND fblnActive = 1 ";
				statement += "AND flngOrder > 0 ";
				statement += "ORDER BY flngOrder";

				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					keFocus = dt.Rows[ 0 ][ "fstrInputID" ].ToString();			// Get first Entry Item so Focus can be set on it

					// Now Get the Controls ready for Entry
					StringBuilder controlString = ( (Forms)Master ).GetControlsTable( gc, btnSub.ClientID, ViewState[ "chID" ].ToString() );
                    controlString = controlString.Replace("~@TI@~", "");
                    controlString = controlString.Replace("~@TB@~", "0");
					long maxScrl = ( (Forms)Master ).RegisterAutoJavaScripts( gc, ViewState[ "chID" ].ToString() );
					// set the zoom
					( (Forms)Master ).SetZoomFactor( ViewState[ "chID" ].ToString(), ( (Image)( (Forms)Master ).FindControl( "imgImage" ) ).ClientID, gc );

					// and into the control
					( (Literal)Master.FindControl( "controlsLIT" ) ).Text = controlString.ToString();
					// set maxScrl
					( (HiddenField)Master.FindControl( "maxScrl" ) ).Value = maxScrl.ToString();

					if( !Page.ClientScript.IsStartupScriptRegistered( "sizerDiv" ) )
					{
						string sizerDiv = @"$('#ctrlSizer').height( $('#divControls').height() + parseInt( $('#" + ( (HiddenField)Master.FindControl( "maxScrl" ) ).ClientID + @"').val() ) );";
						ScriptManager.RegisterStartupScript( Page, Page.GetType(), "sizerDiv", sizerDiv, true );
					}
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
			// and focus first
			( (HiddenField)Master.FindControl( "keFocusHID" ) ).Value = keFocus;
		}

		protected void OnClick_btnSub( object sender, EventArgs e )
		{
			// just go back to the blockBatch/aspx with the needed info
			Response.Redirect( "blockBatch.aspx?rhID=" + Request.QueryString[ "rhID" ] + "&chID=" + Request.QueryString[ "chID" ], true );
		}
	}
}