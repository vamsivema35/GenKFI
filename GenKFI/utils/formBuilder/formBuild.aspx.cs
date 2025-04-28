using GenKFI.Properties;
using System;
using System.Data;
using System.Text;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class FormBuild : Page
    {

        string strCurrPage;


        protected void Page_Load(object sender, EventArgs e)
        {
            #region common load code

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            //@#@# common code on all pages
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            // this is the only thing that changes across pages
            strCurrPage = "Form Builder";
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            Session["kstrcurrPage"] = strCurrPage;
            Session["homeLink"] = "Default.aspx";

            UtilClass ec = new UtilClass();
            ec.ErrorRedir(this);
            ec.AdminOnly(strCurrPage);
            Response.BufferOutput = true;

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            //@#@# common code on all pages
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

            #endregion

            // we are given the control header ID, save it in the viewstate for access later
            ViewState["chID"] = Request.QueryString["headerID"].ToString();
            ((HiddenField)Master.FindControl("hidLand")).Value = Request.QueryString["land"].ToString();


            // register script that will reapply the jQuery events on any postback, full or partial
            if (!Page.ClientScript.IsStartupScriptRegistered(controlInfoUPD.GetType(), "initAcc"))
            {
                string activePane = controlEditActive.Value;
                activePane = (activePane != "" ? activePane : "1");
                string initAcc = @"$('#controlEdit').accordion(
							{ heightStyle:""fill"", 
							active: " + activePane + @", 
							activate: function(event, ui){
									$('#" + controlEditActive.ClientID + @"').val($('#controlEdit').accordion('option','active'));
								},
							collapsible: true
							});
							";
                ScriptManager.RegisterStartupScript(controlInfoUPD, controlInfoUPD.GetType(), "initAcc", initAcc, true);
            }
            if (!Page.ClientScript.IsStartupScriptRegistered("lockMove"))
            {
                string lockMove = @"$('#" + lockMoveCKB.ClientID + @"').click(function(event)
							{
								locked =! locked;
								checkLock();
							});
							function checkLock()
							{
								if( !$('#" + lockMoveCKB.ClientID + @"').attr( 'checked' ) )
									$('.moveRow').animate({ backgroundColor: '#FFFFFF' }, ""slow"");
								else
									$('.moveRow').animate({ backgroundColor: '#777777' }, ""slow"");
							}
							checkLock();
							";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "lockMove", lockMove, true);
            }
            if (!Page.ClientScript.IsStartupScriptRegistered("showClip"))
            {
                string showClip = @"$('#showClip').on(""click"", function()
									{
										var op = $('#" + clipDIV.ClientID + @"').css('opacity');
										if(op == ""0.5"")
										{
											$('#" + clipDIV.ClientID + @"').css({ opacity: 0 });
											$('#" + clipDIV.ClientID + @"').css( ""z-index"", -1 );
										}
										else
										{
											$('#" + clipDIV.ClientID + @"').css({ opacity: 0.5 });
											$('#" + clipDIV.ClientID + @"').css( ""z-index"", 2 );
											$('#" + clipDIV.ClientID + @"').animate( {
												top: $('#" + clipDIV.ClientID + @"').offset().top - $('#divImageDrag').position().top,
												left: $('#" + clipDIV.ClientID + @"').offset().left - $('#divImageDrag').position().left 
											} );
											CtlMove(0);
											moveStuff($(""#hidLand"").val(),0,0,true,10,105,true);
										}
									});
									";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "showClip", showClip, true);
            }
            if (!Page.ClientScript.IsStartupScriptRegistered("useValsClip"))
            {
                string useValsClip = @"$('#useValsClip').on(""click"", function()
									{
										$('#" + clipDIV.ClientID + @"').animate( { 
										top: parseInt( $('#" + clipTopTXT.ClientID + @"' ).val() ) + parseInt($('#divImageDrag').offset().top),
										left: parseInt( $('#" + clipLeftTXT.ClientID + @"' ).val() ) + parseInt($('#divImageDrag').offset().left),
										height: parseInt( $('#" + clipBotTXT.ClientID + @"' ).val() ) - parseInt( $('#" + clipTopTXT.ClientID + @"' ).val() ),
										width: parseInt( $('#" + clipRightTXT.ClientID + @"' ).val() ) - parseInt( $('#" + clipLeftTXT.ClientID + @"' ).val() ) }
										);
									});
									";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "useValsClip", useValsClip, true);
            }

            if (!Page.ClientScript.IsStartupScriptRegistered("divControls"))
            {
                string useValsClip = @"$('#divControls').height(""92%"");";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "divControls", useValsClip, true);
            }

            if (!Page.ClientScript.IsStartupScriptRegistered("controlSlide"))
            {
                string controlSlide = @"if( $('#isHidden').val() == '0' ) $('#controlEdit').css( 'display', 'none' );";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "controlSlide", controlSlide, true);
            }

            if (!Page.ClientScript.IsStartupScriptRegistered("sizerDiv"))
            {
                string sizerDiv = @"$('#ctrlSizer').height( $('#divControls').height() + parseInt( $('#" + ((HiddenField)Master.FindControl("maxScrl")).ClientID + @"').val() ) );";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "sizerDiv", sizerDiv, true);
            }

            if (!Page.ClientScript.IsStartupScriptRegistered("forceName"))
            {
                string forceName = @"$('#" + inputIDTXT.ClientID + @"').keyup(function()
											{var ddl = $('#" + typeDDL.ClientID + @"').val();
											if($('#" + inputIDTXT.ClientID + @"').val().substring(0, 3) != ddl)
												$('#" + inputIDTXT.ClientID + @"').val(ddl + $('#" + inputIDTXT.ClientID + @"').val());
											});
											";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "forceName", forceName, true);

            }

            // for some JS on the master, set the type
            ((HiddenField)Master.FindControl("typeHID")).Value = "build";

            if (!IsPostBack)
            {
                // also check if we have a template image to load
                GoodConn gc = new GoodConn();
                string statement = "";
                DataTable dt = new DataTable();
                int numRows = 0;
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                    // get header info
                    // return header, control header
                    // header info
                    statement = "SELECT rh.fstrFileType, rh.fstrTaxProgram, rh.flngTaxYear, ";
                    statement += "ch.fstrTaxForm, ch.flngBlock, ch.fstrTable, ";
                    // type and/or repeater info
                    statement += "ch.fstrFormType, ch.flngRepeatOffset, ch.flngHeaderStart, ";
                    // clip values
                    statement += "ch.flngClipTop, ch.flngClipRight, ch.flngClipBottom, ch.flngClipLeft, ";
                    statement += "ch.fintZoomPerc ";
                    statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                    statement += "WHERE ch.idControlHeaders = " + ViewState["chID"].ToString();
                    statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    // we know this has one row, but for consistency do the check anyway
                    if (numRows > 0)
                    {
                        // header info
                        fileTypeTXT.Text = dt.Rows[0]["fstrFileType"].ToString();
                        taxProgTXT.Text = dt.Rows[0]["fstrTaxProgram"].ToString();
                        taxYearTXT.Text = dt.Rows[0]["flngTaxYear"].ToString();
                        FormTxt.Text = dt.Rows[0]["fstrTaxForm"].ToString();
                        BlkTxt.Text = dt.Rows[0]["flngBlock"].ToString();
                        TableTxt.Text = dt.Rows[0]["fstrTable"].ToString();
                        zoomPercTXT.Text = dt.Rows[0]["fintZoomPerc"].ToString();
                        // clip values
                        clipTopTXT.Text = dt.Rows[0]["flngClipTop"].ToString();
                        clipRightTXT.Text = dt.Rows[0]["flngClipRight"].ToString();
                        clipBotTXT.Text = dt.Rows[0]["flngClipBottom"].ToString();
                        clipLeftTXT.Text = dt.Rows[0]["flngClipLeft"].ToString();
                        // and position the div
                        clipDIV.Style.Add("top", clipTopTXT.Text + "px");
                        clipDIV.Style.Add("left", clipLeftTXT.Text + "px");
                        // bottom and right need to be converted to width and height
                        clipDIV.Style.Add("width", (int.Parse(clipRightTXT.Text) - int.Parse(clipLeftTXT.Text)).ToString() + "px");
                        clipDIV.Style.Add("height", (int.Parse(clipBotTXT.Text) - int.Parse(clipTopTXT.Text)).ToString() + "px");

                        // if this is a repeater form, set flag to enable the second marker later
                        if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                        {
                            ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                            ViewState["isMultiPage"] = null;
                            blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                            headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                        }
                        // if this is a multi-page, flag it for the SQL builder later
                        else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                        {
                            ViewState["isRepeater"] = -1;
                            ViewState["isMultiPage"] = "Y";
                        }
                        // a form can also be both repeater and multipage
                        else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                        {
                            ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                            ViewState["isMultiPage"] = "Y";
                            blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                            headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                        }
                        else
                        {
                            ViewState["isRepeater"] = -1;
                            ViewState["isMultiPage"] = null;
                        }
                    }

                    if (taxProgTXT.Text == "OGD")
                    {
                        OgdBtn.Visible = true;
                        O85Btn.Visible = true;
                        O99Btn.Visible = true;
                        OirBtn.Visible = true;
                        OsfBtn.Visible = true;
                        OsrBtn.Visible = true;
                        OasBtn.Visible = true;
                        OgdBtn.BackColor = System.Drawing.Color.LightCyan;
                        O85Btn.BackColor = System.Drawing.Color.Empty;
                        O99Btn.BackColor = System.Drawing.Color.Empty;
                        OirBtn.BackColor = System.Drawing.Color.Empty;
                        OsfBtn.BackColor = System.Drawing.Color.Empty;
                        OsrBtn.BackColor = System.Drawing.Color.Empty;
                        OasBtn.BackColor = System.Drawing.Color.Empty;

                        ((HiddenField)Master.FindControl("hidOgdForm")).Value = "0";
                    }
                    else
                    {
                        OgdBtn.Visible = false;
                        O85Btn.Visible = false;
                        O99Btn.Visible = false;
                        OirBtn.Visible = false;
                        OsfBtn.Visible = false;
                        OsrBtn.Visible = false;
                        OasBtn.Visible = false;
                        ((HiddenField)Master.FindControl("hidOgdForm")).Value = "0";
                    }


                    // get the template image, if there, need for block 0, but iwth all other values from this header

                    statement = "SELECT ";
                    statement += "fstrTemplateImage, ";
                    statement += "fstrBatchId, ";
                    statement += "flngSequence ";
                    statement += "FROM ";
                    statement += "	rfrControlHeaders ";
                    statement += "WHERE ";
                    statement += "	idControlHeaders = " + Request.QueryString["topHeaderID"].ToString() + ";";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    // we know this has one row, but for consistency do the check anyway
                    if (numRows > 0)
                    {
                        string templateImage = dt.Rows[0]["fstrTemplateImage"].ToString();
                        BatchTxt.Text = dt.Rows[0]["fstrBatchId"].ToString();
                        SequenceTxt.Text = dt.Rows[0]["flngSequence"].ToString();
                        // Get Offset and Size - First Doc Number = 1
                        statement = "SELECT ";
                        statement += "flngFrontOffset, ";
                        statement += "flngFrontSize ";
                        statement += "FROM tblNM_MavroOffset ";
                        statement += "WHERE fstrBatchId = '" + BatchTxt.Text + "' ";
                        statement += "AND flngSequence = '" + SequenceTxt.Text + "' ";
                        statement += "AND flngDocNumber = 1 ";
                        gc.DoSelect(statement);
                        dt = new DataTable();
                        numRows = gc.ReadSelect(out dt);
                        // we know this has one row, but for consistency do the check anyway
                        if (numRows > 0)
                        {
                            Session["mvOffset"] = dt.Rows[0]["flngFrontOffset"].ToString();
                            Session["mvSize"] = dt.Rows[0]["flngFrontSize"].ToString();
                            Session["mvImgSrc"] = "MAVRO";
                        }

                        // Get Offset and Size - Second Check if there is a Tax Form Name
                        statement = "SELECT ";
                        statement += "flngFrontOffset, ";
                        statement += "flngFrontSize ";
                        statement += "FROM tblNM_MavroOffset ";
                        statement += "WHERE fstrBatchId = '" + BatchTxt.Text + "' ";
                        statement += "AND flngSequence = '" + SequenceTxt.Text + "' ";
                        statement += "AND fstrFormType = '" + FormTxt.Text + "' ";
                        gc.DoSelect(statement);
                        dt = new DataTable();
                        numRows = gc.ReadSelect(out dt);
                        // we know this has one row, but for consistency do the check anyway
                        if (numRows > 0)
                        {
                            Session["mvOffset"] = dt.Rows[0]["flngFrontOffset"].ToString();
                            Session["mvSize"] = dt.Rows[0]["flngFrontSize"].ToString();
                            Session["mvImgSrc"] = "MAVRO";
                        }
                    }

                    // fill the DDLS for the new function controls
                    // newField1DDL
                    // newField2DDL
                    statement = "SELECT IDrfrControls, fstrLabel ";
                    statement += "FROM rfrControls ";
                    statement += "WHERE flngControlHeadersIDFK = " + ViewState["chID"].ToString();
                    statement += " AND fblnActive = 1 ";
                    statement += "AND flngOrder > 0 ";
                    statement += "ORDER BY flngOrder;";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    newField1DDLfocus.Items.Clear();
                    newField2DDLfocus.Items.Clear();
                    newField1DDLblur.Items.Clear();
                    newField2DDLblur.Items.Clear();

                    newField1DDLfocus.Items.Add(new ListItem("Select", "-1"));
                    newField2DDLfocus.Items.Add(new ListItem("Select", "-1"));
                    newField1DDLblur.Items.Add(new ListItem("Select", "-1"));
                    newField2DDLblur.Items.Add(new ListItem("Select", "-1"));

                    newField1DDLfocus.Items.Add(new ListItem("Previous Row", "-10"));
                    newField1DDLfocus.Items.Add(new ListItem("Constant", "-20"));

                    newField2DDLfocus.Items.Add(new ListItem("Previous Row", "-10"));
                    newField2DDLfocus.Items.Add(new ListItem("Constant", "-20"));

                    newField1DDLblur.Items.Add(new ListItem("Previous Row", "-10"));
                    newField1DDLblur.Items.Add(new ListItem("Constant", "-20"));

                    newField2DDLblur.Items.Add(new ListItem("Previous Row", "-10"));
                    newField2DDLblur.Items.Add(new ListItem("Constant", "-20"));
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            newField1DDLfocus.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                            newField2DDLfocus.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                            newField1DDLblur.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                            newField2DDLblur.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                        }
                    }
                    // newFuncDDL
                    statement = "SELECT IDrfrJavaAutoFunctions, fstrFuncName FROM rfrJavaAutoFunctions Order by fstrFuncName;";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    newFuncDDLfocus.Items.Clear();
                    newFuncDDLfocus.Items.Add(new ListItem("Select", "-1"));
                    newFuncDDLblur.Items.Clear();
                    newFuncDDLblur.Items.Add(new ListItem("Select", "-1"));
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            newFuncDDLfocus.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                            newFuncDDLblur.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                        }
                    }

                    // dataTypeDDL
                    statement = "SELECT IDrfrFormatTypes, fstrDesc FROM rfrFormatTypes;";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    dataTypeDDL.Items.Clear();
                    dataTypeDDL.Items.Add(new ListItem("Select", "-1"));
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                            dataTypeDDL.Items.Add(new ListItem(row[1].ToString(), row[0].ToString()));
                    }

                    gc.Disconnect();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }

                LoadControls();
            }
            // after loading and checking if this is a repeater, enable the offset marker if needed
            // if this is a repeater form, set flag to enable the second marker later
            if (int.Parse(ViewState["isRepeater"].ToString()) != -1)
            {
                repeaterSetPNL.Visible = true;
                ((Panel)Master.FindControl("repeaterPNL")).Visible = true;
                if (!Page.ClientScript.IsStartupScriptRegistered("showOffsetMarker"))
                {
                    string showOffsetMarker = @"$('#repeaterMarker').css('visibility', 'visible');
														$('#repeaterMarker').draggable();
														$('#repeaterMarker').on('drag', function(event, ui)
														{
															$('#" + blockOffsetTXT.ClientID + @"').val($('#repeaterMarker').css('top').replace('px', '') - $('#divMarker').css('top').replace('px', ''));
														});
														$('#repeaterMarker').on('mouseup', function()
														{
															$('#repeaterMarker').css({ left: $('#divMarker').css('left') });
														});";
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "showOffsetMarker", showOffsetMarker, true);
                }
            }
            else
            {
                repeaterSetPNL.Visible = false;
                ((Panel)Master.FindControl("repeaterPNL")).Visible = false;
            }

        }

        protected void OnClick_OgdBtn(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string templateImage = "";
            DataTable dt = new DataTable();
            int numRows = 0;
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                statement = "SELECT ";
                // type, repeater, Image info
                statement += "ch.fstrFormType, ch.flngRepeatOffset, ch.flngHeaderStart, ch.fstrTemplateImage ";
                statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                statement += "WHERE ch.idControlHeaders = " + Request.QueryString["topHeaderID"].ToString();
                statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // we know this has one row, but for consistency do the check anyway
                if (numRows > 0)
                {
                    templateImage = dt.Rows[0]["fstrTemplateImage"].ToString();                    
                    if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                        ViewState["isMultiPage"] = null;
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    // if this is a multi-page, flag it for the SQL builder later
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = "Y";
                    }
                    // a form can also be both repeater and multipage
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                        ViewState["isMultiPage"] = "Y";
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    else
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = null;
                    }
                }
                OgdBtn.BackColor = System.Drawing.Color.LightCyan;
                O85Btn.BackColor = System.Drawing.Color.Empty;
                O99Btn.BackColor = System.Drawing.Color.Empty;
                OirBtn.BackColor = System.Drawing.Color.Empty;
                OsfBtn.BackColor = System.Drawing.Color.Empty;
                OsrBtn.BackColor = System.Drawing.Color.Empty;
                OasBtn.BackColor = System.Drawing.Color.Empty;
                ((HiddenField)Master.FindControl("hidOgdForm")).Value = "0";
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
            LoadControls();
        }
        protected void OnClick_O85Btn(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string templateImage = "";
            DataTable dt = new DataTable();
            int numRows = 0;
            try
            {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                statement = "SELECT ";
                // type, repeater, Image info
                statement += "ch.fstrFormType, ch.flngRepeat2Offset, ch.flngHeaderStart, ch.fstrTemplate2Image ";
                statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                statement += "WHERE ch.idControlHeaders = " + Request.QueryString["topHeaderID"].ToString();
                statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // we know this has one row, but for consistency do the check anyway
                if (numRows > 0)
                {
                    templateImage = dt.Rows[0]["fstrTemplate2Image"].ToString();                   

                    if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat2Offset"].ToString());
                        ViewState["isMultiPage"] = null;
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    // if this is a multi-page, flag it for the SQL builder later
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = "Y";
                    }
                    // a form can also be both repeater and multipage
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat2Offset"].ToString());
                        ViewState["isMultiPage"] = "Y";
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    else
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = null;
                    }
                }

                OgdBtn.BackColor = System.Drawing.Color.Empty;
                O85Btn.BackColor = System.Drawing.Color.LightCyan;
                O99Btn.BackColor = System.Drawing.Color.Empty;
                OirBtn.BackColor = System.Drawing.Color.Empty;
                OsfBtn.BackColor = System.Drawing.Color.Empty;
                OsrBtn.BackColor = System.Drawing.Color.Empty;
                OasBtn.BackColor = System.Drawing.Color.Empty;
                ((HiddenField)Master.FindControl("hidOgdForm")).Value = "2";
                gc.Disconnect();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }
                LoadControls();
        }
        protected void OnClick_O99Btn(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string templateImage = "";
            DataTable dt = new DataTable();
            int numRows = 0;
            try
            {
#if DEBUG
                        gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                statement = "SELECT ";
                // type, repeater, Image info
                statement += "ch.fstrFormType, ch.flngRepeat3Offset, ch.flngHeaderStart, ch.fstrTemplate3Image ";
                statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                statement += "WHERE ch.idControlHeaders = " + Request.QueryString["topHeaderID"].ToString();
                statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // we know this has one row, but for consistency do the check anyway
                if (numRows > 0)
                {
                    templateImage = dt.Rows[0]["fstrTemplate3Image"].ToString();                   
                    if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat3Offset"].ToString());
                        ViewState["isMultiPage"] = null;
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    // if this is a multi-page, flag it for the SQL builder later
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = "Y";
                    }
                    // a form can also be both repeater and multipage
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat3Offset"].ToString());
                        ViewState["isMultiPage"] = "Y";
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    else
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = null;
                    }
                }
                OgdBtn.BackColor = System.Drawing.Color.Empty;
                O85Btn.BackColor = System.Drawing.Color.Empty;
                O99Btn.BackColor = System.Drawing.Color.LightCyan;
                OirBtn.BackColor = System.Drawing.Color.Empty;
                OsfBtn.BackColor = System.Drawing.Color.Empty;
                OsrBtn.BackColor = System.Drawing.Color.Empty;
                OasBtn.BackColor = System.Drawing.Color.Empty;
                ((HiddenField)Master.FindControl("hidOgdForm")).Value = "3";
                gc.Disconnect();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }
                LoadControls();
        }
        protected void OnClick_OirBtn(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string templateImage = "";
            DataTable dt = new DataTable();
            int numRows = 0;
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                statement = "SELECT ";
                // type, repeater, Image info
                statement += "ch.fstrFormType, ch.flngRepeat4Offset, ch.flngHeaderStart, ch.fstrTemplate4Image ";
                statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                statement += "WHERE ch.idControlHeaders = " + Request.QueryString["topHeaderID"].ToString();
                statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // we know this has one row, but for consistency do the check anyway
                if (numRows > 0)
                {
                    templateImage = dt.Rows[0]["fstrTemplate4Image"].ToString();                   
                    if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat4Offset"].ToString());
                        ViewState["isMultiPage"] = null;
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    // if this is a multi-page, flag it for the SQL builder later
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = "Y";
                    }
                    // a form can also be both repeater and multipage
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat4Offset"].ToString());
                        ViewState["isMultiPage"] = "Y";
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    else
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = null;
                    }
                }
                OgdBtn.BackColor = System.Drawing.Color.Empty;
                O85Btn.BackColor = System.Drawing.Color.Empty;
                O99Btn.BackColor = System.Drawing.Color.Empty;
                OirBtn.BackColor = System.Drawing.Color.LightCyan;
                OsfBtn.BackColor = System.Drawing.Color.Empty;
                OsrBtn.BackColor = System.Drawing.Color.Empty;
                OasBtn.BackColor = System.Drawing.Color.Empty;
                ((HiddenField)Master.FindControl("hidOgdForm")).Value = "4";
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
            LoadControls();

        }
        protected void OnClick_OsfBtn(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string templateImage = "";
            DataTable dt = new DataTable();
            int numRows = 0;
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                statement = "SELECT ";
                // type, repeater, Image info
                statement += "ch.fstrFormType, ch.flngRepeat5Offset, ch.flngHeaderStart, ch.fstrTemplate5Image ";
                statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                statement += "WHERE ch.idControlHeaders = " + Request.QueryString["topHeaderID"].ToString();
                statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // we know this has one row, but for consistency do the check anyway
                if (numRows > 0)
                {
                    templateImage = dt.Rows[0]["fstrTemplate5Image"].ToString();                    
                    if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat5Offset"].ToString());
                        ViewState["isMultiPage"] = null;
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    // if this is a multi-page, flag it for the SQL builder later
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = "Y";
                    }
                    // a form can also be both repeater and multipage
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat5Offset"].ToString());
                        ViewState["isMultiPage"] = "Y";
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    else
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = null;
                    }
                }
                OgdBtn.BackColor = System.Drawing.Color.Empty;
                O85Btn.BackColor = System.Drawing.Color.Empty;
                O99Btn.BackColor = System.Drawing.Color.Empty;
                OirBtn.BackColor = System.Drawing.Color.Empty;
                OsfBtn.BackColor = System.Drawing.Color.LightCyan;
                OsrBtn.BackColor = System.Drawing.Color.Empty;
                OasBtn.BackColor = System.Drawing.Color.Empty;
                ((HiddenField)Master.FindControl("hidOgdForm")).Value = "5";
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
            LoadControls();

        }
        protected void OnClick_OsrBtn(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string templateImage = "";
            DataTable dt = new DataTable();
            int numRows = 0;
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                statement = "SELECT ";
                // type, repeater, Image info
                statement += "ch.fstrFormType, ch.flngRepeat6Offset, ch.flngHeaderStart, ch.fstrTemplate6Image ";
                statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                statement += "WHERE ch.idControlHeaders = " + Request.QueryString["topHeaderID"].ToString();
                statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // we know this has one row, but for consistency do the check anyway
                if (numRows > 0)
                {
                    templateImage = dt.Rows[0]["fstrTemplate6Image"].ToString();                   
                    if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat6Offset"].ToString());
                        ViewState["isMultiPage"] = null;
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    // if this is a multi-page, flag it for the SQL builder later
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = "Y";
                    }
                    // a form can also be both repeater and multipage
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat6Offset"].ToString());
                        ViewState["isMultiPage"] = "Y";
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    else
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = null;
                    }
                }
                OgdBtn.BackColor = System.Drawing.Color.Empty;
                O85Btn.BackColor = System.Drawing.Color.Empty;
                O99Btn.BackColor = System.Drawing.Color.Empty;
                OirBtn.BackColor = System.Drawing.Color.Empty;
                OsfBtn.BackColor = System.Drawing.Color.Empty;
                OsrBtn.BackColor = System.Drawing.Color.LightCyan;
                OasBtn.BackColor = System.Drawing.Color.Empty;
                ((HiddenField)Master.FindControl("hidOgdForm")).Value = "6";
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
            LoadControls();

        }
        protected void OnClick_OasBtn(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string templateImage = "";
            DataTable dt = new DataTable();
            int numRows = 0;
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                statement = "SELECT ";
                // type, repeater, Image info
                statement += "ch.fstrFormType, ch.flngRepeat7Offset, ch.flngHeaderStart, ch.fstrTemplate7Image ";
                statement += "FROM rfrReturnHeaders rh, rfrControlHeaders ch ";
                statement += "WHERE ch.idControlHeaders = " + Request.QueryString["topHeaderID"].ToString();
                statement += " AND rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // we know this has one row, but for consistency do the check anyway
                if (numRows > 0)
                {
                    templateImage = dt.Rows[0]["fstrTemplate7Image"].ToString();
                    if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat7Offset"].ToString());
                        ViewState["isMultiPage"] = null;
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    // if this is a multi-page, flag it for the SQL builder later
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = "Y";
                    }
                    // a form can also be both repeater and multipage
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        ViewState["isRepeater"] = int.Parse(dt.Rows[0]["flngRepeat7Offset"].ToString());
                        ViewState["isMultiPage"] = "Y";
                        blockOffsetTXT.Text = ViewState["isRepeater"].ToString();
                        headerNumberStartsTXT.Text = dt.Rows[0]["flngHeaderStart"].ToString();
                    }
                    else
                    {
                        ViewState["isRepeater"] = -1;
                        ViewState["isMultiPage"] = null;
                    }
                }
                OgdBtn.BackColor = System.Drawing.Color.Empty;
                O85Btn.BackColor = System.Drawing.Color.Empty;
                O99Btn.BackColor = System.Drawing.Color.Empty;
                OirBtn.BackColor = System.Drawing.Color.Empty;
                OsfBtn.BackColor = System.Drawing.Color.Empty;
                OsrBtn.BackColor = System.Drawing.Color.Empty;
                OasBtn.BackColor = System.Drawing.Color.LightCyan;
                ((HiddenField)Master.FindControl("hidOgdForm")).Value = "7";
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
            LoadControls();

        }

        // load up any existing controls and plot them plus a checkbox for selection
        private void LoadControls()
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            string strTaxProgram = "";

            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // with the new headers, this all stays the same, except the where condition
                // now it's a simpler WHERE flngControlHeadersIDFK = value
                // first select the values we'll need
                statement = "SELECT cc.IDrfrControls, ";
                statement += "cc.fblnHidden, ";
                statement += "cc.fblnRequired, ";
                statement += "cc.fstrLabel, ";
                statement += "cc.fstrInputId, ";
                statement += "cc.flngDispLength, ";
                statement += "cc.flngMaxLength, ";
                statement += "cc.flngCtrlMove, ";
                statement += "cc.flngImgMoveX, ";
                statement += "cc.flngImgMoveY, ";
                statement += "cc.flngMarkerMoveX, ";
                statement += "cc.flngMarkerMoveY, ";
                statement += "cc.fstrNextCtrl, ";
                statement += "cc.flngFormatIDFK, ";
                // for the format function
                statement += "rfrFormatTypes.fstrFJSfuncName AS formatFunc, ";
                statement += "ISNULL( rfrFormatTypes.fstrDoLookupType, '' ) AS fstrDoLookup, ";
                statement += "cc.fstrColumn, ";
                statement += "cc.fblnVertSkip, ";
                statement += "cc.flngCtrl2Move, ";
                statement += "cc.flngImg2MoveX, ";
                statement += "cc.flngImg2MoveY, ";
                statement += "cc.flngMarker2MoveX, ";
                statement += "cc.flngMarker2MoveY, ";
                statement += "cc.flngCtrl3Move, ";
                statement += "cc.flngImg3MoveX, ";
                statement += "cc.flngImg3MoveY, ";
                statement += "cc.flngMarker3MoveX, ";
                statement += "cc.flngMarker3MoveY, ";
                statement += "cc.flngCtrl4Move, ";
                statement += "cc.flngImg4MoveX, ";
                statement += "cc.flngImg4MoveY, ";
                statement += "cc.flngMarker4MoveX, ";
                statement += "cc.flngMarker4MoveY, ";
                statement += "cc.flngCtrl5Move, ";
                statement += "cc.flngImg5MoveX, ";
                statement += "cc.flngImg5MoveY, ";
                statement += "cc.flngMarker5MoveX, ";
                statement += "cc.flngMarker5MoveY, ";
                statement += "cc.flngCtrl6Move, ";
                statement += "cc.flngImg6MoveX, ";
                statement += "cc.flngImg6MoveY, ";
                statement += "cc.flngMarker6MoveX, ";
                statement += "cc.flngMarker6MoveY, ";
                statement += "cc.flngCtrl7Move, ";
                statement += "cc.flngImg7MoveX, ";
                statement += "cc.flngImg7MoveY, ";
                statement += "cc.flngMarker7MoveX, ";
                statement += "cc.flngMarker7MoveY, ";
                statement += "str(ch.fblnLand,1) As fblnLand, ";
                statement += "cc.fstrTaxProgram ";

                // this stays the same
                statement += "FROM rfrControlHeaders ch, rfrControls cc LEFT JOIN rfrFormatTypes ";
                statement += "ON cc.flngFormatIDFK = rfrFormatTypes.IDrfrFormatTypes ";
                statement += "WHERE cc.flngControlHeadersIDFK = " + ViewState["chID"].ToString();
                statement += " AND ch.idControlHeaders = " + ViewState["chID"].ToString();
                statement += " AND cc.fblnActive = 1 ";
                statement += "AND cc.flngOrder > 0 ";
                statement += "ORDER BY cc.flngOrder";

                gc.DoSelect(statement);
                DataTable ctrlDT = new DataTable();
                int numRows = gc.ReadSelect(out ctrlDT);
                // put controls in here, just leave as HTML controls, and the javascript can
                // handle everything from the events and scripts in the database
                // controlsLIT
                // String manipulation into html 
                StringBuilder controlString = new StringBuilder();
                long maxScrl = 0;

                if (numRows > 0)
                {
                    strTaxProgram = ctrlDT.Rows[0]["fstrTaxProgram"].ToString();
                    nextControlDDL.Items.Clear();

                    foreach (DataRow row in ctrlDT.Rows)
                    {
                        if (taxProgTXT.Text == "OGD")
                        {
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "0")
                            {
                                if (long.Parse(row["flngCtrlMove"].ToString()) > maxScrl)
                                    maxScrl = long.Parse(row["flngCtrlMove"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "2")
                            {
                                if (long.Parse(row["flngCtrl2Move"].ToString()) > maxScrl)
                                    maxScrl = long.Parse(row["flngCtrl2Move"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "3")
                            {
                                if (long.Parse(row["flngCtrl3Move"].ToString()) > maxScrl)
                                    maxScrl = long.Parse(row["flngCtrl3Move"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "4")
                            {
                                if (long.Parse(row["flngCtrl4Move"].ToString()) > maxScrl)
                                    maxScrl = long.Parse(row["flngCtrl4Move"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "5")
                            {
                                if (long.Parse(row["flngCtrl5Move"].ToString()) > maxScrl)
                                    maxScrl = long.Parse(row["flngCtrl5Move"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "6")
                            {
                                if (long.Parse(row["flngCtrl6Move"].ToString()) > maxScrl)
                                    maxScrl = long.Parse(row["flngCtrl6Move"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "7")
                            {
                                if (long.Parse(row["flngCtrl7Move"].ToString()) > maxScrl)
                                    maxScrl = long.Parse(row["flngCtrl7Move"].ToString());
                            }
                        }
                        else
                        {
                            if (long.Parse(row["flngCtrlMove"].ToString()) > maxScrl)
                                maxScrl = long.Parse(row["flngCtrlMove"].ToString());
                        }

                        // since we're already looping here, put the names in the DDL
                        nextControlDDL.Items.Add(new ListItem(row["fstrLabel"].ToString(), row["fstrInputId"].ToString()));

                        // set up for this row
                        // this will be replaced later to remove the new row if the control is in the second column, i.e. </tr>1<tr>
                        controlString.Append("~fblnVertSkip~<tr>\n");
                        controlString.Append("	<td>\n");
                        controlString.Append("		<input name=\"selCtrl\" id=\"selCtrl\" value=\"" + row["IDrfrControls"].ToString() + "\" type=\"radio\" ~checkMe~ ");
                        controlString.Append("		onclick=\"$('#tableCtrl tr').css('background-color', 'white');$('#selCtrl:checked').parent().parent().css('background-color', 'red' );$('#" + clipDIV.ClientID + "').css({ opacity: 0 });$('#" + hiddenBTN.ClientID + "').click();\"></td>");
                        controlString.Append("	</td>");
                        controlString.Append("	<td>\n");
                        controlString.Append("		fstrLabel\n");
                        controlString.Append("	</td>\n");
                        controlString.Append("	<td>\n");
                        controlString.Append("		<input\n");
                        controlString.Append("			id=\"~fstrInputId\"\n");
                        controlString.Append("			name=\"~fstrInputId\"\n");
                        controlString.Append("			type=\"fblnHiddenfstrInputId\"\n");
                        controlString.Append("			maxlength=\"flngMaxLengthmx\"\n");
                        controlString.Append("			style=\"height: 22px;\n");
                        controlString.Append("				width: flngDispLengthpx;\n");
                        controlString.Append("				background-color: rgb(255, 255, 255);\"\n");
                        controlString.Append("			onfocus=\"if( !$('#" + lockMoveCKB.ClientID + "').attr('checked')){");
                        controlString.Append("				$(this).css('background-color', '#66FF99');\n");
                        controlString.Append("				CtlMove(flngCtrlMove, 0);\n");
                        // move the offset marker too, if needed
                        string moveOffsetMarker = "";
                        if (int.Parse(ViewState["isRepeater"].ToString()) != -1)
                            moveOffsetMarker = @"$('#repeaterMarker').css({ left: flngMarkerMoveX, top: flngMarkerMoveY + parseInt( $('#" + blockOffsetTXT.ClientID + @"').val() ) })";
                        controlString.Append("				moveStuff(fblnLand,flngImgMoveX,flngImgMoveY,true,flngMarkerMoveX,flngMarkerMoveY,true);" + moveOffsetMarker + "}\n");
                        controlString.Append("				$('#selCtrl[value=\\\'" + row["IDrfrControls"].ToString() + "\\\']').attr('checked', 'checked').click();\"\n");
                        controlString.Append("			onblur=\"$(this).css('background-color', '#FFFFFF');\"\n");
                        controlString.Append("			onkeydown=\"if(chkAction()) {\n");
                        controlString.Append("				selNext(fstrNextCtrl);}\"\n");
                        controlString.Append("			value=\"~fstrColumn~\">\n");
                        controlString.Append("	</td>\n");
                        controlString.Append("</tr>\n");

                        // then put in the database values, with some checks
                        // this will be replaced later to remove the new row if the control is in the second column, i.e. </tr>1<tr>
                        controlString.Replace("fblnVertSkip", row["fblnVertSkip"].ToString());
                        // check the radio if needed
                        if (Request.Form["selCtrl"] == row["IDrfrControls"].ToString())
                        {
                            controlString.Replace("~checkMe~", "checked");
                            string sBuff1 = row["flngCtrlMove"].ToString();
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "colorClick", "$(document).ready(function(){$('#selCtrl:checked').parent().parent().css('background-color', 'red' );$('#clipDIV').css({ opacity: 0 });$('#" + hiddenBTN.ClientID + "').click();$('#divControls').scrollTop(" + sBuff1 + ");});", true);
                        }
                        // otherwise clear the flag
                        else
                            controlString.Replace("~checkMe~", "");
                        // no label if hidden, leave this, so we can know if it is a hidden at a glance
                        if (row["fblnHidden"].ToString() == "1")
                        {
                            controlString.Replace("fstrLabel", row["fstrLabel"].ToString() + " *");
                            controlString.Replace("fblnHiddenfstrInputId", "text");
                        }
                        else
                        {
                            if (row["fblnRequired"].ToString() == "1")
                                controlString.Replace("fstrLabel", row["fstrLabel"].ToString() + " (REQ)");
                            else
                                controlString.Replace("fstrLabel", row["fstrLabel"].ToString());
                            if (row["fstrInputId"].ToString().Substring(0, 3) == "ckb" || row["fstrInputId"].ToString().Substring(0, 3) == "chk")
                                controlString.Replace("fblnHiddenfstrInputId", "checkbox");
                            else
                                controlString.Replace("fblnHiddenfstrInputId", "text");
                        }
                        controlString.Replace("~fstrInputId", row["fstrInputId"].ToString());
                        controlString.Replace("flngMaxLengthmx", row["flngMaxLength"].ToString());
                        int myWidth = int.Parse(row["flngDispLength"].ToString()) * 18;
                        if (myWidth > 252)
                            myWidth = 252;
                        controlString.Replace("flngDispLengthpx", myWidth.ToString() + "px");

                        if (taxProgTXT.Text == "OGD")
                        {
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "0")
                            {
                                controlString.Replace("flngCtrlMove", row["flngCtrlMove"].ToString());
                                controlString.Replace("flngImgMoveX", row["flngImgMoveX"].ToString());
                                controlString.Replace("flngImgMoveY", row["flngImgMoveY"].ToString());
                                controlString.Replace("flngMarkerMoveX", row["flngMarkerMoveX"].ToString());
                                controlString.Replace("flngMarkerMoveY", row["flngMarkerMoveY"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "2")
                            {
                                controlString.Replace("flngCtrlMove", row["flngCtrl2Move"].ToString());
                                controlString.Replace("flngImgMoveX", row["flngImg2MoveX"].ToString());
                                controlString.Replace("flngImgMoveY", row["flngImg2MoveY"].ToString());
                                controlString.Replace("flngMarkerMoveX", row["flngMarker2MoveX"].ToString());
                                controlString.Replace("flngMarkerMoveY", row["flngMarker2MoveY"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "3")
                            {
                                controlString.Replace("flngCtrlMove", row["flngCtrl3Move"].ToString());
                                controlString.Replace("flngImgMoveX", row["flngImg3MoveX"].ToString());
                                controlString.Replace("flngImgMoveY", row["flngImg3MoveY"].ToString());
                                controlString.Replace("flngMarkerMoveX", row["flngMarker3MoveX"].ToString());
                                controlString.Replace("flngMarkerMoveY", row["flngMarker3MoveY"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "4")
                            {
                                controlString.Replace("flngCtrlMove", row["flngCtrl4Move"].ToString());
                                controlString.Replace("flngImgMoveX", row["flngImg4MoveX"].ToString());
                                controlString.Replace("flngImgMoveY", row["flngImg4MoveY"].ToString());
                                controlString.Replace("flngMarkerMoveX", row["flngMarker4MoveX"].ToString());
                                controlString.Replace("flngMarkerMoveY", row["flngMarker4MoveY"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "5")
                            {
                                controlString.Replace("flngCtrlMove", row["flngCtrl5Move"].ToString());
                                controlString.Replace("flngImgMoveX", row["flngImg5MoveX"].ToString());
                                controlString.Replace("flngImgMoveY", row["flngImg5MoveY"].ToString());
                                controlString.Replace("flngMarkerMoveX", row["flngMarker5MoveX"].ToString());
                                controlString.Replace("flngMarkerMoveY", row["flngMarker5MoveY"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "6")
                            {
                                controlString.Replace("flngCtrlMove", row["flngCtrl6Move"].ToString());
                                controlString.Replace("flngImgMoveX", row["flngImg6MoveX"].ToString());
                                controlString.Replace("flngImgMoveY", row["flngImg6MoveY"].ToString());
                                controlString.Replace("flngMarkerMoveX", row["flngMarker6MoveX"].ToString());
                                controlString.Replace("flngMarkerMoveY", row["flngMarker6MoveY"].ToString());
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "7")
                            {
                                controlString.Replace("flngCtrlMove", row["flngCtrl7Move"].ToString());
                                controlString.Replace("flngImgMoveX", row["flngImg7MoveX"].ToString());
                                controlString.Replace("flngImgMoveY", row["flngImg7MoveY"].ToString());
                                controlString.Replace("flngMarkerMoveX", row["flngMarker7MoveX"].ToString());
                                controlString.Replace("flngMarkerMoveY", row["flngMarker7MoveY"].ToString());
                            }
                        }
                        else
                        {
                            controlString.Replace("flngCtrlMove", row["flngCtrlMove"].ToString());
                            controlString.Replace("flngImgMoveX", row["flngImgMoveX"].ToString());
                            controlString.Replace("flngImgMoveY", row["flngImgMoveY"].ToString());
                            controlString.Replace("flngMarkerMoveX", row["flngMarkerMoveX"].ToString());
                            controlString.Replace("flngMarkerMoveY", row["flngMarkerMoveY"].ToString());
                        }

                        // different on final or not
                        if (row["fstrNextCtrl"].ToString() == "btnSub")
                            controlString.Replace("fstrNextCtrl", btnSub.ClientID);
                        else
                            controlString.Replace("fstrNextCtrl", row["fstrNextCtrl"].ToString());
                        controlString.Replace("fstrColumn", row["fstrColumn"].ToString());
                        controlString.Replace("fblnLand", row["fblnLand"].ToString());

                    }
                    // one last one to finish the form
                    nextControlDDL.Items.Add(new ListItem("Finish Form", "btnSub"));

                    // remove extra rows on controls in 2nd column
                    controlString.Replace("</tr>\n~1~<tr>", "\n");
                    controlString.Replace("</tr>\n~0~<tr>", "</tr>\n<tr>");
                    controlString.Replace("~1~", "");
                    controlString.Replace("~0~", "");
                    // some final formatting
                    controlString.Insert(0, "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">");
                    controlString.Append("</table>");
                }

                // and into the control
                ((Literal)Master.FindControl("controlsLIT")).Text = controlString.ToString();
                // set maxScrl
                ((HiddenField)Master.FindControl("maxScrl")).Value = maxScrl.ToString();
                // set the zoom
                //((Forms)Master).SetZoomFactor(ViewState["chID"].ToString(), ((Image)((Forms)Master).FindControl("imgImage")).ClientID, gc);

                gc.Disconnect();
                // rebind the GDV
                Rebind();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_btnSub(object sender, EventArgs e)
        {
            // here we want to do some checking on the DB table
            // and let the user know if there are any DB changes that need to be made
            // if so, take them to a page where we can give them the CREATE TABLE or ALTER TABLE statements that can
            // be given to the DBAs to make the changes.

            // how do we check if the table is there, and each column needed is there

            // we could just give them the create statement, and the DBAs can figure out what is needed

            // try SELECT * FROM tableName, fails => table isn't there
            // try SELECT columnName FROM tableName, fails => either table or column isn't there, decide on result of above statement
            // or can we get more detailed info in the error? will it be the same all the time
            // I'm talking to myself in these comments
            // that's kind of weird, isn't it?

            // obviously we're going to have to run some tests to see what the Exceptions give us, 
            // and then we can decide which direction to go

            /* all form tables need
				fstrBatchID		VARCHAR(10)		NOT NULL
				fdtmBatchDate	DATETIME		NOT NULL
				flngSequence	INT				NOT NULL
				fstrWho			VARCHAR(256)	NOT NULL
				fdtmWhen		DATETIME		NOT NULL
			 */

            GoodConn gc = new GoodConn();
            string statement = "";
            DataTable dt;
            int numRows;
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // if this succeeds, then we know the table exists
                //statement = "SELECT TOP 1 * FROM tblSCorp;";
                //gc.doSelect( statement );
                //dt = new DataTable();
                //numRows = gc.readSelect( out dt );

                // this should fail, since we know this table doesn't exist at this point
                // what exception will it give us
                //statement = "SELECT TOP 1 * FROM tblSCorp13;";
                //gc.doSelect( statement );
                //dt = new DataTable();
                //numRows = gc.readSelect( out dt );

                /* we get this
				ex.Message = "SELECT error, please see Exception Details.

								STATEMENT: SELECT TOP 1 * FROM tblSCorp13;"
				ex.InnerException.Message = "Invalid object name 'tblSCorp13'."

				 */

                // try selecting a column (any one) from a table that isn't there
                //statement = "SELECT TOP 1 fstrWho FROM tblSCorp13;";
                //gc.doSelect( statement );
                //dt = new DataTable();
                //numRows = gc.readSelect( out dt );
                /* again we get
				ex.Message = "SELECT error, please see Exception Details.

								STATEMENT: SELECT TOP 1 fstrWho FROM tblSCorp13;"
				ex.InnerException.Message = "Invalid object name 'tblSCorp13'."
				 */

                // try selecting a column that isn't there from a table that is there
                //statement = "SELECT TOP 1 fstrWho13 FROM tblSCorp;";
                //gc.doSelect( statement );
                //dt = new DataTable();
                //numRows = gc.readSelect( out dt );
                /* and here we get
				ex.Message = "SELECT error, please see Exception Details.
								STATEMENT: SELECT TOP 1 fstrWho13 FROM tblSCorp;"
				ex.InnerException.Message = "Invalid column name 'fstrWho13'."
				 */

                // so the conclusion
                // first test for table exists
                // SELECT TOP 1 * FROM @tableName;
                // if it doesn't exist, we know we need to create the entire table, with all
                // the columns we need, so we can make that statement and stop there

                // if it does exist, we need to check for all the columns we need
                // loop with a try/catch inside the loop
                // or make two methods for checking the table and columns,
                // with their own connections or with one we give them?
                // then they can have their own try/catch'es, and we avoid the nesting here
                // it would make it all cleaner, but add complexity as there are more methods?
                // hmmmmm?

                // also should add a scan on the blockBatch page, so they can see what forms need to be addressed

                bool wereGood = true;
                string SQLstatement = "";
                // check the table
                if (UtilClass.TableExists(TableTxt.Text, gc))
                {
                    // table is there, begin checking the columns and start an ALTER TABLE statement
                    SQLstatement = "ALTER TABLE " + TableTxt.Text + " ADD \n";

                    // from above, all data tables need 5 columns
                    /* 
						fstrBatchID		VARCHAR(10)		NOT NULL
						fdtmBatchDate	DATETIME		NOT NULL
						flngSequence	INT				NOT NULL
						fstrWho			VARCHAR(256)	NOT NULL
						fdtmWhen		DATETIME		NOT NULL
					*/
                    // column doesn't exist, table does
                    // required columns, just check and add if needed
                    if (!UtilClass.ColumnExists(TableTxt.Text, "fstrBatchID", gc))
                    {
                        wereGood = false;
                        SQLstatement += "    [fstrBatchID]         VARCHAR (10)    NOT NULL, \n";
                    }
                    if (!UtilClass.ColumnExists(TableTxt.Text, "fdtmBatchDate", gc))
                    {
                        wereGood = false;
                        SQLstatement += "    [fdtmBatchDate]       DATETIME        NOT NULL, \n";
                    }
                    if (!UtilClass.ColumnExists(TableTxt.Text, "flngSequence", gc))
                    {
                        wereGood = false;
                        SQLstatement += "    [flngSequence]        INT             NOT NULL, \n";
                    }
                    // check for repeater column needed
                    if (int.Parse(ViewState["isRepeater"].ToString()) != -1)
                    {
                        if (!UtilClass.ColumnExists(TableTxt.Text, "fstrTaxForm", gc))
                        {
                            wereGood = false;
                            SQLstatement += "    [fstrTaxForm]         VARCHAR(63)     NOT NULL    DEFAULT '', \n";
                        }
                        if (!UtilClass.ColumnExists(TableTxt.Text, "flngRepNum", gc))
                        {
                            wereGood = false;
                            SQLstatement += "    [flngRepNum]          INT             NOT NULL    DEFAULT 0, \n";
                        }
                        if (!UtilClass.ColumnExists(TableTxt.Text, "fblnFilled", gc))
                        {
                            wereGood = false;
                            SQLstatement += "    [fblnFilled]          TINYINT         NOT NULL    DEFAULT 0, \n";
                        }
                    }
                    if (ViewState["isMultiPage"] != null)
                    {
                        if (!UtilClass.ColumnExists(TableTxt.Text, "fstrMPDLN", gc))
                        {
                            wereGood = false;
                            SQLstatement += "    [fstrMPDLN]           VARCHAR(30)     NOT NULL    DEFAULT '', \n";
                        }
                    }

                    // the controls are all already in the controls table, so just select there, 
                    // and compare to the table where their data is going
                    statement = "SELECT fstrColumn, flngVBVarType, flngMaxLength FROM rfrControls WHERE flngControlHeadersIDFK = " + ViewState["chID"].ToString() + " AND flngOrder > 0;";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    // no controls, nothing else to check
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            if (!UtilClass.ColumnExists(TableTxt.Text, row["fstrColumn"].ToString(), gc))
                            {
                                wereGood = false;
                                SQLstatement += "    [" + row["fstrColumn"].ToString() + "]".PadRight(23 - ("[" + row["fstrColumn"].ToString() + "]").Length, ' ');
                                switch (row["flngVBVarType"].ToString())
                                {
                                    case "8":
                                        // string
                                        SQLstatement += "VARCHAR (" + row["flngMaxLength"].ToString() + ")" + "".PadRight(16 - ("VARCHAR (" + row["flngMaxLength"].ToString() + ")").Length, ' ') + "NOT NULL                DEFAULT '', \n";
                                        break;

                                    case "7":
                                        // datetime
                                        SQLstatement += "DATETIME       NOT NULL       DEFAULT '9999/12/31', \n";
                                        break;

                                    case "11":
                                        // bool
                                        SQLstatement += "TINYINT        NOT NULL                  DEFAULT 0, \n";
                                        break;

                                    case "14":
                                        // money
                                        SQLstatement += "MONEY           NOT NULL                  DEFAULT 0, \n";
                                        break;
                                }
                            }
                        }
                        // more required columns, just check and add if needed
                        if (!UtilClass.ColumnExists(TableTxt.Text, "fstrWho", gc))
                        {
                            wereGood = false;
                            SQLstatement += "    [fstrWho]             VARCHAR (256)   NOT NULL             DEFAULT '', \n";
                        }
                        if (!UtilClass.ColumnExists(TableTxt.Text, "fdtmWhen", gc))
                        {
                            wereGood = false;
                            SQLstatement += "    [fdtmWhen]            DATETIME        NOT NULL             DEFAULT GETDATE(), \n";
                        }

                        // clean
                        if (SQLstatement.Substring(SQLstatement.Length - 3) == ", \n")
                            SQLstatement = SQLstatement.Substring(0, SQLstatement.Length - 3) + ";";
                    }
                }
                // table doesn't exist, no need to check the columns, just make everything we need
                else
                {
                    wereGood = false;
                    // begin building the SQL CREATE TABLE statement
                    SQLstatement = "CREATE TABLE " + TableTxt.Text + " ( \n";
                    SQLstatement += "    [fstrBatchID]         VARCHAR (10)    NOT NULL, \n";
                    SQLstatement += "    [fdtmBatchDate]       DATETIME        NOT NULL, \n";
                    SQLstatement += "    [flngSequence]        INT             NOT NULL, \n";
                    // check for repeater column needed
                    if (int.Parse(ViewState["isRepeater"].ToString()) != -1)
                    {
                        SQLstatement += "    [fstrTaxForm]         VARCHAR(63)     NOT NULL    DEFAULT '', \n";
                        SQLstatement += "    [flngRepNum]          INT             NOT NULL    DEFAULT 1, \n";
                        SQLstatement += "    [fblnFilled]          TINYINT         NOT NULL    DEFAULT 0, \n";
                    }
                    if (ViewState["isMultiPage"] != null)
                    {
                        SQLstatement += "    [fstrMPDLN]           VARCHAR(30)     NOT NULL    DEFAULT '', \n";
                    }

                    // the controls are all already in the controls table, so just select there, 
                    // and compare to the table where their data is going
                    statement = "SELECT fstrColumn, flngVBVarType, flngMaxLength FROM rfrControls WHERE flngControlHeadersIDFK = " + ViewState["chID"].ToString() + " AND flngOrder > 0;";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    // no controls, nothing else to check
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            SQLstatement += "    [" + row["fstrColumn"].ToString() + "]".PadRight(23 - ("[" + row["fstrColumn"].ToString() + "]").Length, ' ');
                            switch (row["flngVBVarType"].ToString())
                            {
                                case "8":
                                    // string
                                    SQLstatement += "VARCHAR (" + row["flngMaxLength"].ToString() + ")" + "".PadRight(16 - ("VARCHAR (" + row["flngMaxLength"].ToString() + ")").Length, ' ') + "NOT NULL                DEFAULT '', \n";
                                    break;

                                case "7":
                                    // datetime
                                    SQLstatement += "DATETIME       NOT NULL       DEFAULT '9999/12/31', \n";
                                    break;

                                case "11":
                                    // bool
                                    SQLstatement += "TINYINT        NOT NULL                  DEFAULT 0, \n";
                                    break;

                                case "14":
                                    // money
                                    SQLstatement += "MONEY           NOT NULL                  DEFAULT 0, \n";
                                    break;
                            }
                        }
                    }
                    SQLstatement += "    [fstrWho]             VARCHAR (256)   NOT NULL             DEFAULT '', \n";
                    SQLstatement += "    [fdtmWhen]            DATETIME        NOT NULL             DEFAULT GETDATE(), \n";
                    SQLstatement += "CONSTRAINT [PK_" + TableTxt.Text + "] PRIMARY KEY ( [fstrBatchID], [flngSequence], [fdtmBatchDate], [fstrTaxForm] ) \n);";

                }

                gc.Disconnect();

                // based on the result of the checks, redirect accordingly
                // table and columns are all there, go back to blockBatch
                if (wereGood)
                    Response.Redirect("blockBatch.aspx?rhID=" + Request.QueryString["rhID"], true);
                // not everything is there, go to the SQL statement display page
                // still include the QueryString, for getting back to blockBatch eventually
                else
                {
                    // save this here, it's rather big to put in the QueryString
                    Session["strSQL"] = SQLstatement;
                    Response.Redirect("needSql.aspx?rhID=" + Request.QueryString["rhID"], true);
                }

            }
            catch (ThreadAbortException tex)
            {
                object kkex = tex;
                // this happens when we do a Response.Redirect
                // already disconnected gc, so do nothing
            }

            //		catch( ThreadAbortException tex )
            //		{
            //		}
            catch (Exception ex)
            {
                // change the SQL in the Session and send to same page
                Session["strSQL"] = "Something went wrong generating the SQL script. Below is a summary of the error\n" + ex.Message + (ex.InnerException != null ? "\n\n" + ex.InnerException.Message : "");
                Response.Redirect("needSql.aspx?rhID=" + Request.QueryString["rhID"], true);
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        //@#@#
        protected void OnClick_addBTN(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // need to change the InputID to something other than ''
                // when trying to add several controls, and go back and edit them, the edits get applied to all the controls
                // that's bad

                string statement = "SELECT MAX( flngOrder ) + 1 FROM rfrControls WHERE flngControlHeadersIDFK = " + ViewState["chID"].ToString();
                string order = gc.DoScalar(statement).ToString();
                order = (order == "" ? "1" : order);

                // add a control to the bottom of the "order", with some default values
                //@#@# remove the extra columns when we get all the header stuff working
                statement = "INSERT INTO rfrControls ( ";
                statement += "	fstrFileType, ";
                statement += "	fstrDocName, ";
                statement += "	fstrInputID, ";
                statement += "	fstrTaxProgram, ";
                statement += "	flngTaxYear, ";
                statement += "	fstrTaxForm, ";
                statement += "	flngOrder, ";
                statement += "	fstrTable, ";
                statement += "	fstrColumn, ";
                statement += "	flngDispLength, ";
                statement += "	flngMaxLength, ";
                statement += "	fblnHidden, ";
                statement += "	flngVBVarType, ";
                statement += "	flngBlock, ";
                //@#@# statement += "	fblnPostBack, ";
                statement += "	fblnVertSkip, ";
                statement += "	fstrLabel, ";
                statement += "	fblnActive, ";
                statement += "	flngCtrlMove, ";
                statement += "	flngImgMoveX, ";
                statement += "	flngImgMoveY, ";
                statement += "	flngMarkerMoveX, ";
                statement += "	flngMarkerMoveY, ";
                statement += "	fstrNextCtrl, ";
                statement += "	flngFormatIDFK, ";
                statement += "	fstrTranslate, ";
                statement += "	flngControlHeadersIDFK ) ";
                statement += "SELECT ";
                statement += "	rh.fstrFileType, ";
                statement += "	'', ";
                statement += "	'" + typeDDL.SelectedValue + "' + '" + order.ToString() + "', ";
                statement += "	rh.fstrTaxProgram, ";
                statement += "	rh.flngTaxYear, ";
                statement += "	ch.fstrTaxForm, ";
                statement += order + ", ";
                statement += "	ch.fstrTable, ";
                statement += "	'', ";
                statement += "	10, ";
                statement += "	10, ";
                statement += "	0, ";
                statement += "	8, ";
                statement += "	ch.flngBlock, ";
                statement += "	0, ";
                statement += "	'', ";
                statement += "	1, ";
                // new movement values
                if (lockMoveCKB.Checked)
                {
                    statement += controlScrollTXT.Text + ", ";
                    statement += imageXTXT.Text + ", ";
                    statement += imageYTXT.Text + ", ";
                    statement += markerXTXT.Text + ", ";
                    statement += markerYTXT.Text + ", ";
                }
                else
                {
                    statement += "	0, ";
                    statement += "	0, ";
                    statement += "	0, ";
                    statement += "	0, ";
                    statement += "	0, ";
                }
                statement += "	'btnSub', ";
                statement += "	-1, ";
                statement += "	'', ";
                statement += ViewState["chID"] + " ";
                statement += "FROM ";
                statement += "	rfrReturnHeaders rh, ";
                statement += "	rfrControlHeaders ch ";
                statement += "WHERE ";
                statement += "	rh.idReturnHeaders = " + Request.QueryString["rhID"].ToString() + " AND ";
                statement += "	ch.idControlHeaders = " + ViewState["chID"].ToString() + " AND ";
                statement += "	ch.flngReturnHeadersIDFK = rh.idReturnHeaders;";

                gc.DoExecute(statement);

                gc.Disconnect();
                // and reload to reflect the changes
                LoadControls();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }

        protected void OnClick_removeBTN(object sender, EventArgs e)
        {
            if (Request.Form["selCtrl"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alertNone", "alert('Please select a control first.');", true);
                return;
            }

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // get this controls flngOrder
                string statement = "SELECT flngOrder ";
                statement += "FROM rfrControls ";
                statement += "WHERE IDrfrControls = " + Request.Form["selCtrl"].ToString();
                statement += " AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                string newOrder = gc.DoScalar(statement).ToString();

                // remove the control from the DB
                statement = "DELETE FROM rfrControls WHERE flngOrder = " + newOrder;
                statement += " AND IDrfrControls = " + Request.Form["selCtrl"].ToString();
                statement += " AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                // adjust the following "orders" appropriately
                statement = "UPDATE rfrControls SET flngOrder = flngOrder - 1 ";
                statement += "WHERE flngOrder > " + newOrder;
                statement += " AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                // and remove any auto functions this control might have had
                statement = "DELETE FROM tblAutoJavaComplete WHERE flngControlOutIDFK = " + Request.Form["selCtrl"].ToString() + ";";
                statement += "DELETE FROM tblAutoJavaComplete WHERE flngControl1IDFK = " + Request.Form["selCtrl"].ToString() + ";";
                statement += "DELETE FROM tblAutoJavaComplete WHERE flngControl2IDFK = " + Request.Form["selCtrl"].ToString() + ";";
                gc.DoExecute(statement);

                gc.Disconnect();
                // and reload to reflect the changes
                LoadControls();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }

        protected void OnClick_moveUpBTN(object sender, EventArgs e)
        {
            if (Request.Form["selCtrl"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alertNone", "alert('Please select a control first.');", true);
                return;
            }

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // move the next control up in the sequence (moves it lower on the page)
                string statement = "UPDATE rfrControls ";
                statement += "SET flngOrder = flngOrder + 1 ";
                statement += "WHERE flngOrder = ";
                statement += "( SELECT flngOrder - 1 ";
                statement += "FROM rfrControls ";
                statement += "WHERE flngControlHeadersIDFK = " + ViewState["chID"].ToString();
                statement += " AND IDrfrControls = '" + Request.Form["selCtrl"].ToString();
                statement += "' ) AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                // move this control down in the sequence (moves it higher in the list)
                statement = "UPDATE rfrControls ";
                statement += "SET flngOrder = flngOrder - 1 ";
                statement += "WHERE IDrfrControls = '" + Request.Form["selCtrl"].ToString();
                statement += "' AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                gc.Disconnect();
                // and reload to reflect the changes
                LoadControls();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_moveDnBTN(object sender, EventArgs e)
        {
            if (Request.Form["selCtrl"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alertNone", "alert('Please select a control first.');", true);
                return;
            }

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // move the next control up in the sequence (moves it lower on the page)
                string statement = "UPDATE rfrControls ";
                statement += "SET flngOrder = flngOrder - 1 ";
                statement += "WHERE flngOrder = ";
                statement += "( SELECT flngOrder + 1 ";
                statement += "FROM rfrControls ";
                statement += "WHERE flngControlHeadersIDFK = " + ViewState["chID"].ToString();
                statement += " AND IDrfrControls = '" + Request.Form["selCtrl"].ToString();
                statement += "' ) AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                // move this control down in the sequence (moves it higher in the list)
                statement = "UPDATE rfrControls ";
                statement += "SET flngOrder = flngOrder + 1 ";
                statement += "WHERE IDrfrControls = '" + Request.Form["selCtrl"].ToString() + "' ";
                statement += "AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                gc.Disconnect();
                // and reload to reflect the changes
                LoadControls();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_testBTN(object sender, EventArgs e)
        {
            // redirect with the whole query string, it will need the same values
            Response.Redirect("formTest.aspx?rhID=" + Request.QueryString["rhID"] + "&chID=" + ViewState["chID"].ToString() + "&topHeaderID=" + Request.QueryString["topHeaderID"].ToString(), true);
        }

        protected void OnClick_IDclipBTN(object sender, EventArgs e)
        {
            string statement = "UPDATE rfrControlHeaders SET ";
            statement += "flngClipTop = " + clipTopTXT.Text + ", ";
            statement += "flngClipRight = " + clipRightTXT.Text + ", ";
            statement += "flngClipBottom = " + clipBotTXT.Text + ", ";
            statement += "flngClipLeft = " + clipLeftTXT.Text + "";
            statement += " WHERE idControlHeaders = " + ViewState["topHeaderID"].ToString() + ";";
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                gc.DoExecute(statement);
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }

        //@#@#
        protected void OnClick_saveOptionsBTN(object sender, EventArgs e)
        {
            if (Request.Form["selCtrl"] == null)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alertNone", "alert('Please select a control first.');", true);
                return;
            }

            GoodConn gc = new GoodConn();
            string statement = "";
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                statement = "UPDATE rfrControls SET ";
                statement += "fstrLabel = '" + UtilClass.Sanitize(labelTXT.Text) + "', ";
                statement += "fstrColumn = '" + UtilClass.Sanitize(columnIDTXT.Text) + "', ";
                statement += "fstrInputID = '" + UtilClass.Sanitize(inputIDTXT.Text) + "', ";
                statement += "fstrDocName = '" + UtilClass.Sanitize(gentaxFieldTXT.Text) + "', ";
                statement += "flngDispLength = " + UtilClass.Sanitize(dispLenTXT.Text) + ", ";
                statement += "flngMaxLength = " + UtilClass.Sanitize(maxLenTXT.Text) + ", ";
                statement += "fblnHidden = " + (hiddenCKB.Checked ? "1" : "0") + ", ";
                statement += "fblnRequired = " + (requiredCKB.Checked ? "1" : "0") + ", ";

                if (taxProgTXT.Text == "OGD")
                {
                    if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "0")
                    {
                        statement += "flngCtrlMove = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                        statement += "flngImgMoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                        statement += "flngImgMoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                        statement += "flngMarkerMoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                        statement += "flngMarkerMoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                    }
                    if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "2")
                    {
                        statement += "flngCtrl2Move = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                        statement += "flngImg2MoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                        statement += "flngImg2MoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                        statement += "flngMarker2MoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                        statement += "flngMarker2MoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                    }
                    if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "3")
                    {
                        statement += "flngCtrl3Move = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                        statement += "flngImg3MoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                        statement += "flngImg3MoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                        statement += "flngMarker3MoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                        statement += "flngMarker3MoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                    }
                    if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "4")
                    {
                        statement += "flngCtrl4Move = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                        statement += "flngImg4MoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                        statement += "flngImg4MoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                        statement += "flngMarker4MoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                        statement += "flngMarker4MoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                    }
                    if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "5")
                    {
                        statement += "flngCtrl5Move = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                        statement += "flngImg5MoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                        statement += "flngImg5MoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                        statement += "flngMarker5MoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                        statement += "flngMarker5MoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                    }
                    if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "6")
                    {
                        statement += "flngCtrl6Move = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                        statement += "flngImg6MoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                        statement += "flngImg6MoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                        statement += "flngMarker6MoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                        statement += "flngMarker6MoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                    }
                    if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "7")
                    {
                        statement += "flngCtrl7Move = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                        statement += "flngImg7MoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                        statement += "flngImg7MoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                        statement += "flngMarker7MoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                        statement += "flngMarker7MoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                    }
                }
                else
                {
                    statement += "flngCtrlMove = " + UtilClass.Sanitize(controlScrollTXT.Text) + ", ";
                    statement += "flngImgMoveX = " + UtilClass.Sanitize(imageXTXT.Text) + ", ";
                    statement += "flngImgMoveY = " + UtilClass.Sanitize(imageYTXT.Text) + ", ";
                    statement += "flngMarkerMoveX = " + UtilClass.Sanitize(markerXTXT.Text) + ", ";
                    statement += "flngMarkerMoveY = " + UtilClass.Sanitize(markerYTXT.Text) + ", ";
                }

                statement += "flngFormatIDFK = " + dataTypeDDL.SelectedValue + ", ";
                statement += "fstrTranslate = '" + UtilClass.Sanitize(ckbTransTXT.Text) + "', ";
                bool isTXT = (inputIDTXT.Text.Substring(0, 3) == "txt");
                statement += "fstrNextCtrl = '" + nextControlDDL.SelectedValue + "', ";
                statement += "fblnVertSkip = " + (vertSkipCKB.Checked ? "1" : "0") + ", ";
                statement += "flngVBVarType = " + varTypeDDL.SelectedValue + " ";
                statement += "WHERE IDrfrControls = " + Request.Form["selCtrl"].ToString() + " AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);
                gc.Disconnect();

                // and reload to reflect the changes
                LoadControls();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_saveOffsetBTN(object sender, EventArgs e)
        {
            // if this isn't a repeater, do nothing, it doesn't mean anything
            // the page gets Nihilistic if you're trying to this to a normal form
            if (int.Parse(ViewState["isRepeater"].ToString()) == -1)
                return;

            // only need to save one value in the DB
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                string statement = "UPDATE rfrControlHeaders ";
                statement += "SET flngRepeatOffset = " + blockOffsetTXT.Text;
                statement += " WHERE idControlHeaders = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_saveZoomPercBTN(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string statement = "UPDATE rfrControlHeaders SET ";
                statement += "fintZoomPerc = " + zoomPercTXT.Text + " WHERE ";
                statement += "IDControlHeaders = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_saveHeaderNumberStartsBTN(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string statement = "UPDATE rfrControlHeaders ";
                statement += "SET flngHeaderStart = " + headerNumberStartsTXT.Text;
                statement += " WHERE IDControlHeaders = " + ViewState["chID"].ToString() + ";";
                gc.DoExecute(statement);

                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        //@#@#
        protected void OnClick_hiddenBTN(object sender, EventArgs e)
        {
            // this is clicked via javascript in the update panel
            // load the control values and display them
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string statement = "SELECT ";
                statement += "fstrLabel, ";
                statement += "fstrColumn, ";
                statement += "fstrInputID, ";
                statement += "fstrDocName, ";
                statement += "flngDispLength, ";
                statement += "flngMaxLength, ";
                statement += "fblnHidden, ";
                statement += "fblnRequired, ";
                statement += "flngCtrlMove, ";
                statement += "flngImgMoveX, ";
                statement += "flngImgMoveY, ";
                statement += "flngMarkerMoveX, ";
                statement += "flngMarkerMoveY, ";
                statement += "flngCtrl2Move, ";
                statement += "flngImg2MoveX, ";
                statement += "flngImg2MoveY, ";
                statement += "flngMarker2MoveX, ";
                statement += "flngMarker2MoveY, ";
                statement += "flngCtrl3Move, ";
                statement += "flngImg3MoveX, ";
                statement += "flngImg3MoveY, ";
                statement += "flngMarker3MoveX, ";
                statement += "flngMarker3MoveY, ";
                statement += "flngCtrl4Move, ";
                statement += "flngImg4MoveX, ";
                statement += "flngImg4MoveY, ";
                statement += "flngMarker4MoveX, ";
                statement += "flngMarker4MoveY, ";
                statement += "flngCtrl5Move, ";
                statement += "flngImg5MoveX, ";
                statement += "flngImg5MoveY, ";
                statement += "flngMarker5MoveX, ";
                statement += "flngMarker5MoveY, ";
                statement += "flngCtrl6Move, ";
                statement += "flngImg6MoveX, ";
                statement += "flngImg6MoveY, ";
                statement += "flngMarker6MoveX, ";
                statement += "flngMarker6MoveY, ";
                statement += "flngCtrl7Move, ";
                statement += "flngImg7MoveX, ";
                statement += "flngImg7MoveY, ";
                statement += "flngMarker7MoveX, ";
                statement += "flngMarker7MoveY, ";
                statement += "fstrNextCtrl, ";
                statement += "flngFormatIDFK, ";
                statement += "fstrTranslate, ";
                statement += "fblnVertSkip, ";
                statement += "flngVBVarType ";
                statement += "FROM rfrControls WHERE IDrfrControls = " + Request.Form["selCtrl"] + " AND flngControlHeadersIDFK = " + ViewState["chID"].ToString() + ";";
                gc.DoSelect(statement);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    labelTXT.Text = dt.Rows[0]["fstrLabel"].ToString();
                    inputIDTXT.Text = dt.Rows[0]["fstrInputID"].ToString();
                    columnIDTXT.Text = dt.Rows[0]["fstrColumn"].ToString();
                    gentaxFieldTXT.Text = dt.Rows[0]["fstrDocName"].ToString();
                    maxLenTXT.Text = dt.Rows[0]["flngMaxLength"].ToString();
                    hiddenCKB.Checked = (dt.Rows[0]["fblnHidden"].ToString() == "1");
                    requiredCKB.Checked = (dt.Rows[0]["fblnRequired"].ToString() == "1");
                    dispLenTXT.Text = dt.Rows[0]["flngDispLength"].ToString();
                    vertSkipCKB.Checked = (dt.Rows[0]["fblnVertSkip"].ToString() == "1");
                    varTypeDDL.SelectedValue = dt.Rows[0]["flngVBVarType"].ToString();
                    ckbTransTXT.Text = dt.Rows[0]["fstrTranslate"].ToString();

                    // here need to check if the lock movements is checked, and deal with it accordingly					
                    // if locked, don't change these numbers at all
                    string sBuff2 = "";
                    if (!lockMoveCKB.Checked)
                    {
                        if (taxProgTXT.Text == "OGD")
                        {
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "0")
                            {
                                imageXTXT.Text = dt.Rows[0]["flngImgMoveX"].ToString();
                                imageYTXT.Text = dt.Rows[0]["flngImgMoveY"].ToString();
                                controlScrollTXT.Text = dt.Rows[0]["flngCtrlMove"].ToString();
                                markerXTXT.Text = dt.Rows[0]["flngMarkerMoveX"].ToString();
                                markerYTXT.Text = dt.Rows[0]["flngMarkerMoveY"].ToString();
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "2")
                            {
                                imageXTXT.Text = dt.Rows[0]["flngImg2MoveX"].ToString();
                                imageYTXT.Text = dt.Rows[0]["flngImg2MoveY"].ToString();
                                controlScrollTXT.Text = dt.Rows[0]["flngCtrl2Move"].ToString();
                                markerXTXT.Text = dt.Rows[0]["flngMarker2MoveX"].ToString();
                                markerYTXT.Text = dt.Rows[0]["flngMarker2MoveY"].ToString();
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "3")
                            {
                                imageXTXT.Text = dt.Rows[0]["flngImg3MoveX"].ToString();
                                imageYTXT.Text = dt.Rows[0]["flngImg3MoveY"].ToString();
                                controlScrollTXT.Text = dt.Rows[0]["flngCtrl3Move"].ToString();
                                markerXTXT.Text = dt.Rows[0]["flngMarker3MoveX"].ToString();
                                markerYTXT.Text = dt.Rows[0]["flngMarker3MoveY"].ToString();
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "4")
                            {
                                imageXTXT.Text = dt.Rows[0]["flngImg4MoveX"].ToString();
                                imageYTXT.Text = dt.Rows[0]["flngImg4MoveY"].ToString();
                                controlScrollTXT.Text = dt.Rows[0]["flngCtrl4Move"].ToString();
                                markerXTXT.Text = dt.Rows[0]["flngMarker4MoveX"].ToString();
                                markerYTXT.Text = dt.Rows[0]["flngMarker4MoveY"].ToString();
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "5")
                            {
                                imageXTXT.Text = dt.Rows[0]["flngImg5MoveX"].ToString();
                                imageYTXT.Text = dt.Rows[0]["flngImg5MoveY"].ToString();
                                controlScrollTXT.Text = dt.Rows[0]["flngCtrl5Move"].ToString();
                                markerXTXT.Text = dt.Rows[0]["flngMarker5MoveX"].ToString();
                                markerYTXT.Text = dt.Rows[0]["flngMarker5MoveY"].ToString();
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "6")
                            {
                                imageXTXT.Text = dt.Rows[0]["flngImg6MoveX"].ToString();
                                imageYTXT.Text = dt.Rows[0]["flngImg6MoveY"].ToString();
                                controlScrollTXT.Text = dt.Rows[0]["flngCtrl6Move"].ToString();
                                markerXTXT.Text = dt.Rows[0]["flngMarker6MoveX"].ToString();
                                markerYTXT.Text = dt.Rows[0]["flngMarker6MoveY"].ToString();
                            }
                            if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "7")
                            {
                                imageXTXT.Text = dt.Rows[0]["flngImg7MoveX"].ToString();
                                imageYTXT.Text = dt.Rows[0]["flngImg7MoveY"].ToString();
                                controlScrollTXT.Text = dt.Rows[0]["flngCtrl7Move"].ToString();
                                markerXTXT.Text = dt.Rows[0]["flngMarker7MoveX"].ToString();
                                markerYTXT.Text = dt.Rows[0]["flngMarker7MoveY"].ToString();
                            }
                        }
                        else
                        {
                            imageXTXT.Text = dt.Rows[0]["flngImgMoveX"].ToString();
                            imageYTXT.Text = dt.Rows[0]["flngImgMoveY"].ToString();
                            controlScrollTXT.Text = dt.Rows[0]["flngCtrlMove"].ToString();
                            markerXTXT.Text = dt.Rows[0]["flngMarkerMoveX"].ToString();
                            markerYTXT.Text = dt.Rows[0]["flngMarkerMoveY"].ToString();
                        }
                    }
                    // if the lock move IS checked, move the stuff to the values in the text boxes
                    // actually, whatever we set it to, move there
                    // if we locked them, they have the old values, if not locked and the selected control had values, then they are filled
                    // so move there
                    if (controlScrollTXT.Text != "")
                    {
                        string script = "$(document).ready(function(){";
                        script += "CtlMove(" + controlScrollTXT.Text + ", 0);";
                        script += "moveStuff($(\"#hidLand\").val()," + imageXTXT.Text + "," + imageYTXT.Text + ",true," + markerXTXT.Text + "," + markerYTXT.Text + ",true);";
                        script += "});";
                        ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "moveScript", script, true);
                    }

                    // set the next control and the format type
                    dataTypeDDL.SelectedIndex = -1;
                    lookupCKB.Enabled = false;
                    nextControlDDL.SelectedIndex = -1;
                    sBuff2 = dt.Rows[0]["fstrNextCtrl"].ToString();
                    for (int i = 0; i < nextControlDDL.Items.Count; i++)
                    {
                        if (nextControlDDL.Items[i].Value == sBuff2)
                        {
                            nextControlDDL.SelectedValue = sBuff2;
                            break;
                        }
                    }
                    // if the control wasn't there, make this the end of the form
                    if (nextControlDDL.SelectedValue != sBuff2)
                        nextControlDDL.SelectedValue = "btnSub";

                    //@#@# fill the dataTypeDDL with the format IDFK
                    sBuff2 = dt.Rows[0]["flngFormatIDFK"].ToString();
                    for (int i = 0; i < dataTypeDDL.Items.Count; i++)
                    {
                        if (dataTypeDDL.Items[i].Value == sBuff2)
                        {
                            dataTypeDDL.SelectedValue = sBuff2;
                            break;
                        }
                    }
                    // if the control wasn't there, make this the end of the form
                    if (dataTypeDDL.SelectedValue != sBuff2)
                        dataTypeDDL.SelectedIndex = -1;

                }
                gc.Disconnect();
                // rebind the GDV
                Rebind();
                // reset
                newField1DDLfocus.SelectedValue = "-1";
                newField2DDLfocus.SelectedValue = "-1";
                newFuncDDLfocus.SelectedValue = "-1";
                newField1DDLblur.SelectedValue = "-1";
                newField2DDLblur.SelectedValue = "-1";
                newFuncDDLblur.SelectedValue = "-1";
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        #region GridView functions

        private void Rebind()
        {
            // if nothing selected, nothing to do
            if ((Request.Form["selCtrl"] ?? "") == "")
                return;

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // focus
                // also load any JS templates we might have
                string statement = "SELECT IDtblAutoJavaComplete AS idCol, ";
                statement += "flngControl1IDFK, flngControl2IDFK, flngName1IDFK, ";
                statement += "flngName2IDFK, fdecConstant, flngJavaFuncIDFK, flngOrder ";
                statement += "FROM tblAutoJavaComplete ";
                statement += "WHERE flngControlOutIDFK = " + Request.Form["selCtrl"];
                statement += " AND fblnOnBlur = 0 ";
                statement += "ORDER BY flngOrder;";
                gc.DoSelect(statement);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                jsAutoGDVfocus.DataSource = null;
                jsAutoGDVfocus.DataBind();
                if (numRows > 0)
                {
                    jsAutoGDVfocus.DataSource = dt;
                    jsAutoGDVfocus.DataBind();
                }

                // blur
                statement = "SELECT IDtblAutoJavaComplete AS idCol, ";
                statement += "flngControl1IDFK, flngControl2IDFK, flngName1IDFK, ";
                statement += "flngName2IDFK, fdecConstant, flngJavaFuncIDFK, flngOrder ";
                statement += "FROM tblAutoJavaComplete ";
                statement += "WHERE flngControlOutIDFK = " + Request.Form["selCtrl"];
                statement += " AND fblnOnBlur = 1 ";
                statement += "ORDER BY flngOrder;";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                jsAutoGDVblur.DataSource = null;
                jsAutoGDVblur.DataBind();
                if (numRows > 0)
                {
                    jsAutoGDVblur.DataSource = dt;
                    jsAutoGDVblur.DataBind();
                }

                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        // when binding, to fill the DDLs
        // SELECTed values
        // (0) IDtblAutoJavaComplete AS idCol
        // (1) flngControl1IDFK
        // (2) flngControl2IDFK
        // (3) flngName1IDFK
        // (4) flngName2IDFK
        // (5) fdecConstant
        // (6) flngJavaFuncIDFK 
        // (7) flngOrder
        protected void OnRowDataBound_jsAutoGDVfocus(object sender, GridViewRowEventArgs e)
        {
            // here we need to fill the DDLs and set the selections
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl1 = (DropDownList)e.Row.FindControl("field1DDL");
                DropDownList ddl2 = (DropDownList)e.Row.FindControl("field2DDL");
                DropDownList nddl1 = (DropDownList)e.Row.FindControl("name1DDL");
                DropDownList nddl2 = (DropDownList)e.Row.FindControl("name2DDL");
                foreach (ListItem li in newField1DDLfocus.Items)
                {
                    ddl1.Items.Add(new ListItem(li.Text, li.Value));
                    ddl2.Items.Add(new ListItem(li.Text, li.Value));
                    nddl1.Items.Add(new ListItem(li.Text, li.Value));
                    nddl2.Items.Add(new ListItem(li.Text, li.Value));
                }
                // when tblAutoJavaComplete.flngControl1IDFK is either -10 or -20, do something different
                ddl1.Items.Insert(1, new ListItem("Previous Row", "-10"));
                ddl1.Items.Insert(1, new ListItem("Constant", "-20"));
                ddl2.Items.Insert(1, new ListItem("Previous Row", "-10"));
                ddl2.Items.Insert(1, new ListItem("Constant", "-20"));
                nddl1.Items.Insert(1, new ListItem("Select Name", "-1"));
                nddl2.Items.Insert(1, new ListItem("Select Name", "-1"));
                DropDownList ddl3 = (DropDownList)e.Row.FindControl("funcDDL");
                foreach (ListItem li in newFuncDDLfocus.Items)
                    ddl3.Items.Add(new ListItem(li.Text, li.Value));

                ddl1.SelectedValue = ((DataTable)jsAutoGDVfocus.DataSource).Rows[e.Row.RowIndex][1].ToString();
                ddl2.SelectedValue = ((DataTable)jsAutoGDVfocus.DataSource).Rows[e.Row.RowIndex][2].ToString();
                nddl1.SelectedValue = ((DataTable)jsAutoGDVfocus.DataSource).Rows[e.Row.RowIndex][3].ToString();
                nddl2.SelectedValue = ((DataTable)jsAutoGDVfocus.DataSource).Rows[e.Row.RowIndex][4].ToString();
                ddl3.SelectedValue = ((DataTable)jsAutoGDVfocus.DataSource).Rows[e.Row.RowIndex][6].ToString();

                // set the constant text and visibility
                if (ddl1.SelectedValue == "-20" || ddl2.SelectedValue == "-20")
                    ((TextBox)e.Row.FindControl("constantTXT")).Visible = true;
                ((TextBox)e.Row.FindControl("constantTXT")).Text = ((DataTable)jsAutoGDVfocus.DataSource).Rows[e.Row.RowIndex][5].ToString();
            }
        }

        // when binding, to fill the DDLs
        // SELECTed values
        // (0) IDtblAutoJavaComplete AS idCol
        // (1) flngControl1IDFK
        // (2) flngControl2IDFK
        // (3) flngName1IDFK
        // (4) flngName2IDFK
        // (5) fdecConstant
        // (6) flngJavaFuncIDFK 
        // (7) flngOrder
        protected void OnRowDataBound_jsAutoGDVblur(object sender, GridViewRowEventArgs e)
        {
            // here we need to fill the DDLs and set the selections
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl1 = (DropDownList)e.Row.FindControl("field1DDL");
                DropDownList ddl2 = (DropDownList)e.Row.FindControl("field2DDL");
                DropDownList nddl1 = (DropDownList)e.Row.FindControl("name1DDL");
                DropDownList nddl2 = (DropDownList)e.Row.FindControl("name2DDL");
                foreach (ListItem li in newField1DDLblur.Items)
                {
                    ddl1.Items.Add(new ListItem(li.Text, li.Value));
                    ddl2.Items.Add(new ListItem(li.Text, li.Value));
                    nddl1.Items.Add(new ListItem(li.Text, li.Value));
                    nddl2.Items.Add(new ListItem(li.Text, li.Value));
                }
                // when tblAutoJavaComplete.flngControl1IDFK is either -10 or -20, do something different
                ddl1.Items.Insert(1, new ListItem("Previous Row", "-10"));
                ddl1.Items.Insert(1, new ListItem("Constant", "-20"));
                ddl2.Items.Insert(1, new ListItem("Previous Row", "-10"));
                ddl2.Items.Insert(1, new ListItem("Constant", "-20"));
                nddl1.Items.Insert(1, new ListItem("Select Name", "-1"));
                nddl2.Items.Insert(1, new ListItem("Select Name", "-1"));
                DropDownList ddl3 = (DropDownList)e.Row.FindControl("funcDDL");
                foreach (ListItem li in newFuncDDLblur.Items)
                    ddl3.Items.Add(new ListItem(li.Text, li.Value));

                ddl1.SelectedValue = ((DataTable)jsAutoGDVblur.DataSource).Rows[e.Row.RowIndex][1].ToString();
                ddl2.SelectedValue = ((DataTable)jsAutoGDVblur.DataSource).Rows[e.Row.RowIndex][2].ToString();
                nddl1.SelectedValue = ((DataTable)jsAutoGDVblur.DataSource).Rows[e.Row.RowIndex][3].ToString();
                nddl2.SelectedValue = ((DataTable)jsAutoGDVblur.DataSource).Rows[e.Row.RowIndex][4].ToString();
                ddl3.SelectedValue = ((DataTable)jsAutoGDVblur.DataSource).Rows[e.Row.RowIndex][6].ToString();

                // set the constant text and visibility
                if (ddl1.SelectedValue == "-20" || ddl2.SelectedValue == "-20")
                    ((TextBox)e.Row.FindControl("constantTXT")).Visible = true;
                ((TextBox)e.Row.FindControl("constantTXT")).Text = ((DataTable)jsAutoGDVblur.DataSource).Rows[e.Row.RowIndex][5].ToString();
            }
        }

        // when the first field is selected, if it's not a control, we need to do some things idfferently
        protected void OnSelectedIndexChanged_field1DDL(object sender, EventArgs e)
        {
            // get the control and it's row
            DropDownList myDDL = (DropDownList)sender;
            // parent 1 is the cell, parent 2 is the row
            GridViewRow myRow = ((GridViewRow)myDDL.Parent.Parent);

            // -20 is the "constant" value, show the text box, otherwise, make sure it's gone
            if (myDDL.SelectedValue == "-20")
                ((TextBox)myRow.FindControl("constantTXT")).Visible = true;
            else
                ((TextBox)myRow.FindControl("constantTXT")).Visible = false;
        }

        // to add a new row to GDV, must save changes when done
        protected void OnCommand_addRowBTN(object sender, CommandEventArgs e)
        {
            // simply add a row, using the values from the DDLs
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string statement = "SELECT ISNULL( MAX( flngOrder ) + 1, 1 ) ";
                statement += "FROM tblAutoJavaComplete ";
                statement += "WHERE flngControlOutIDFK = " + Request.Form["selCtrl"];
                statement += " AND fblnOnBlur = " + (e.CommandArgument.ToString() == "focus" ? "0;" : "1;");
                string order = gc.DoScalar(statement).ToString();

                statement = "INSERT INTO tblAutoJavaComplete ";
                statement += "( flngControlOutIDFK, flngControl1IDFK, flngControl2IDFK, fdecConstant, flngJavaFuncIDFK, fblnOnBlur, flngOrder ) VALUES ( ";
                statement += Request.Form["selCtrl"] + ", ";        // flngControlOutIDFK
                if (e.CommandArgument.ToString() == "focus")
                {
                    statement += newField1DDLfocus.SelectedValue + ", ";        // flngControl1IDFK
                    statement += newField2DDLfocus.SelectedValue + ", ";        // flngControl2IDFK
                    statement += "1, ";                                 // fdecConstant
                    statement += newFuncDDLfocus.SelectedValue + ", ";      // flngJavaFuncIDFK
                    statement += "0, ";     // fblnOnBlur
                }
                else if (e.CommandArgument.ToString() == "blur")
                {
                    statement += newField1DDLblur.SelectedValue + ", ";     // flngControl1IDFK
                    statement += newField2DDLblur.SelectedValue + ", ";     // flngControl2IDFK
                    statement += "1, ";                                 // fdecConstant
                    statement += newFuncDDLblur.SelectedValue + ", ";       // flngJavaFuncIDFK
                    statement += "1, ";     // fblnOnBlur
                }
                statement += order + " );";                         // flngOrder
                gc.DoExecute(statement);
                //@#@# the reload should then put these values in the GDV where they can be edited
                gc.Disconnect();
                // rebind the GDV
                Rebind();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        // for the remove button
        protected void OnRowCommand_jsAutoGDVfocus(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "removeROW")
            {
                // the argument is the row index
                int index = int.Parse(e.CommandArgument.ToString());
                // from which we can get the DataKeys
                string idCol = jsAutoGDVfocus.DataKeys[index]["idCol"].ToString();
                string flngOrder = jsAutoGDVfocus.DataKeys[index]["flngOrder"].ToString();

                // now we can do what we need
                GoodConn gc = new GoodConn();
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                    string statement = "DELETE FROM tblAutoJavacomplete ";
                    statement += "WHERE IDtblAutoJavaComplete = " + idCol + ";";
                    gc.DoExecute(statement);
                    // and then update the order values
                    statement = "UPDATE tblAutoJavaComplete SET flngOrder = flngOrder - 1 ";
                    statement += "WHERE flngControlOutIDFK = " + Request.Form["selCtrl"];
                    statement += " AND flngOrder >= " + flngOrder;
                    statement += " AND fblnOnBlur = 0;";
                    gc.DoExecute(statement);
                    gc.Disconnect();
                    // rebind the GDV
                    Rebind();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }
            }
        }

        // for the remove button
        protected void OnRowCommand_jsAutoGDVblur(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "removeROW")
            {
                // the argument is the row index
                int index = int.Parse(e.CommandArgument.ToString());
                // from which we can get the DataKeys
                string idCol = jsAutoGDVblur.DataKeys[index]["idCol"].ToString();
                string flngOrder = jsAutoGDVblur.DataKeys[index]["flngOrder"].ToString();

                // now we can do what we need
                GoodConn gc = new GoodConn();
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                    string statement = "DELETE FROM tblAutoJavacomplete WHERE IDtblAutoJavaComplete = " + idCol + ";";
                    gc.DoExecute(statement);
                    // and then update the order values
                    statement = "UPDATE tblAutoJavaComplete ";
                    statement += "SET flngOrder = flngOrder - 1 ";
                    statement += "WHERE flngControlOutIDFK = " + Request.Form["selCtrl"];
                    statement += " AND flngOrder >= " + flngOrder;
                    statement += " AND fblnOnBlur = 1;";
                    gc.DoExecute(statement);
                    gc.Disconnect();
                    // rebind the GDV
                    Rebind();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }
            }
        }

        // outside of the GDV, save any changes that are there
        protected void OnCommand_saveJSBTN(object sender, CommandEventArgs e)
        {
            // if nothing in the GDV, leave
            if ((e.CommandArgument.ToString() == "focus" && jsAutoGDVfocus.Rows.Count == 0) ||
                (e.CommandArgument.ToString() == "blur" && jsAutoGDVblur.Rows.Count == 0))
                return;

            // everything in the GDV is already in the DB, so just loop an UPDATE
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string statement = "";
                int loopEnd = (e.CommandArgument.ToString() == "focus" ? jsAutoGDVfocus.Rows.Count : jsAutoGDVblur.Rows.Count);
                for (int i = 0; i < loopEnd; i++)
                {
                    // build the UPDATE based on the DDL selected value
                    if (e.CommandArgument.ToString() == "focus")
                    {
                        DropDownList ddl1 = (DropDownList)jsAutoGDVfocus.Rows[i].FindControl("field1DDL");
                        DropDownList ddl2 = (DropDownList)jsAutoGDVfocus.Rows[i].FindControl("field2DDL");
                        DropDownList nddl1 = (DropDownList)jsAutoGDVfocus.Rows[i].FindControl("name1DDL");
                        DropDownList nddl2 = (DropDownList)jsAutoGDVfocus.Rows[i].FindControl("name2DDL");
                        DropDownList ddl3 = (DropDownList)jsAutoGDVfocus.Rows[i].FindControl("funcDDL");
                        TextBox cTXT = (TextBox)jsAutoGDVfocus.Rows[i].FindControl("constantTXT");
                        statement += "UPDATE tblAutoJavaComplete SET ";
                        statement += "flngControl1IDFK = " + ddl1.SelectedValue + ", ";
                        statement += "flngControl2IDFK = " + ddl2.SelectedValue + ", ";
                        if (nddl1.SelectedValue != "-1")
                            statement += "flngName1IDFK = " + nddl1.SelectedValue + ", ";
                        if (nddl2.SelectedValue != "-1")
                            statement += "flngName2IDFK = " + nddl2.SelectedValue + ", ";
                        if (cTXT.Visible)
                            statement += "fdecConstant = " + cTXT.Text + ", ";
                        else
                            statement += "fdecConstant = 1, ";
                        statement += "flngJavaFuncIDFK = " + ddl3.SelectedValue + " WHERE ";
                        statement += "IDtblAutoJavaComplete = " + jsAutoGDVfocus.DataKeys[i].Value.ToString() + ";";
                    }
                    else if (e.CommandArgument.ToString() == "blur")
                    {
                        DropDownList ddl1 = (DropDownList)jsAutoGDVblur.Rows[i].FindControl("field1DDL");
                        DropDownList ddl2 = (DropDownList)jsAutoGDVblur.Rows[i].FindControl("field2DDL");
                        DropDownList nddl1 = (DropDownList)jsAutoGDVblur.Rows[i].FindControl("name1DDL");
                        DropDownList nddl2 = (DropDownList)jsAutoGDVblur.Rows[i].FindControl("name2DDL");
                        DropDownList ddl3 = (DropDownList)jsAutoGDVblur.Rows[i].FindControl("funcDDL");
                        TextBox cTXT = (TextBox)jsAutoGDVblur.Rows[i].FindControl("constantTXT");
                        statement += "UPDATE tblAutoJavaComplete SET ";
                        statement += "flngControl1IDFK = " + ddl1.SelectedValue + ", ";
                        statement += "flngControl2IDFK = " + ddl2.SelectedValue + ", ";
                        if (nddl1.SelectedValue != "-1")
                            statement += "flngName1IDFK = " + nddl1.SelectedValue + ", ";
                        if (nddl2.SelectedValue != "-1")
                            statement += "flngName2IDFK = " + nddl2.SelectedValue + ", ";
                        if (cTXT.Visible)
                            statement += "fdecConstant = " + cTXT.Text + ", ";
                        else
                            statement += "fdecConstant = 1, ";
                        statement += "flngJavaFuncIDFK = " + ddl3.SelectedValue + " WHERE ";
                        statement += "IDtblAutoJavaComplete = " + jsAutoGDVblur.DataKeys[i].Value.ToString() + ";";
                    }
                }
                // the loop strung all the UPDATEs together, execute them all
                gc.DoExecute(statement);
                gc.Disconnect();
                // rebind the GDV
                Rebind();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        #endregion

    }
}
