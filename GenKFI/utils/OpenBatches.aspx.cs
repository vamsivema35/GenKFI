using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;
using GenKFI.Properties;

namespace GenKFI.utils
{
    public partial class OpenBatches : System.Web.UI.Page
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
			strCurrPage = "Open Batches";
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

			#endregion

			// users don't need the submitMeBTN
			if( MyUserRole.IsUserInRole( "USER" ) )
				submitMeBTN.Visible = false;

			if( !IsPostBack )
				LoadOpenBatches();

		}

		private void LoadOpenBatches()
		{

			GoodConn gc = new GoodConn();
			DataTable dt;
			int numRows;

			string strSQL = "";

			// first fill the header info
			strSQL = "SELECT COUNT(*) AS BatchCount";
			strSQL += ", ISNULL( SUM( a.fintHeaderCount ), 0 ) AS HeaderTotal";
			strSQL += ", ISNULL( SUM( a.fintBatchCount ), 0 ) AS ItemTotal";
			strSQL += " FROM tblNM_BatchInfo a";
			strSQL += " WHERE a.fstrBatchStatus = 'O'";
			strSQL += " AND a.fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( ";", "', '" ) + "' )";
			strSQL += " ADMIN_REPLACE_ME_STRING";

			if( MyUserRole.IsUserInRole( "USER" ) )
				strSQL = strSQL.Replace( "ADMIN_REPLACE_ME_STRING", "AND a.fstrBatchUser = '" + MyUserRole.UserName() + "'" );
			else
				strSQL = strSQL.Replace( "ADMIN_REPLACE_ME_STRING", "AND a.fstrBatchUser NOT LIKE 'BATCH%'" );

			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				gc.DoSelect( strSQL );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					batchTD.Text = dt.Rows[ 0 ][ "BatchCount" ].ToString();
					headerTD.Text = dt.Rows[ 0 ][ "HeaderTotal" ].ToString();
					itemTD.Text = dt.Rows[ 0 ][ "ItemTotal" ].ToString();
				}

				// now build the batches table
				// the checkboxes don't work on the original, so maybe we can fix them here
				string strCheckBoxString = "";
				strSQL = "SELECT ADMIN_CHECKBOX_STRING ";
				strSQL += "a.fstrTaxProgram AS TaxProgram, ";
				strSQL += "LTRIM( RTRIM( a.fstrBatchId ) ) + ';' + CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) + ';' + a.fstrImgSrc + ';' + a.fstrTaxProgram AS batchLink, ";
				strSQL += "a.fstrBatchID AS BatchID, ";
				strSQL += "CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) AS BatchDate, ";
				strSQL += "a.fstrImgSrc AS ImageSource, ";
				strSQL += "(a.fstrForm + ' ' + LTRIM(RTRIM(a.fstrBatchType))) AS BatchType, ";
				strSQL += "CONVERT( VARCHAR(10), a.fdtmPostmarkDate, 101 ) AS PostmarkDate, ";
				strSQL += "a.fintHeaderCount AS HeaderCount, ";
				strSQL += "'$' + CONVERT( VARCHAR(18), a.fcurHeaderAmount ) AS HeaderAmount, ";
				strSQL += "a.fintbatchCount AS ItemCount, ";
				strSQL += "'$' + CONVERT( VARCHAR(18), a.fcurbatchAmount ) AS ItemAmount, ";
                strSQL += "a.fintPaymentCount AS PymCount, ";
                strSQL += "'$' + CONVERT( VARCHAR(18), a.fcurPaymentAmount ) AS PymAmount, ";
                strSQL += "REPLACE( REPLACE( a.fstrBatchStatus, 'O', 'Open' ), 'C', 'Closed' ) AS BatchStatus, ";
				strSQL += "a.fstrBatchUser AS BatchUser, ";
				strSQL += "CONVERT( VARCHAR(10), a.fdtmBatchCreated ,101 ) AS DateOpened";
				strSQL += " FROM tblNM_BatchInfo a";
				strSQL += " WHERE a.fstrBatchStatus = 'O'";
				strSQL += " AND a.fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( ";", "', '" ) + "' )";
				strSQL += " ADMIN_REPLACE_ME_STRING";
				strSQL += " ORDER BY a.fdtmBatchDate, a.fstrBatchID, a.fstrBatchUser";

				if( MyUserRole.IsUserInRole( "USER" ) )
				{
					strSQL = strSQL.Replace( "ADMIN_REPLACE_ME_STRING", "AND a.fstrBatchUser = '" + MyUserRole.UserName() + "'" );
					// see here for a description of why this can't be empty
					/* http://stackoverflow.com/questions/18279499/inside-repeater-not-working-order-of-evaluating-and */
					strSQL = strSQL.Replace( "ADMIN_CHECKBOX_STRING", "'' AS Checkbox, " );
				}
				else
				{
					// this still has the replacement on Eval on the ASPX page, so it will disappear if it has no value
					strSQL = strSQL.Replace( "ADMIN_REPLACE_ME_STRING", "AND a.fstrBatchUser NOT LIKE 'BATCH%'" );
					strCheckBoxString = "CASE WHEN ( ( a.fintHeaderCount = a.fintBatchCount ) AND (a.fcurBatchAmount = a.fcurPaymentAmount) ) THEN ";
					strCheckBoxString += "'~1' + LTRIM( RTRIM( a.fstrBatchId ) ) + ';' + CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) + ';' + a.fstrImgSrc + ';' + a.fstrTaxProgram + '~2' ";
					strCheckBoxString += "ELSE '' END AS Checkbox, ";
					strSQL = strSQL.Replace( "ADMIN_CHECKBOX_STRING", strCheckBoxString );
				}

				// get the batches and checkboxes
				gc.DoSelect( strSQL );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );
				batchesRPT.DataSource = null;
				batchesRPT.DataBind();
				if( numRows > 0 )
				{
					batchesRPT.DataSource = dt;
					batchesRPT.DataBind();
					batchesRPT.Visible = true;
					noBatchesTBL.Visible = false;
				}
				else
				{
					batchesRPT.Visible = false;
					noBatchesTBL.Visible = true;
					noneTD.Text = "No \"" + strCurrPage + "\" batches found.";
				}

				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_submitMeBTN( object sender, EventArgs e )
		{
			string strChecked = Request.Form[ "OpenBatches" ];
			if( strChecked != null && strChecked != "" )
			{
				foreach( string s in strChecked.Split( ',' ) )
				{
					// fstrBatchId ; fdtmBatchDate ; fstrImgSrc ; fstrTaxProgram
					string[] info = s.Split( ';' );

					string strSQL = "UPDATE tblNM_BatchInfo";
					strSQL += " SET fstrBatchStatus = 'C'";
					strSQL += " WHERE fstrBatchId = '" + info[ 0 ] + "'";
					strSQL += " AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + info[ 1 ] + "'";
					strSQL += " AND fstrTaxProgram = '" + info[ 3 ] + "'";
					strSQL += " AND fstrImgSrc = '" + info[ 2 ] + "'";
					strSQL += " AND fintHeaderCount = fintBatchCount";

					GoodConn gc = new GoodConn();
					try
					{
#if DEBUG
						gc.Connect( Resources.connString );
#else
						gc.Connect( Resources.prodConnString );
#endif
						gc.DoExecute( strSQL );
						gc.Disconnect();
						// reload batch list to reflect changes
						LoadOpenBatches();
					}
					catch( Exception ex )
					{
						UtilClass.RecordError( gc, ex );
						gc.Disconnect();
					}
				}
			}
		}
	}
}
