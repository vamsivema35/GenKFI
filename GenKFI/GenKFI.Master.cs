using System;
using System.Data;
using System.Web.UI.WebControls;
using System.Threading;
using GenKFI.Properties;


namespace GenKFI
{

    public partial class GenKFI : System.Web.UI.MasterPage
	{
        
		protected override void OnInit( EventArgs e )
		{
			base.OnInit( e );

			// if it's null, get the first tax program
			if( Session[ "tpSelHID" ] == null )
			{
				
				// admins they don't want all selected by default, so only give them PIT, we'll always have PIT
				if( !MyUserRole.IsUserInRole( "USER" ) )
					Session[ "tpSelHID" ] = "PIT";
				// users can see all, regardless of which they are allowed, that is no longer used
				else
				{

					GoodConn gc = new GoodConn();
					try
					{
#if DEBUG
						gc.Connect( Resources.connString );
#else
						gc.Connect( Resources.prodConnString );
#endif
						// limit to the tax programs they are allowed to see, and not removed
						// let admins see them all, don't limit by userProgCode table
						string statement = "SELECT p.progCode FROM progCodes p";
						statement += " WHERE p.removed = 0 ORDER BY p.progCode ASC;";
						DataTable dt = new DataTable();
						gc.DoSelect( statement );
						int numRows = gc.ReadSelect( out dt );
						string sel = "ALL;";
						if( numRows > 0 )
						{
							foreach( DataRow row in dt.Rows )
								sel += row[ "progCode" ].ToString() + ";";
						}

						Session[ "tpSelHID" ] = sel;
						gc.Disconnect();
					}
					catch( Exception ex )
					{
						UtilClass.RecordError( gc, ex );
						gc.Disconnect();
						Session[ "tpSelHID" ] = "";
					}
				}
			}
		}

		// this runs after the content pages Page_Load, where the Session value is set
		protected void Page_Load( object sender, EventArgs e )
		{
			if( Session[ "homeLink" ] != null )
				homeBTN.PostBackUrl = Session[ "homeLink" ].ToString();
			else
				homeBTN.PostBackUrl = "Default.aspx";

			// check for and save selected TP's
			if( tpSelHID.Value != "" )
				Session[ "tpSelHID" ] = tpSelHID.Value;
			// check in the session and save it, if needed
			else if( Session[ "tpSelHID" ] != null )
				tpSelHID.Value = Session[ "tpSelHID" ].ToString();
			// just to make sure we don't get DNE errors
			else
				Session[ "tpSelHID" ] = "";

			// init
			if( Session[ "userRedir" ] == null )
				Session[ "userRedir" ] = true;
			if( Session[ "keyMode" ] == null )
				Session[ "keyMode" ] = false;

//#if DEBUG
//			string script = "<script type=\"text/javascript\">";
//			script += "$(document).ready(function(){ ";
//			script += "$( 'body' ).css( 'background-image', 'url(" + ResolveClientUrl( "~/images/dev.png" ) + " )' );";
//			script += "$( 'body' ).css( 'background-repeat', 'repeat-y' );";
//			script += "} );</script>";
//			Page.ClientScript.RegisterStartupScript( this.GetType(), "backgroundset", script );
//#endif
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@ Try here to check is a user is USER, and redirect to KeyEntry.aspx, with the appropriate values in the Session
			//@ and/or ViewState required to get to the next form to key, this might be moved later, but just text it here now
			//@ 2013-12-04 added Session value check for admins and supers wanting to use key mode
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@# TESTING
			//@#@# ScriptManager.RegisterStartupScript( this.Page, this.Page.GetType(), "alert", "alert( \"myUserRole.IsUserInRole( \\\"USER\\\" ) = " + myUserRole.IsUserInRole( "USER" ) + "\" );", true );
			if( MyUserRole.IsUserInRole( "USER" ) || (bool)Session[ "keyMode" ] == true )
			{
				GoodConn gc = new GoodConn();
				try
				{
#if DEBUG
					gc.Connect( Resources.connString );
#else
					gc.Connect( Resources.prodConnString );
#endif
					string statement = "SELECT ";
					statement += "	b.fstrBatchID, ";
					statement += "	CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ), ";
					statement += "	b.fstrImgSrc, ";
					statement += "	b.fstrTaxProgram, ";
					statement += "	i.flngSequence, ";
					statement += "	i.fstrDLN ";
					statement += "FROM ";
					statement += "	tblNM_BatchImage i, ";
					statement += "	tblNM_BatchInfo b, ";
					statement += "	rfrControlHeaders ch, ";
					statement += "	rfrReturnHeaders rh ";
					statement += "WHERE ";
					statement += "	i.fstrBatchID = b.fstrBatchID AND ";
					statement += "	i.fstrTaxProgram = b.fstrTaxProgram AND ";
					statement += "	i.fstrFormName IS NOT NULL AND ";
					statement += "	ISNULL( i.fblnImageBlankSizeCheck, 0 ) = 0 AND ";
					statement += "	i.fstrBatchID = b.fstrBatchID AND ";
					statement += "	i.fstrTaxProgram = b.fstrTaxProgram AND ";
					statement += "	CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) = CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ) AND ";
					statement += "	( i.fdtmImageCheckedOut <> '12/31/9999' OR i.fdtmImageCheckedOut IS NULL ) AND ";
					statement += "	i.fdtmImageCheckedIn = '12/31/9999' AND ";
					statement += "	i.fstrFormName = ch.fstrTaxForm AND ";
					statement += "	i.fstrTaxProgram = rh.fstrTaxProgram AND ";
					statement += "	b.fstrBatchStatus = 'O' AND ";
					statement += "	b.fstrForm = CONVERT( VARCHAR(50), rh.flngTaxYear ) AND ";
					statement += "	ch.flngBlock = 0 AND ";
					//@#@#statement += "	RIGHT( i.fstrDLN, 2 ) = '01' AND ";
					//@#@#statement += "	ch.fstrTaxForm LIKE '%page 1%' AND ";
					// use the current user name here, whether the real user or an impersonation
					statement += "	b.fstrBatchUser = '" + MyUserRole.UserName() + "' AND ";
					statement += "	ch.flngReturnHeadersIDFK = rh.idReturnHeaders ";
					statement += "ORDER BY ";
					statement += "	b.fdtmAssigned ASC, ";		// this will force FIFO, so if a batch with an older date or lower batch ID won't get pulled next
					statement += "	b.fdtmBatchDate, ";
					statement += "	b.fstrBatchID, ";
					statement += " 	i.flngSequence;";

					gc.DoSelect( statement );
					DataTable dt = new DataTable();
					int numRows = gc.ReadSelect( out dt );

                    string SeqNum2 = null;
                    if (numRows > 0)
                        SeqNum2 = dt.Rows[0][4].ToString();

                    // default no message
                    Session[ "noticeText" ] = "";
					// if there are no batches queued, and this person is a user
					if( numRows == 0 && MyUserRole.IsUserInRole( "USER" ))
						Session[ "noticeText" ] = "You have no more returns queued. Please speak to your supervisor to queue more batches.";

					// if keymode is on
					if( (bool)Session[ "keyMode" ] == true )
					{
                        // and there are batches queued, and keymode is on
                        if (numRows > 0)
                        {
                            // this will give us the batch ID and related info, but there might be a 
                            // sequence number left in the queue, check for that and adjsut if needed
                            statement = "SELECT ";
                            statement += "	flngSequence ";
                            statement += "FROM tblKeQueue WHERE ";
                            statement += "	fstrBatchID = '" + dt.Rows[0][0].ToString() + "' AND ";
                            statement += "	fstrTaxProgram = '" + dt.Rows[0][3].ToString() + "' AND ";
                            //@#@# TESTING
                            //@#@# ScriptManager.RegisterStartupScript( this.Page, this.Page.GetType(), "alert", "alert( \"Session[ \\\"impersonating\\\" ] = " + ( Session[ "impersonating" ] != null ? Session[ "impersonating" ].ToString() : "null" ) + "\" );", true );
                            statement += "	fstrUserID = '" + MyUserRole.UserName() + "' AND ";
                            statement += "	fstrStatus <> 'K' ";
                            statement += "ORDER BY fstrFormName, flngSequence;";
                            gc.DoSelect(statement);
                            DataTable tt = new DataTable();
                            numRows = gc.ReadSelect(out tt);

                            string SeqNum = null;
                            if (numRows > 0)
                                SeqNum = tt.Rows[0][0].ToString();


                            // redirect to the entry page
                            string newQS = "?Batch=" + dt.Rows[0][0].ToString();
                            newQS += "&BatchDate=" + dt.Rows[0][1].ToString();
                            newQS += "&ImageSource=" + dt.Rows[0][2].ToString();
                            newQS += "&TP=" + dt.Rows[0][3].ToString();
                            if (SeqNum != null)
                            {
                                if (int.Parse(SeqNum) < int.Parse(SeqNum2))
                                    newQS += "&Sequence=" + SeqNum;
                                else
                                    newQS += "&Sequence=" + SeqNum2;
                            }
                            else
                                newQS += "&Sequence=" + SeqNum2;

                            newQS += "&DLN=" + dt.Rows[ 0 ][ 5 ].ToString();
							// store that we redirected
							Session[ "userRedir" ] = true;
							Session[ "noticeText" ] = "";
							gc.Disconnect();
							Response.Redirect( ResolveClientUrl( "~/utils/entry/KeyEntry.aspx" ) + newQS, true );
						}
						else
						{
							// go to default page, if not already redirected here
							if( (bool)Session[ "userRedir" ] == true )
							{
								gc.Disconnect();
								Session[ "userRedir" ] = false;

								// change this to always turn off keyMode, and only show message if they are a user?
								Session[ "keyMode" ] = false;
								if( MyUserRole.IsUserInRole( "USER" ) )
									Session[ "noticeText" ] = "You have no more returns queued. Please speak to your supervisor to queue more batches.";
								else
									Session[ "noticeText" ] = "";


								/*
								if( Session["keyMode"] != null && (bool)Session["keyMode"] == false)
									Session[ "noticeText" ] = "You have no more returns queued. Please speak to your supervisor to queue more batches.";
								else if( Session[ "keyMode" ] != null && (bool)Session[ "keyMode" ] == true )
								{
									Session[ "noticeText" ] = "";
									Session[ "keyMode" ] = false;
								}
								*/
								Response.Redirect( ResolveClientUrl( "~/Default.aspx" ), true );
							}

						}
					}

					if( (string)Session[ "noticeText" ] != null && (string)Session[ "noticeText" ] != "" )
						userNoticeLBL.Text = (string)Session[ "noticeText" ];

					gc.Disconnect();
				}
				catch( ThreadAbortException tex )
				{
                    object kkex = tex;
                    //gc.disconnect();
                }
                catch ( Exception ex )
				{
					UtilClass.RecordError( gc, ex );
					gc.Disconnect();
				}
			}
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
			//@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

			// if this is from the tax program selector, refresh to the content page will have the values in Session
			// cancel processing this page, it will get reloaded if we do this anyway
			if( Request[ "__EVENTTARGET" ] != null && Request[ "__EVENTTARGET" ].ToString() == tpSelHID.ClientID )
				Response.Redirect( Request.Url.AbsolutePath, false );

			if( !IsPostBack )
			{

				if( (string)Session[ "noticeText" ] != null && (string)Session[ "noticeText" ] != "" )
					userNoticeLBL.Text = (string)Session[ "noticeText" ];

				FillTPList();
			}
		}

		protected void FillTPList()
		{
			GoodConn gc = new GoodConn();
			try
			{
#if DEBUG
				gc.Connect( Resources.connString );
#else
				gc.Connect( Resources.prodConnString );
#endif
				// limit to the tax programs they are allowed to see, and not removed
				// let admins see them all, don't limit by userProgCode table
				// let everyone see them all
				string statement = "SELECT p.progCode FROM progCodes p WHERE p.removed = 0 ORDER BY p.progCode;";
				/*
				string statement = "SELECT p.progCode FROM progCodes p";
				if( myUserRole.IsUserInRole( "ADMIN" ) || myUserRole.IsUserInRole( "DEV" ) )
					statement += " WHERE p.removed = 0 ORDER BY p.progCode;";
				else
				{
					//@#@# TESTING
					//@#@# ScriptManager.RegisterStartupScript( this.Page, this.Page.GetType(), "alert", "alert( \"Session[ \\\"impersonating\\\" ] = " + ( Session[ "impersonating" ] != null ? Session[ "impersonating" ].ToString() : "null" ) + "\" );", true );
					statement += ", userProgCode u WHERE p.removed = 0 AND p.idProgCodes = u.progcodeIDFK AND u.userIDFK = ( SELECT UserID FROM aspnet_Users WHERE UserName = '" + myUserRole.UserName() + "' ) ORDER BY p.progCode;";
				}
				*/

				gc.DoSelect( statement );
				DataTable dt = new DataTable();
				int numRows = gc.ReadSelect( out dt );
				if( numRows > 0 )
				{
					tpSEL.Items.Clear();
					tpSEL.Items.Add( new ListItem( "(ALL)", "ALL" ) );
					string sBuff = "";
					if( Session[ "tpSelHID" ] != null )
						sBuff = Session[ "tpSelHID" ].ToString().Replace( "ALL;", "" );
					foreach( DataRow row in dt.Rows )
					{
						tpSEL.Items.Add( new ListItem( row[ 0 ].ToString(), row[ 0 ].ToString() ) );
						// check for selected
						// if there are none selected, select them all
						if( sBuff.IndexOf( row[ 0 ].ToString() ) != -1 || sBuff.Length == 0 )
							tpSEL.Items[ tpSEL.Items.Count - 1 ].Selected = true;
					}
					if( sBuff.Length == 0 )
						tpSEL.Items[ 1 ].Selected = true;
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
