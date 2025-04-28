using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class ClosedBatches : System.Web.UI.Page
	{
		//string strProgCode;
		//string strProgLang;
		string strCurrPage;

		protected void Page_Load( object sender, EventArgs e )
		{
			// no interaction here, just load and show

			#region common load code

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			// this is the only thing that changes across pages
			strCurrPage = "Closed Batches";
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

			if( !IsPostBack )
				LoadClosedBatches();

		}

		protected void OnClick_subBTN( object sender, EventArgs e )
		{
			string strChecked = Request.Form[ "ClosedBatches" ];
			// nothing checked, reload list and leave
			if( strChecked == null )
			{
				LoadClosedBatches();
				return;
			}
			
			// if there was anything checked, open it
			if( strChecked != "" )
			{
				string[] strCheckedList = strChecked.Split( ',' );
				foreach( string s in strCheckedList )
				{
					string[] info = s.Split( ';' );

					string strSQL = "UPDATE tblNM_BatchInfo";
					strSQL += " SET fstrBatchStatus = 'O'";
					strSQL += " WHERE fstrBatchId = '" + info[ 0 ] + "'";
					strSQL += " AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + info[ 1 ] + "'";
					strSQL += " AND fstrTaxProgram = '" + info[ 3 ] + "'";
					strSQL += " AND fstrImgSrc = '" + info[ 2 ] + "'";
					strSQL += " AND fintHeaderCount = fintBatchCount";
			//		strSQL += " AND fcurHeaderAmount = fcurBatchAmount";

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
					}
					catch( Exception ex )
					{
						UtilClass.RecordError( gc, ex );
						gc.Disconnect();
					}
				}
				// and reload the closed list
				LoadClosedBatches();
			}
		}

		private void LoadClosedBatches()
		{
			string strSQL = "";
			GoodConn gc = new GoodConn();
			DataTable dt = new DataTable();
			int numRows;

			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				// get the header info
				strSQL = "SELECT COUNT(*) AS BatchCount";
				strSQL += ", ISNULL( SUM( a.fintHeaderCount ), 0 ) AS HeaderTotal";
				strSQL += ", ISNULL( SUM( a.fintBatchCount ), 0 ) AS ItemTotal";
				strSQL += " FROM tblNM_BatchInfo a";
				strSQL += " WHERE a.fstrBatchStatus = 'C'";
				strSQL += " AND a.fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", "', '" ) + "' )";
				strSQL += " AND a.fstrBatchUploaded = 'N'";

				if( MyUserRole.IsUserInRole( "USER" ) )
					strSQL += " AND a.fstrBatchUser = '" + MyUserRole.UserName() + "'";

				gc.DoSelect( strSQL );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );

				if( numRows > 0 )
				{
					batchCountLIT.Text = dt.Rows[ 0 ][ "BatchCount" ].ToString();
					headerTotalLIT.Text = dt.Rows[ 0 ][ "HeaderTotal" ].ToString();
					ItemTotalLIT.Text = dt.Rows[ 0 ][ "ItemTotal" ].ToString();
				}

				strSQL = "SELECT LTRIM( RTRIM( a.fstrBatchId ) ) + ';' + CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) + ';' + a.fstrImgSrc + ';' + a.fstrTaxProgram AS Checkbox ";
				strSQL += ", a.fstrTaxProgram AS TaxProgram";
				strSQL += ", LTRIM( RTRIM( a.fstrBatchId ) ) + ';' + CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) + ';' + a.fstrImgSrc + ';' + a.fstrTaxProgram AS batchLink";
				strSQL += ", a.fstrBatchID AS BatchID";
				strSQL += ", CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) AS BatchDate";
				strSQL += ", a.fstrImgSrc AS ImageSource";
				strSQL += ", (a.fstrForm + ' ' + LTRIM(RTRIM(a.fstrBatchType))) AS BatchType";
				strSQL += ", CONVERT( VARCHAR(10), a.fdtmPostmarkDate, 101 ) AS PostmarkDate";
				strSQL += ", a.fintHeaderCount AS HeaderCount";
				strSQL += ", '$' + CONVERT( VARCHAR(18), a.fcurHeaderAmount ) AS HeaderAmount";
				strSQL += ", a.fintbatchCount AS ItemCount";
				strSQL += ", '$' + CONVERT( VARCHAR(18), a.fcurbatchAmount ) AS ItemAmount";
                strSQL += ", a.fintPaymentCount AS PymCount";
                strSQL += ", '$' + CONVERT( VARCHAR(18), a.fcurPaymentAmount ) AS PymAmount";
                strSQL += ", REPLACE( REPLACE( a.fstrBatchStatus, 'O', 'Open' ), 'C', 'Closed' ) AS BatchStatus";
				strSQL += ", a.fstrBatchUser AS BatchUser";
				strSQL += ", CONVERT( VARCHAR(10), a.fdtmBatchCreated, 101 ) AS DateOpened";
				strSQL += " FROM tblNM_BatchInfo a";
				strSQL += " WHERE a.fstrBatchStatus = 'C'";
				strSQL += " AND a.fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", "', '" ) + "' )";
				strSQL += " ADMIN_REPLACE_ME_STRING";
				strSQL += " AND a.fstrBatchUploaded = 'N'";
				strSQL += " ORDER BY a.fdtmBatchDate, a.fstrBatchID, a.fstrBatchUser";

				if( MyUserRole.IsUserInRole( "USER" ) )
					strSQL = strSQL.Replace( "ADMIN_REPLACE_ME_STRING", "AND a.fstrBatchUser = '" + MyUserRole.UserName() + "'" );
				else
					strSQL = strSQL.Replace( "ADMIN_REPLACE_ME_STRING", "AND a.fstrBatchUser NOT LIKE 'BATCH%'" );

				gc.DoSelect( strSQL );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );

				if( numRows > 0 )
				{
					batchPNL.Visible = true;
					noBatchPNL.Visible = false;
					// bind the datasource
					batchRPT.DataSource = dt;
					batchRPT.DataBind();
					if( MyUserRole.IsUserInRole( "ADMIN" ) || MyUserRole.IsUserInRole( "DEV" ) || MyUserRole.IsUserInRole( "SUPER" ) )
						detailPNL.Visible = true;
					else
						detailPNL.Visible = false;
				}
				else
				{
					batchPNL.Visible = false;
					noBatchPNL.Visible = true;
					detailPNL.Visible = false;
					noBatchLIT.Text = "No \"" + strCurrPage + "\" batches found.";
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}
	}
}