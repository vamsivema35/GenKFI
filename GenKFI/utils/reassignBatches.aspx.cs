using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class ReassignBatches : System.Web.UI.Page
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
			strCurrPage = "Reassign Batches";
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
			{
				// fill the users DDLs
				// clean up
				usersFROMDDL.Items.Clear();
				usersFROMDDL.Items.Add( new ListItem( "Select a User", "-1" ) );
				userTODDL.Items.Clear();
				userTODDL.Items.Add( new ListItem( "Select a User", "-1" ) );
				// we don't have real users, we have windows users
				// but we can get all users in all roles
                GoodConn gc = new GoodConn();
                DataTable dt;
                int numRows;
                string statement;

                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
			    	gc.Connect( Resources.prodConnString );
#endif
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
                        {
                            //                           usersDDL.Items.Add(new ListItem(row["luName"].ToString()));
                            usersFROMDDL.Items.Add(new ListItem(row["luName"].ToString()));
                            userTODDL.Items.Add(new ListItem(row["luName"].ToString()));
                        }
                    }
                    gc.Disconnect();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }

				// and load the batches to show
				LoadBatches();
			}
		}

		protected void OnSelectedIndexChanged_usersFROMDDL(object sender, EventArgs e )
		{
			LoadBatches();
			// clear the 2nd DDL
			userTODDL.SelectedIndex = 0;
		}

		private void LoadBatches()
		{
			string strSQL = "";
			GoodConn gc = new GoodConn();
			DataTable dt = new DataTable();
			int numRows = 0;

			try
			{
				Response.BufferOutput = true;
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				strSQL = "SELECT COUNT( * ) AS BatchCount";
				strSQL += ", ISNULL( SUM( a.fintHeaderCount ), 0 ) AS HeaderTotal";
				strSQL += ", ISNULL( SUM( a.fintBatchCount ), 0 ) AS ItemTotal";
				strSQL += " FROM tblNM_BatchInfo a";
				strSQL += " WHERE a.fstrBatchStatus = 'O'";
				strSQL += " AND a.fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", "', '" ) + "' )";
				strSQL += " AND a.fstrBatchUser = '" + usersFROMDDL.SelectedItem.Text + "'";

				dt = new DataTable();
				gc.DoSelect( strSQL );
				numRows = gc.ReadSelect( out dt );

				if( numRows > 0 )
				{
					batchCountLIT.Text = dt.Rows[ 0 ][ "BatchCount" ].ToString();
					headerTotalLIT.Text = dt.Rows[ 0 ][ "HeaderTotal" ].ToString();
					ItemTotalLIT.Text = dt.Rows[ 0 ][ "ItemTotal" ].ToString();
				}

				strSQL = "SELECT LTRIM( RTRIM( a.fstrBatchID ) ) + ';' + CONVERT( VARCHAR(10), a.fdtmBatchDate ,101 ) + ';' + a.fstrImgSrc + ';' + a.fstrTaxProgram AS ckbVal";
				strSQL += ", a.fstrTaxProgram AS TaxProgram";
				strSQL += ", LTRIM( RTRIM( a.fstrBatchID ) ) + ';' + CONVERT( VARCHAR(10), a.fdtmBatchDate ,101 ) + ';' + a.fstrImgSrc + ';' + a.fstrTaxProgram AS batchLink";
				strSQL += ", a.fstrBatchID AS BatchID";
				strSQL += ", CONVERT( VARCHAR(10), a.fdtmBatchDate, 101 ) AS BatchDate";
				strSQL += ", a.fstrImgSrc AS ImageSource";
				strSQL += ", (a.fstrForm + ' ' + LTRIM(RTRIM(a.fstrBatchType))) AS BatchType";
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
				strSQL += " WHERE a.fstrBatchStatus = 'O'";
				strSQL += " AND a.fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", "', '" ) + "' )";
				strSQL += " AND a.fstrBatchUser = '" + usersFROMDDL.SelectedItem.Text + "'";
				strSQL += " ORDER BY a.fdtmAssigned ASC, a.fdtmBatchDate, a.fstrBatchID";
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
					noBatchPNL.Visible = false;

				}
				// no batches
				else
				{
					batchRPT.Visible = false;
					noBatchPNL.Visible = true;
					noBatchLBL.Text = "Please select a user with assigned batches.";
				}

				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnClick_reassignBTN( object sender, EventArgs e )
		{
			string strChecked = Request.Form[ "assignMe" ];
			// nothing checked, no user selected, leave
			if( strChecked == null || usersFROMDDL.SelectedValue == "-1" || userTODDL.SelectedValue == "-1" )
				return;

			// if there was anything checked, assign those batches to the selected user
			if( strChecked != "" )
			{
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif

					string[] strCheckedList = strChecked.Split( ',' );
					string statement = "";
					foreach( string s in strCheckedList )
					{
						// fstrBatchID ; fdtmBatchDate ';' fstrImgSrc ; fstrTaxProgram
						string[] info;
						info = s.Split( ';' );
						statement = "UPDATE tblNM_BatchInfo SET fstrBatchUser = '" + userTODDL.SelectedItem.Text + "', ";
						statement += "fdtmAssigned = '" + DateTime.Now.ToString( "yyyy-MM-dd HH:mm:ss" ) + "' ";
						statement += "WHERE fstrBatchID = '" + info[ 0 ] + "' AND ";
						statement += "fstrTaxProgram = '" + info[ 3 ] + "' AND ";
						statement += "fdtmBatchDate = '" + info[ 1 ] + "' AND ";
						statement += "fstrImgSrc = '" + info[ 2 ] + "' AND ";
						statement += "fstrBatchUser = '" + usersFROMDDL.SelectedItem.Text + "';";
						gc.DoExecute( statement );
						// we also need to udpate the queue, so the new user can start where the old one left off
						statement = "UPDATE tblKeQueue SET fstrUserID = '" + userTODDL.SelectedItem.Text + "' ";
						statement += "WHERE fstrBatchID = '" + info[ 0 ] + "' AND ";
						statement += "fstrTaxProgram = '" + info[ 3 ] + "';";
						gc.DoExecute( statement );
					}
					gc.Disconnect();

					// and reload to reflect the changes
					LoadBatches();
					// clear the 2nd DDL
					userTODDL.SelectedIndex = 0;
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