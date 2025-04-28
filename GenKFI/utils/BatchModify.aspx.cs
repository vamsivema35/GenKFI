using GenKFI.Properties;
using System;
using System.Data;
using System.Drawing;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class BatchModify : System.Web.UI.Page
	{
		/* static is bad, changed to ViewState
		static string strProgCode;
		*/
		//string strProgLang;
		string strCurrPage;

		protected void Page_Load( object sender, EventArgs e )
		{
			#region common load code

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# common code on all pages
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			DataTable dt = new DataTable();
			int numRows = 0;

			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			// this is the only thing that changes across pages
			strCurrPage = "Batch Modify";
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
				GoodConn gc = new GoodConn();

				string strSQL = "";

				// variables declared on original page, we probably don't need them all
				int i;
				string strBatchMod = "";
				string newOwner = "";
				string[] info;
				string strProgCode = "";


				// same connection for all the select below
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif

					// fill the header info
					ItemCount.Text = "-1";
					info = Request.QueryString[ "Batch" ].ToString().Split( ';' );
					BatchID.Value = UtilClass.Sanitize( info[ 0 ] );
					ImageSource.Value = UtilClass.Sanitize( info[ 2 ] );
					BatchDate.Value = UtilClass.Sanitize( info[ 1 ] );
					ViewState[ "strProgCode" ] = info[ 3 ];
					strProgCode = info[ 3 ];
                    strSQL = "SELECT fstrBatchID AS fstrBatchID";
					strSQL += ", CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) AS fstrBatchDate";
					strSQL += ", fstrImgSrc AS fstrImgSrc";
					strSQL += ", fstrBatchUser AS fstrBatchUser";
					strSQL += ", CONVERT( VARCHAR(10), fdtmBatchCreated, 101 ) AS fstrBatchCreated";
					strSQL += ", CONVERT( VARCHAR(10), fdtmReceivedDate, 101 ) AS fstrReceivedDate";
					strSQL += ", CONVERT( VARCHAR(10), fdtmPostmarkDate, 101 ) AS fstrPostmarkDate";
					strSQL += ", CONVERT( VARCHAR(10), fdtmDepositDate, 101 ) AS fstrDepositDate";
					strSQL += ", fintHeaderCount AS fintHeaderCount";
					strSQL += ", CONVERT( VARCHAR(20), fcurHeaderAmount ) AS fcurHeaderAmount";
					strSQL += ", fintBatchCount AS fintBatchCount";
					strSQL += ", CONVERT( VARCHAR(20), fcurBatchAmount ) AS fcurBatchAmount";
					strSQL += ", fstrBatchType AS fstrBatchType";
					strSQL += ", fstrForm AS fstrForm";
					strSQL += ", fstrDLN AS fstrDLN";
					strSQL += ", fstrTimelyBatch AS fstrTimelyBatch";
					strSQL += ", fstrBatchStatus AS fstrBatchStatus";
					strSQL += " FROM tblNM_BatchInfo a";
					strSQL += " WHERE a.fstrTaxProgram = '" + strProgCode + "'";
					strSQL += " AND a.fstrBatchID = '" + BatchID.Value + "'";
					strSQL += " AND CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) = '" + BatchDate.Value + "'";
					strSQL += " AND a.fstrImgSrc = '" + ImageSource.Value + "'";

					gc.DoSelect( strSQL );
					dt = new DataTable();
					numRows = gc.ReadSelect( out dt );
					if( numRows > 0 )
					{
						BatchNo.Text = dt.Rows[ 0 ][ "fstrBatchID" ].ToString().Trim();
						BatchDt.Text = dt.Rows[ 0 ][ "fstrBatchDate" ].ToString().Trim();
						ImgSrc.Text = dt.Rows[ 0 ][ "fstrImgSrc" ].ToString().Trim();
						LastOwner.Value = dt.Rows[ 0 ][ "fstrBatchUser" ].ToString().Trim();
						CreateDate.Text = dt.Rows[ 0 ][ "fstrBatchCreated" ].ToString().Trim();
						ReceivedDate.Text = dt.Rows[ 0 ][ "fstrReceivedDate" ].ToString().Trim();
						PostmarkDate.Text = dt.Rows[ 0 ][ "fstrPostmarkDate" ].ToString().Trim();
						DepositDate.Text = dt.Rows[ 0 ][ "fstrDepositDate" ].ToString().Trim();
						BatchCount.Text = dt.Rows[ 0 ][ "fintHeaderCount" ].ToString();
						BatchAmount.Text = dt.Rows[ 0 ][ "fcurHeaderAmount" ].ToString();
						ItemCount.Text = dt.Rows[ 0 ][ "fintBatchCount" ].ToString();
						ItemAmount.Text = dt.Rows[ 0 ][ "fcurBatchAmount" ].ToString();
						BatchType.Text = dt.Rows[ 0 ][ "fstrBatchType" ].ToString().Trim().ToUpper();
						FormType.Text = dt.Rows[ 0 ][ "fstrForm" ].ToString().Trim();
						DLN.Text = dt.Rows[ 0 ][ "fstrDLN" ].ToString().Trim();
						TimelyBatch.Text = dt.Rows[ 0 ][ "fstrTimelyBatch" ].ToString().Trim();
						BatchStatus.Text = dt.Rows[ 0 ][ "fstrBatchStatus" ].ToString().Trim().ToUpper();
						ProgCode.Value = strProgCode;

						if( ( MyUserRole.IsUserInRole( "DEV" ) ) || 
							( MyUserRole.IsUserInRole( "ADMIN" ) && BatchStatus.Text == "O" ) ||
							( MyUserRole.IsUserInRole( "SUPER" ) && BatchStatus.Text == "O" && int.Parse( ItemCount.Text ) < 1 ) )
						{
							ReceivedDate.BackColor = Color.FromArgb( 102, 255, 153 );
							PostmarkDate.BackColor = Color.FromArgb( 102, 255, 153 );
							DepositDate.BackColor = Color.FromArgb( 102, 255, 153 );
							BatchCount.BackColor = Color.FromArgb( 102, 255, 153 );
							BatchAmount.BackColor = Color.FromArgb( 102, 255, 153 );
							BatchType.BackColor = Color.FromArgb( 102, 255, 153 );
							FormType.BackColor = Color.FromArgb( 102, 255, 153 );
							ReadStatus.Value = "style=\"background-color:#66FF99\"";
						}
						else
						{
							ReceivedDate.ReadOnly = true;
							PostmarkDate.ReadOnly = true;
							DepositDate.ReadOnly = true;
							BatchCount.ReadOnly = true;
							BatchAmount.ReadOnly = true;
							BatchType.ReadOnly = true;
							FormType.ReadOnly = true;
							userCMB.Enabled = false;
							ReadStatus.Value = "readonly";
						}

					}
                    if (ImageSource.Value == "MAVRO")
                    {
                        ShowMavroImageLIT.Visible = true;
                        ShowMavroImageLIT.Text = "<a href=MavImgView.aspx?Batch=" + BatchNo.Text + ";" + BatchDt.Text + ";" + ImgSrc.Text + ";" + strProgCode + "> View Mavro Image </a>";
                    }
                    else
                    {
                        ShowMavroImageLIT.Visible = false;
                    }


					/*

					I don't think we really need this, it does the same thing on the KeyEntry page, where we already have the table names
					which makes it easier to do there

					actually we do need this, it checks for the fstrWho when getting batch headers, so we need to put in a blank row if it isn't there
					it will also try to do this in the KeyEntry, for the users who are sent there right away

					*/
					// create the default rows that will be filled, this is required for the retrun selection to work below (selecting from the forms data table)
					// build inserts statements for each table used for this batch
					// an extra reference to rfrControlHeaders to be able to check the form type, and modify the statement accordingly
					strSQL = "SELECT ";
					strSQL += "	'IF NOT EXISTS ( SELECT * FROM ' + ch2.fstrTable ";
					strSQL += "	 + ' WHERE fstrBatchID = ''' + i.fstrBatchID + '''' ";
					strSQL += "	 + ' AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = ''' + CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) + '''' ";
					strSQL += "	 + ' AND flngSequence = ' + CONVERT( VARCHAR(10), i.flngSequence ) ";
					strSQL += "	 + CASE WHEN ch2.fstrFormType LIKE 'R%' THEN ' AND fstrTaxForm = ''' + ch.fstrTaxForm + '''' ELSE '' END ";
					//@#@# trying the image path instead of the possibly duplicated DLN
					strSQL += "	 + CASE WHEN ch2.fstrFormType LIKE '%P' THEN ' AND fstrMPDLN = ''' + i.fstrImagePath + '''' ELSE '' END + ' )' ";
					strSQL += "	 + ' INSERT INTO ' + ch2.fstrTable ";
					strSQL += "	 + ' ( fstrBatchID, fdtmBatchDate, flngSequence, fstrWho ' ";
					// change to include RP type
					strSQL += "	 + CASE WHEN ch2.fstrFormType LIKE 'R%' THEN ', fstrTaxForm' ELSE '' END ";
					strSQL += "	 + CASE WHEN ch2.fstrFormType LIKE '%P' THEN ', fstrMPDLN' ELSE '' END ";
					strSQL += "	 + ' )' + ' VALUES ( ''' + i.fstrBatchID + '''' ";
					strSQL += "	 + ', ''' + CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) + '''' ";
					strSQL += "	 + ', ' +  CONVERT( VARCHAR(10), i.flngSequence ) ";
					strSQL += "	 + ', ''batch''' ";
					// change to include RP type
					strSQL += "	 + CASE WHEN ch2.fstrFormType LIKE 'R%' THEN ', ''' + ch.fstrTaxForm + '''' ELSE '' END ";
					//@#@# trying the image path instead of the possibly duplicated DLN
					strSQL += "	 + CASE WHEN ch2.fstrFormType LIKE '%P' THEN ', ''' + i.fstrImagePath + '''' ELSE '' END + ' )' ";
					strSQL += "FROM ";
					strSQL += "	tblNM_BatchImage i, ";
					strSQL += "	tblNM_BatchInfo b, ";
					strSQL += "	rfrControlHeaders ch, ";
					strSQL += "	rfrReturnHeaders rh, ";
					strSQL += "	rfrControlHeaders ch2 ";
					strSQL += "WHERE ";
					strSQL += "	i.fstrBatchID = '" + BatchID.Value + "' AND ";
					strSQL += "	i.fstrTaxProgram = '" + strProgCode + "' AND ";
					strSQL += "	ISNULL( i.fblnImageBlankSizeCheck, 0 ) = 0 AND ";
					strSQL += "	i.fstrFormName IS NOT NULL AND ";
					strSQL += "	i.fstrFormName = ch.fstrTaxForm AND ";
					strSQL += "	i.fstrTaxProgram = rh.fstrTaxProgram AND ";
					strSQL += "	i.fstrBatchID = b.fstrBatchID AND ";
					strSQL += "	i.fstrTaxProgram = b.fstrTaxProgram AND ";
					strSQL += "	b.fstrForm = CONVERT( VARCHAR(50), rh.flngTaxYear ) AND ";
					strSQL += "	ch.flngBlock = 0 AND ";
					strSQL += "	ch.flngReturnHeadersIDFK = rh.idReturnHeaders AND ";
					strSQL += "	ch2.flngBlock = 1 AND ";
					strSQL += "	ch.flngReturnHeadersIDFK = ch2.flngReturnHeadersIDFK AND ";
					strSQL += "	ch.fstrTaxForm = ch2.fstrTaxForm ";
					strSQL += "ORDER BY ";
					strSQL += "	i.fstrDLN";

					gc.DoSelect( strSQL );
					dt = new DataTable();
					numRows = gc.ReadSelect( out dt );
					// the above statement will create the INSERT statements for all the data tables in this batch/returns
					// loop and execute those statements here
					if( numRows > 0 )
					{
						foreach( DataRow row in dt.Rows )
						{
							gc.DoExecute( row[ 0 ].ToString() );
						}
					}



					//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
					// fill userCMB
					// clean up
                    string statement;
                    userCMB.Items.Clear();
					// one extra owner for everyone
					userCMB.Items.Add( new ListItem( "ALL", "all" ) );
					// we don't have real users, we have windows users
					// but we can get all users in all roles
                    statement = "Select au.LoweredUserName as luName ";
                    statement += "From aspnet_users au, userExpires ue ";
                    statement += "Where ue.userIDFK = au.UserId ";
                    statement += "And Convert( VARCHAR, ue.expires, 20) > Convert( VARCHAR, GetDate(), 20) ";
                    statement += "Order By au.LoweredUserName ";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                            userCMB.Items.Add(new ListItem(row["luName"].ToString()));
                    }

                    
                    

					// select the owner, if there, otherwise we all own it
					if( LastOwner.Value != "" )
						userCMB.SelectedValue = LastOwner.Value.ToLower();
					else
						userCMB.SelectedValue = "all";

					//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
					// set some styles and ReadOnly properties
					if( DLN.Text.Substring( DLN.Text.Length - 1, 1 ) != "1" )
						DLN.BackColor = Color.FromArgb( 255, 153, 153 );

					// readonly
					if( ReadStatus.Value == "readonly" )
					{
						TimelyBatch.ReadOnly = true;
						BatchStatus.ReadOnly = true;
					}
					else
					{
						TimelyBatch.BackColor = Color.FromArgb( 102, 255, 153 );
						// counts are the same, color it
						//@#@# this might be backwards, don't we want to color it if it need attention
						//@#@# what does it mean for the values to be the same?
						if( BatchCount.Text == ItemCount.Text && BatchAmount.Text == ItemAmount.Text )
							BatchStatus.BackColor = Color.FromArgb( 102, 255, 153 );
						else
							BatchStatus.ReadOnly = true;
					}

					//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
					// based on what we just did, update some info text in 'infoLIT'
					if( strBatchMod == "0" )
						infoLIT.Text = "<table><tr bgcolor=\"yellow\"><td>Batch Header Not Updated</td></tr></table>";
					else if( strBatchMod == "1" )
						infoLIT.Text = "<table><tr bgcolor=\"yellow\"><td>" + BatchID.Value + " ** " + BatchType.Text + " has been modified and assigned to <i>" + LastOwner.Value + "</i></td></tr></table>";
					else if( strBatchMod == "3" )
						infoLIT.Text = "<table><tr bgcolor=\"yellow\"><td>Possible FIFO problem/violation. Please close all completed batches for <i>" + newOwner + "</i></td></tr></table>";

					//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
					// check these, if not true, remove the button in panel 'batchModPNL'Get Return
					// original validated in JS, this version validates with ASP controls
					if( !MyUserRole.IsUserInRole( "DEV" ) && !( MyUserRole.IsUserInRole( "ADMIN" ) && BatchStatus.Text == "O" ) && !( MyUserRole.IsUserInRole( "SUPER" ) && BatchStatus.Text == "O" && ItemCount.Text == "0" ) )
					{
						subBTN.Enabled = false;
						batchModPNL.Visible = false;
					}


					//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
					// need the main table, the one used for the first form on the first page in the batch
					strSQL = "SELECT DISTINCT ";
					strSQL += "ch.fstrTable ";
					strSQL += "FROM ";
					strSQL += "rfrControlHeaders ch, ";
					strSQL += "rfrReturnHeaders rh,";
					strSQL += "tblNM_BatchImage i, ";
					strSQL += "tblNM_BatchInfo b ";
					strSQL += "WHERE ";
					strSQL += "i.fstrBatchID = '" + BatchID.Value + "' AND ";
					strSQL += "i.fstrTaxProgram = '" + strProgCode + "' AND ";
					strSQL += "i.fstrFormName IS NOT NULL AND ";
					strSQL += "ISNULL( i.fblnImageBlankSizeCheck, 0 ) = 0 AND ";
					strSQL += "i.fstrBatchID = b.fstrBatchID AND ";
					strSQL += "i.fstrTaxProgram = b.fstrTaxProgram AND ";
					strSQL += "CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) = CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ) AND ";
					strSQL += "RIGHT( i.fstrDLN, 2 ) = '01' AND ";
					strSQL += "b.fstrDLN = i.fstrDLN AND ";
					strSQL += "i.fstrFormName = ch.fstrTaxForm AND ";
					strSQL += "i.fstrTaxProgram = rh.fstrTaxProgram AND ";
					strSQL += "b.fstrForm = CONVERT( VARCHAR(50), rh.flngTaxYear ) AND ";
					strSQL += "ch.flngBlock = 0 AND ";
					strSQL += "rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";

					string strMainReturn = (string)gc.DoScalar( strSQL );

					//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
					// the main select for the items in the batch

					strSQL = "SELECT ";
                    strSQL += "	( CASE WHEN ( ch.fstrTaxForm LIKE '%page 1%'  ) THEN 'id=\"first\"' ELSE 'id=\"next\"' END ) AS fstrRowID, ";
					strSQL += "	'^' + CONVERT( VARCHAR(10), i.flngSequence ) + '&DLN='+ i.fstrDLN +'>' + CONVERT( VARCHAR(10), i.flngSequence ) + '' AS linkStub, ";
					strSQL += "	i.flngSequence AS flngSequence, ";
					strSQL += "	i.fstrImagePath AS imagePath, ";
					strSQL += "	i.fstrImagePath AS popupImage, ";
					strSQL += "	ISNULL( i.fstrID, '' ) AS storedID, ";
					strSQL += "	CONVERT( VARCHAR(10), r.fdtmPostMarkDate, 101 ) AS PostmarkDate, ";
					strSQL += "	0 AS TotalDue, ";
                    if (ImgSrc.Text == "MAVRO") 
                    {
                        strSQL += " CONVERT( VARCHAR(10), r.fcurPayment ) AS PaymentAmount, ";
                    }
                    else
                    {
					   strSQL += "	'0.00' AS PaymentAmount, ";
                    }
					strSQL += "	i.fstrDLN AS DLN, ";
					strSQL += "	i.fstrFormName AS fstrFormName, ";
					strSQL += "	i.fstrFormName AS formNameOnly, ";
					strSQL += "	LOWER( r.fstrWho ) AS lastWho, ";
					strSQL += "	( CASE WHEN ( i.fdtmImageCheckedOut <> '12/31/9999' ) THEN ( CASE WHEN ( i.fdtmImageCheckedIn = '12/31/9999' ) THEN 'CHECKED OUT' ELSE 'KEYED' END ) ELSE 'NOT STARTED' END ) AS BatchStatus, ";
					strSQL += "	'0' AS fstrImageFlag, ";
					strSQL += "	ch.flngClipTop AS cTop, ";
					strSQL += "	ch.flngClipRight AS cRight, ";
					strSQL += "	ch.flngClipBottom AS cBot, ";
					strSQL += "	ch.flngClipLeft AS cLeft, ";
					strSQL += "	'Glass' AS thumb ";
					strSQL += "FROM ";
					strSQL += "	tblNM_BatchImage i, ";
					strSQL += "	tblNM_BatchInfo b, ";
					strSQL += "	" + strMainReturn + " r, ";
					strSQL += "	rfrControlHeaders ch, ";
					strSQL += "	rfrReturnHeaders rh ";
					strSQL += "WHERE ";
                    strSQL += "	i.fstrTaxProgram = '" + strProgCode + "' AND ";
                    strSQL += "	i.fstrBatchID = '" + BatchID.Value + "' AND ";
                    strSQL += "	i.fstrFormName IS NOT NULL AND ";
					strSQL += "	ISNULL( i.fblnImageBlankSizeCheck, 0 ) = 0 AND ";
					strSQL += "	i.fstrBatchID = b.fstrBatchID AND ";
					strSQL += "	i.fstrTaxProgram = b.fstrTaxProgram AND ";
					strSQL += "	CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) = CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ) AND ";
                    strSQL += "	i.fstrBatchID = r.fstrBatchID AND ";
					strSQL += "	i.flngSequence = r.flngSequence AND ";
					strSQL += "	i.fstrFormName = ch.fstrTaxForm AND ";
					strSQL += "	i.fstrTaxProgram = rh.fstrTaxProgram AND ";
					strSQL += "	b.fstrForm = CONVERT( VARCHAR(50), rh.flngTaxYear ) AND ";
					strSQL += "	ch.flngBlock = 0 AND ";
                    strSQL += " ch.fstrTaxForm LIKE '%page 1%' AND ";
					strSQL += "	rh.idReturnheaders = ch.flngReturnHeadersIDFK ";


					// Sort our table accross all unions
					strSQL += "ORDER BY ";
					strSQL += "	DLN ";

					if( strMainReturn != null )
					{
						gc.DoSelect( strSQL );
						dt = new DataTable();
						numRows = gc.ReadSelect( out dt );
					}

					//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
					// show correct info if there are items or not
					if( numRows > 0 && strMainReturn != null )
					{
						// some tweaks to the colunm, since we need to edit them later as they get bound
						for( i = 0; i < dt.Columns.Count; i++ )
						{
							dt.Columns[ i ].ReadOnly = false;
							dt.Columns[ i ].MaxLength = -1;
						}
						batchRPT.DataSource = dt;
						DataBind();
					}
					else
					{
						batchRPT.Visible = false;
						noItemsPNL.Visible = true;
					}

					// leave
					gc.Disconnect();
				}
				catch( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}
			}
		}

		// modify batch header and info
		protected void OnClick_subBTN( object sender, EventArgs e )
		{
			// based on user type and other values, combined with the value of "ReadStatus" (in case they tweaked it)
			// allow an update or not
			// these are the same checks as in the load for setting the ReadStatus value
			// user is DEV
			// user is ADMIN and batch is open
			// user is SUPER and batch is open and batch hasn't been keyed
			if( MyUserRole.IsUserInRole( "DEV" ) || 
				( MyUserRole.IsUserInRole( "ADMIN" ) && BatchStatus.Text == "O" ) || 
				( MyUserRole.IsUserInRole( "SUPER" ) && BatchStatus.Text == "O" && int.Parse( ItemCount.Text ) < 1 ) )
			{
				// also check the ReadStatus value
				if( ReadStatus.Value == "style=\"background-color:#66FF99\"" )
				{
					// make sure the validators worked
					if( !Page.IsValid )
					{
						Response.Write( "<script type=\"text/javascript\">alert( \"There are errors in the header values. Please correct them before continuing.\" );</script>" );
						return;
					}

					// setup for the connection
					GoodConn gc = new GoodConn();
					string strProgCode = (string)ViewState[ "strProgCode" ] ?? "";
					try
					{
#if DEBUG
						gc.Connect( Resources.connString );
#else
						gc.Connect( Resources.prodConnString );
#endif
						string strSQL;
						string strSQL2 = "";

						// build a string for the UPDATE

						// parameterized version
						strSQL = "UPDATE tblNM_BatchInfo SET ";
						strSQL += "fstrBatchUser = '" + userCMB.SelectedValue + "', ";
						strSQL += "fdtmReceivedDate = @recDate, ";
						strSQL += "fdtmPostmarkDate = @postDate, ";
						strSQL += "fdtmDepositDate = @depDate, ";
						strSQL += "fintHeaderCount = @headerCount, ";
						strSQL += "fcurHeaderAmount = @headerAmount, ";
						strSQL += "fstrBatchType = @batchType, ";
						strSQL += "fstrForm = @form ";
						// these may be readonly
						if( !TimelyBatch.ReadOnly )
							strSQL += ", fstrTimelyBatch = @timelyBatch ";
						if( !BatchStatus.ReadOnly )
							strSQL += ", fstrBatchStatus = @batchStatus ";
						// if the selected user is different from the LastOwner, set the assigned date and time
						if( LastOwner.Value != userCMB.SelectedValue )
							strSQL += ", fdtmAssigned = @assigned ";
						strSQL += "WHERE fstrTaxProgram = '" + strProgCode + "' AND ";
						strSQL += "fstrBatchID = @batchID AND ";
						strSQL += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = @batchDate AND ";
						strSQL += "fstrImgSrc = @ImageSource;";
						// set the command and the parameters
						gc.ParamCommand( strSQL );
						gc.SetParam( "@recDate", SqlDbType.DateTime, DateTime.Parse( ReceivedDate.Text ).ToString( "yyyy-MM-dd" ) );
						gc.SetParam( "@postDate", SqlDbType.DateTime, DateTime.Parse( PostmarkDate.Text ).ToString( "yyyy-MM-dd" ) );
						gc.SetParam( "@depDate", SqlDbType.DateTime, DateTime.Parse( DepositDate.Text ).ToString( "yyyy-MM-dd" ) );
						gc.SetParam( "@headerCount", SqlDbType.Int, BatchCount.Text );
						gc.SetParam( "@headerAmount", SqlDbType.Money, BatchAmount.Text );
						gc.SetParam( "@batchType", SqlDbType.VarChar, BatchType.Text );
						gc.SetParam( "@form", SqlDbType.VarChar, FormType.Text );
						// these may be readonly
						if( !TimelyBatch.ReadOnly )
							gc.SetParam( "@timelyBatch", SqlDbType.Char, TimelyBatch.Text );
						if( !BatchStatus.ReadOnly )
							gc.SetParam( "@batchStatus", SqlDbType.Char, BatchStatus.Text );
						// if the selected user is different from the LastOwner, set the assigned date and time
						if( LastOwner.Value != userCMB.SelectedValue )
						{
							gc.SetParam( "@assigned", SqlDbType.DateTime, DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) );
						}
						gc.SetParam( "@batchID", SqlDbType.VarChar, BatchID.Value );
						gc.SetParam( "@batchDate", SqlDbType.DateTime, BatchDate.Value );
						gc.SetParam( "@ImageSource", SqlDbType.VarChar, ImageSource.Value );
						// and execute!
						gc.DoExecutePARAM();

                        // Update QMast and Queue Values
                        strSQL2 = "UPDATE tblKeQMast ";
                        strSQL2 += "SET fstrUserID = '" + userCMB.SelectedValue + "', ";
                        strSQL2 += "fstrTimelyBatch = '" + TimelyBatch.Text + "', ";
                        strSQL2 += "fdtmPostMarkDate = '" + PostmarkDate.Text + "' ";
                        strSQL2 += "WHERE fstrBatchID = '" + BatchID.Value + "' ";
                        strSQL2 += "AND fstrTaxProgram = '" + strProgCode + "' ";
                        gc.DoExecute(strSQL2);

                        strSQL2 = "DELETE tblKeQueue ";
                        strSQL2 += "WHERE fstrBatchID = '" + BatchID.Value + "' ";
                        strSQL2 += "AND fstrTaxProgram = '" + strProgCode + "' ";
                        strSQL2 += "AND fstrUserID <> '" + userCMB.SelectedValue + "' ";
                        gc.DoExecute(strSQL2);
 
                        strSQL2 = "UPDATE tblKeQueue ";
                        strSQL2 += "SET fstrUserID = '" + userCMB.SelectedValue + "', ";
                        strSQL2 += "fstrTimelyBatch = '" + TimelyBatch.Text + "', ";
                        strSQL2 += "fdtmPostMarkDate = '" + PostmarkDate.Text + "' ";
                        strSQL2 += "WHERE fstrBatchID = '" + BatchID.Value + "' ";
                        strSQL2 += "AND fstrTaxProgram = '" + strProgCode + "' ";
                        gc.DoExecute(strSQL2);
						// the LastUser value might get screwey here
						gc.Disconnect();
					}
					catch( Exception ex )
					{
						UtilClass.RecordError( gc, ex );
						gc.Disconnect();
					}

				}	// end ReadStatus check
			}	// end user type and batch status check
		}

		// build special controls and links for each databound row
		protected void BatchRPT_ItemDataBound( object sender, RepeaterItemEventArgs e )
		{
			string strProgCode = (string)ViewState[ "strProgCode" ] ?? "";
			if( e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem )
			{
				DataRowView row = (DataRowView)e.Item.DataItem;


				string uri = "entry/KeyEntry.aspx?";
				// add the query string values
				uri += "Batch=" + BatchID.Value + "&";
				uri += "BatchDate=" + BatchDate.Value + "&";
				uri += "ImageSource=" + ImageSource.Value + "&";
				uri += "TP=" + strProgCode + "&";
				uri += "Sequence=" + row.Row[ "flngSequence" ].ToString() + "&";
				uri += "DLN=" + row.Row[ "DLN" ].ToString();
				// only use the form name on the "next" links
				if( row.Row[ "fstrRowID" ].ToString().IndexOf( "id=\"next\"" ) != -1 )
					uri += "&fstrFormName=" + row.Row[ "formNameOnly" ].ToString();
				uri = Uri.EscapeUriString( uri );
				// wrap the address and put in the sequence number to click on
				( (Literal)e.Item.FindControl( "flngSequenceLIT" ) ).Text = "<a href=\"" + uri + "\">" + row.Row[ "flngSequence" ].ToString() + "</a>";

			}
		}
 	}
}

