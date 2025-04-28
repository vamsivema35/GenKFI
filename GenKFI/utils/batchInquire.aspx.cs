using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class BatchInquire : Page
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
			strCurrPage = "Batch Inquire";
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

			if( !Page.ClientScript.IsStartupScriptRegistered( "keypressDate1" ) )
			{
				string forceName = @"$(document).ready(function(){
									$('#" + openedDateTXT.ClientID + @"').keyup( function(){ fmtDate(this,this); } ); });";
				ScriptManager.RegisterStartupScript( Page, Page.GetType(), "keypressDate1", forceName, true );
			}
			if( !Page.ClientScript.IsStartupScriptRegistered( "keypressDate2" ) )
			{
				string forceName = @"$(document).ready(function(){
									$('#" + batchDateTXT.ClientID + @"').keyup( function(){ fmtDate(this,this); } ); });";
				ScriptManager.RegisterStartupScript( Page, Page.GetType(), "keypressDate2", forceName, true );
			}

			if( !IsPostBack )
				DoInquire();
		}

		protected void OnClick_subBTN( object sender, EventArgs e )
		{
			DoInquire();
		}

		private void DoInquire()
		{
			GoodConn gc = new GoodConn();
			DataTable dt;
			int numRows;
			string strSQL = "";

			string BatchID = "";
			string BatchDate = "";
			string OpenedDate = "";
			string strBatchID = "";
			string strOpenDate = "";
			string strBatchDate = "";

			Response.BufferOutput = true;

			try
			{
				BatchID = UtilClass.Sanitize( batchIDTXT.Text.Trim() );
				OpenedDate = UtilClass.Sanitize( openedDateTXT.Text.Trim() );
				BatchDate = UtilClass.Sanitize( batchDateTXT.Text.Trim() );


#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				// check the other possible filters
				if( BatchID == "" )
					strBatchID = "";
				else
					strBatchID = " AND fstrBatchID like '%" + BatchID + "%'";


				DateTime d1;
				double d2;
				if( BatchDate == "" )
					strBatchDate = "";
				else if( DateTime.TryParse( BatchDate, out d1 ) )
				{
					strBatchDate = " AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = CONVERT( VARCHAR(10), CONVERT( DATETIME, '" + d1.ToString( "MM/dd/yyyy" ) + "'), 101 )";
					OpenedDate = "";
					openedDateTXT.Text = "";
				}
				else if( double.TryParse( BatchDate, out d2 ) )
				{
					strBatchDate = " AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = CONVERT( VARCHAR(10), CONVERT( DATETIME, '" + DateTime.Today.AddDays( d2 ).ToString( "MM/dd/yyyy" ) + "'), 101 )";
					OpenedDate = "";
					openedDateTXT.Text = "";
				}


				if( OpenedDate == "" )
					strOpenDate = "";
				else if( DateTime.TryParse( OpenedDate, out d1 ) )
					strOpenDate = " AND CONVERT( VARCHAR(10), fdtmBatchCreated, 101) = CONVERT( VARCHAR(10), CONVERT( DATETIME, '" + d1.ToString( "MM/dd/yyyy" ) + "'), 101 )";
				else if( double.TryParse( OpenedDate, out d2 ) )
					strOpenDate = " AND CONVERT( VARCHAR(10), fdtmBatchCreated, 101) = CONVERT( VARCHAR(10), CONVERT( DATETIME, '" + DateTime.Today.AddDays( d2 ).ToString( "MM/dd/yyyy" ) + "'), 101 )";

				// nothing filled in, default to todays opened date
				if( BatchID == "" && BatchDate == "" && OpenedDate == "" )
				{
					OpenedDate = DateTime.Today.ToString( "MM/dd/yy" );
					openedDateTXT.Text = OpenedDate;
					strOpenDate = " AND CONVERT( VARCHAR(10), fdtmWhen, 101 ) = CONVERT( VARCHAR(10), CONVERT( DATETIME, '" + DateTime.Today.ToString( "MM/dd/yyyy" ) + "'), 101 )";
				}

				// main table
				strSQL = "SELECT a.fstrTaxProgram AS TaxProgram";
				strSQL += ", LTRIM( RTRIM( a.fstrBatchID ) ) + ';' + CONVERT( VARCHAR(10), a.fdtmBatchDate ,101 ) + ';' + a.fstrImgSrc + ';' + a.fstrTaxProgram AS batchLink";
				strSQL += ", a.fstrBatchID AS BatchID";
				strSQL += ", CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) AS BatchDate";
				strSQL += ", CASE WHEN UPPER( a.fstrWho ) = 'BATCH2D' THEN '2DB' ELSE a.fstrImgSrc END AS ImageSource ";
				strSQL += ", (a.fstrForm + ' ' + LTRIM(RTRIM(a.fstrBatchType))) AS BatchType";
				strSQL += ", a.fintHeaderCount AS HeaderCount";
				strSQL += ", '$' + CONVERT( VARCHAR(20), a.fcurHeaderAmount ) AS HeaderAmount";
				strSQL += ", a.fintbatchCount AS ItemCount";
				strSQL += ", '$' + CONVERT( VARCHAR(20),a.fcurbatchAmount ) AS ItemAmount";
				strSQL += ", REPLACE( REPLACE( a.fstrBatchStatus, 'O', 'Open' ), 'C', 'Closed' ) AS BatchStatus";
				strSQL += ", a.fstrBatchUser AS BatchUser";
				strSQL += ", CONVERT( VARCHAR(10), a.fdtmBatchCreated, 101 ) AS DateOpened";
				strSQL += ", CASE WHEN a.fdtmBatchUploaded <> '12/31/9999' THEN CONVERT( VARCHAR(10), a.fdtmBatchUploaded ,101 ) ELSE '' END AS DateExtracted";
				strSQL += " FROM tblNM_BatchInfo a";
   				strSQL += " WHERE a.fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", "', '" ) + "' )";
 				strSQL += " AND fstrBatchStatus IN ( 'O', 'C' )";
				strSQL += strBatchID + strBatchDate + strOpenDate;

				gc.DoSelect( strSQL );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );

				batchRPT.DataSource = null;
				batchRPT.DataBind();
				if( numRows > 0 )
				{
					batchRPT.DataSource = dt;
					batchRPT.DataBind();
					batchRPT.Visible = true;
					overallSummaryPNL.Visible = true;

					// a highlevel summary, same WHERE as above
					strSQL = "SELECT COUNT( * ) as BatchCount, ";
					strSQL += "ISNULL( SUM( fintHeaderCount ), 0 ) as HeaderTotal, ";
					strSQL += "ISNULL( SUM( fintBatchCount ), 0 ) AS ItemTotal ";
					strSQL += "FROM tblNM_BatchInfo ";
                    strSQL += " WHERE fstrTaxProgram IN ( '" + Session["tpSelHID"].ToString().Replace("ALL;", "").Replace(";", "', '") + "' )";
					strSQL += "AND fstrBatchStatus IN ( 'O', 'C' )";
					strSQL += strBatchID + strBatchDate + strOpenDate;
					dt = new DataTable();
					gc.DoSelect( strSQL );
					numRows = gc.ReadSelect( out dt );
					if( numRows > 0 )
					{
						overallSummarybatchCountLIT.Text = dt.Rows[ 0 ][ "BatchCount" ].ToString();
						overallSummaryheaderTotalLIT.Text = dt.Rows[ 0 ][ "HeaderTotal" ].ToString();
						overallSummaryItemTotalLIT.Text = dt.Rows[ 0 ][ "ItemTotal" ].ToString();
					}

					// low level summary of the above datatable
					// 20140403 added a UNION to break down BATCH and BATCH2D in fstrWho
					strSQL = "SELECT fstrForm as TaxYear, ";
					strSQL += "fstrImgSrc as ImageSource, ";
					strSQL += "fstrBatchType as BatchType, ";
					strSQL += "COUNT(*) as BatchCount, ";
					strSQL += "ISNULL( SUM( fintHeaderCount ), 0 ) as HeaderCount ";
					strSQL += "FROM tblNM_BatchInfo ";
                    strSQL += " WHERE fstrTaxProgram IN ( '" + Session["tpSelHID"].ToString().Replace("ALL;", "").Replace(";", "', '") + "' )";
					strSQL += "AND fstrBatchStatus IN ( 'O', 'C' ) ";
					strSQL += "AND UPPER( fstrWho ) = 'BATCH' ";
					strSQL += strBatchID + strBatchDate + strOpenDate;
					strSQL += "GROUP BY fstrWho, fstrForm, fstrBatchType, fstrImgSrc ";
					strSQL += "UNION ";

					strSQL += "SELECT fstrForm as TaxYear, ";
					strSQL += "'2DB' as ImageSource, ";
					strSQL += "fstrBatchType as BatchType, ";
					strSQL += "COUNT(*) as BatchCount, ";
					strSQL += "ISNULL( SUM( fintHeaderCount ), 0 ) as HeaderCount ";
					strSQL += "FROM tblNM_BatchInfo ";
                    strSQL += " WHERE fstrTaxProgram IN ( '" + Session["tpSelHID"].ToString().Replace("ALL;", "").Replace(";", "', '") + "' )";
					strSQL += "AND fstrBatchStatus IN ( 'O', 'C' ) ";
					strSQL += "AND UPPER( fstrWho ) = 'BATCH2D' ";
					strSQL += strBatchID + strBatchDate + strOpenDate;
					strSQL += "GROUP BY fstrWho, fstrForm, fstrBatchType, fstrImgSrc ";

					strSQL += "ORDER BY fstrForm, fstrBatchType, fstrImgSrc";

					gc.DoSelect( strSQL );
					dt = new DataTable();
					numRows = gc.ReadSelect( out dt );
					overallSummarydetailRPT.DataSource = null;
					overallSummarydetailRPT.DataBind();
					if( numRows > 0 )
					{
						overallSummarydetailRPT.DataSource = dt;
						overallSummarydetailRPT.DataBind();
					}

				}
				else
				{
					batchRPT.Visible = false;
					overallSummaryPNL.Visible = false;
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