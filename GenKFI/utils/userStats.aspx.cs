using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class userStats : System.Web.UI.Page
	{
		//string strProgCode;
		//string strProgLang;
		string strCurrPage;
		bool oneUser;

		protected void Page_Load( object sender, EventArgs e )
		{

			if( !Page.ClientScript.IsStartupScriptRegistered( "keypressDate1" ) )
			{
				string forceName = @"$(document).ready(function(){
									$('#" + beginDateTXT.ClientID + @"').keyup( function(){ fmtDate(this,this); } ); });";
				ScriptManager.RegisterStartupScript( Page, Page.GetType(), "keypressDate1", forceName, true );
			}
			if( !Page.ClientScript.IsStartupScriptRegistered( "keypressDate2" ) )
			{
				string forceName = @"$(document).ready(function(){
									$('#" + endDateTXT.ClientID + @"').keyup( function(){ fmtDate(this,this); } ); });";
				ScriptManager.RegisterStartupScript( Page, Page.GetType(), "keypressDate2", forceName, true );
			}

			if( !IsPostBack )
			{
				#region common load code

				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
				//@#@# common code on all pages
				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#


				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
				// this is the only thing that changes across pages
				strCurrPage = "User Stats";
				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
				Session[ "kstrcurrPage" ] = strCurrPage;
				( (Literal)Master.FindControl( "titleLIT" ) ).Text = UtilClass.NormalizeUN( Context.User.Identity.Name ) + " : GenKFI Tax Programs - " + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + Roles.GetRolesForUser( MyUserRole.UserName() )[ 0 ];
				( (Literal)Master.FindControl( "headerLIT" ) ).Text = Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", ", " ) + " : " + strCurrPage;

				UtilClass ec = new UtilClass();
				ec.AdminOnly( strCurrPage );
				Response.BufferOutput = true;

				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
				//@#@# common code on all pages
				//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

				#endregion

				string BatchOwner;
				if( ViewState[ "userCMB" ] != null )
					BatchOwner = ViewState[ "userCMB" ].ToString();
				else
					BatchOwner = userCMB.SelectedValue;

                GoodConn gc = new GoodConn();
                DataTable dt;
                int numRows;
                string statement;

				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif

					// fill userCMB
					// clean up
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
                        foreach(DataRow row in dt.Rows)
                           userCMB.Items.Add( new ListItem (row["luName"].ToString() ) );
                    }
                    gc.Disconnect();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }

				// select the owner, if there, otherwise we all own it
				if( BatchOwner != "" )
    				userCMB.SelectedValue = BatchOwner.ToLower();
				else
					userCMB.SelectedValue = "all";

					// also load the default table
				if( !IsPostBack )
					LoadTable();

			}
		}

		protected void OnClick_subBTN( object sender, EventArgs e )
		{
			LoadTable();
		}

		private void LoadTable()
		{

			// if there are no dates, restrict to today
			if( beginDateTXT.Text == "" && endDateTXT.Text == "" )
			{
				beginDateTXT.Text = DateTime.Today.ToString( "MM/dd/yy" );
				endDateTXT.Text = DateTime.Today.ToString( "MM/dd/yy" );
			}

			ViewState[ "userCMB" ] = userCMB.SelectedValue;
			ViewState[ "beginDateTXT" ] = beginDateTXT.Text.Trim();
			ViewState[ "endDateTXT" ] = endDateTXT.Text.Trim();

			Response.BufferOutput = true;
			string strSQL = "";
			GoodConn gc = new GoodConn();
			DataTable dt = new DataTable();
			int numRows = 0;

			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif

				// Page specific or unique declarations should come below this line.
				// sanitize these since they are checked and modified too much later to parameterize
				string BatchOwner = UtilClass.Sanitize( userCMB.SelectedValue );
				string BeginDate = UtilClass.Sanitize( beginDateTXT.Text.Trim() );
				string EndDate = UtilClass.Sanitize( endDateTXT.Text.Trim() );


				string strBatchOwner = "";
				string strBeginDate = "";
				string strEndDate = "";

				if( ( BatchOwner == "all" ) || ( BatchOwner == "" ) )
				{
					strBatchOwner = "";
					oneUser = false;
				}
				else
				{
					strBatchOwner = " AND fstrWhoFinished = '" + BatchOwner + "'";
					oneUser = true;
				}

				// verify the dates are accurate and valid
				DateTime d;
				double d2;
				if( BeginDate == "" )
					strBeginDate = "";
				else if( DateTime.TryParse( BeginDate, out d ) )
					strBeginDate = " AND fdtmWhenFinished >= '" + d.ToString( "MM/dd/yyyy" ) + " 00:00:00 AM'";
				else if( double.TryParse( BeginDate, out d2 ) )
					strBeginDate = " AND fdtmWhenFinished >= '" + DateTime.Today.AddDays( d2 ).ToString( "MM/dd/yyyy" ) + " 00:00:00 AM'";
				else
					strBeginDate = "";

				if( EndDate == "" )
					strEndDate = "";
				else if( DateTime.TryParse( EndDate, out d ) )
					strEndDate = " AND fdtmWhenFinished <= '" + d.ToString( "MM/dd/yyyy" ) + " 11:59:59 PM'";
				else if( double.TryParse( EndDate, out d2 ) )
					strEndDate = " AND fdtmWhenFinished <= '" + DateTime.Today.AddDays( d2 ).ToString( "MM/dd/yyyy" ) + " 11:59:59 PM'";
				else
					strEndDate = "";



				// this is the general "get all", replacements below for the single user case
				strSQL = "SELECT ";
				strSQL += "	COUNT( DISTINCT ( fstrBatchID + CONVERT( VARCHAR, flngSequence ) ) ) AS 'ReturnsKeyed', ";		// since each return is in a batch and sequence, combining them gives us single batches,
				strSQL += "	ISNULL( fstrTaxProgram, 'UNKNOWN' ) AS taxProg, ";												// and to get around the fact that they have multiple forms/blocks, count the distinct values, super!
				strSQL += "	ISNULL( fstrWhoFinished, 'UNKNOWN' ) AS fstrWho ";
				strSQL += "FROM	";
				strSQL += "	tblKeQMast ";
				strSQL += "WHERE ";
				// non-empty whoFinished
				strSQL += "	fstrWhoFinished <> '' AND ";
				// in the tax programs we want
				strSQL += " fstrTaxProgram IN ( '" + Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" ).Replace( ";", "', '" ) + "' ) ";
				// other filters
				strSQL += strBatchOwner + strBeginDate + strEndDate;
				// grouped by the tax program and person
				strSQL += "GROUP BY fstrTaxProgram, fstrWhoFinished ORDER BY fstrWhoFinished;";

				// if this is for a single user, replace some things to get daily entries by tax program
				if( strBatchOwner != "" )
				{
					strSQL = strSQL.Replace( "ISNULL( fstrWhoFinished, 'UNKNOWN' ) AS fstrWho", "CONVERT( VARCHAR(10), fdtmWhenFinished, 101 ) AS OpenedDate" );
					strSQL = strSQL.Replace( ", fstrWhoFinished ORDER BY fstrWhoFinished;", ", CONVERT( VARCHAR(10), fdtmWhenFinished, 101 ) ORDER BY OpenedDate;" );
				}

				gc.DoSelect( strSQL );
				dt = new DataTable();
				numRows = gc.ReadSelect( out dt );

				// if we have a return, build the table and put it in the right place
				usersRPT.DataSource = null;
				usersRPT.DataBind();

				if( numRows > 0 )
				{
					usersRPT.DataSource = dt;
					usersRPT.DataBind();
					usersRPT.Visible = true;
					noUserPNL.Visible = false;
				}
				else
				{
					noBatchLBL.Text = "No \"" + strCurrPage + "\" batches found.";
					usersRPT.Visible = false;
					noUserPNL.Visible = true;
				}
				gc.Disconnect();
			}
			catch( Exception ex )
			{
				UtilClass.RecordError( gc, ex );
				gc.Disconnect();
			}
		}

		protected void OnItemDataBound_usersRPT( object sender, RepeaterItemEventArgs e )
		{
			if( e.Item.ItemType == ListItemType.Header )
			{
				// set the other columns header
				if( !oneUser )
					( (Label)e.Item.FindControl( "batchOwnerLBL" ) ).Text = "Batch User";
				else
					( (Label)e.Item.FindControl( "batchOwnerLBL" ) ).Text = "Date Keyed";

			}
			else if( e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem )
			{
				// and set the link button command for the function below
				// really only need to save the username, for the function below to set
				string colName = ( (DataRowView)e.Item.DataItem ).DataView.Table.Columns[ 2 ].ColumnName;
				( (LinkButton)e.Item.FindControl( "uNameLNK" ) ).Text = ( (DataRowView)e.Item.DataItem ).Row[ 2 ].ToString();
				if( colName == "fstrWho" )
				{
					( (LinkButton)e.Item.FindControl( "uNameLNK" ) ).CommandArgument = ( (DataRowView)e.Item.DataItem ).Row[ 2 ].ToString();
					( (LinkButton)e.Item.FindControl( "uNameLNK" ) ).Enabled = true;
				}
				else if( colName == "OpenedDate")
				{
					( (LinkButton)e.Item.FindControl( "uNameLNK" ) ).CommandArgument = "";
					( (LinkButton)e.Item.FindControl( "uNameLNK" ) ).Enabled = false;
				}
			}
		}

		protected void OnCommand_uNameLNK( object sender, CommandEventArgs e )
		{
			if( Roles.GetRolesForUser( e.CommandArgument.ToString() ).Length > 0 )
			{
				userCMB.SelectedValue = e.CommandArgument.ToString().ToLower();
				ViewState[ "userCMB" ] = e.CommandArgument.ToString().ToLower();
				LoadTable();
			}
		}
	}
}