using GenKFI.Properties;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class NewTaxYear : System.Web.UI.Page
    {
        private string strCurrPage;
        protected void Page_Load(object sender, EventArgs e)
        {
            #region common load code

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            //@#@# common code on all pages
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            // this is the only thing that changes across pages
            strCurrPage = "New Tax Year";
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

            // on some pages, we want to restrict to a single tax program
            // hide the drop down selection
            ((Panel)Master.FindControl("tpSELPNL")).Visible = false;

            #endregion

            if (!IsPostBack)
            {
                GoodConn gc = new GoodConn();
                string strSQL = "";
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                    // load all the headers for the forms
                    // no more GROUP BY
                    strSQL = "SELECT progCode, description FROM progCodes WHERE progCode = '" + Session["tpSelHID"].ToString() + "';";
                    gc.DoSelect(strSQL);
                    DataTable dt = new DataTable();
                    int numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        txtProgCode.Text = dt.Rows[0]["progCode"].ToString();
                        txtDesc.Text = dt.Rows[0]["description"].ToString();
                    }

                    strSQL = "SELECT idReturnHeaders, fstrFileType, flngTaxYear, fstrTaxProgram FROM rfrReturnHeaders WHERE fstrTaxProgram = '" + Session["tpSelHID"].ToString() + "' ORDER BY flngTaxYear Desc;";
                    gc.DoSelect(strSQL);
                    numRows = gc.ReadSelect(out dt);

                    if (numRows > 0)
                    {
                        oFileType.Text = dt.Rows[0]["fstrFileType"].ToString();
                        oTaxYear.Text = dt.Rows[0]["flngTaxYear"].ToString();
                    }

                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }

            }
        }
        protected void OnClick_ProgCode(object sender, EventArgs e)
        {
            string strSQL = "";
            string strRemoved = "";
            int numRows = 0;
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();

            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                strSQL = "SELECT progCode, description, removed FROM progCodes WHERE progCode = '" + txtProgCode.Text + "'";
                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows == 0)
                {
                    strSQL = "INSERT INTO progCode (progCode, description, removed)";
                    strSQL += " VALUES ('" + txtProgCode.Text + "', '" + txtDesc + "', " + 0 +")";
                    gc.DoExecute(strSQL);                        
                }
                else
                {
                    strRemoved = dt.Rows[0]["removed"].ToString();
                    if (strRemoved == "1")
                    {
                        strSQL = "UPDATE progCode ";
                        strSQL += "SET removed = 0 ";
                        strSQL += "WHERE progCode = '" + txtProgCode.Text + "' ";
                        gc.DoExecute(strSQL);
                    }
                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }
        protected void OnClick_CopyTo(object sender, EventArgs e)
        {
            if (oFileType.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "oFileType", "alert('Copy From FileType Needed.');", true);
                return;
            }
            if (oTaxYear.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "oTaxYear", "alert('Copy From Year Needed.');", true);
                return;
            }
            if (nFileType.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "nFileType", "alert('Copy To FileType Needed.');", true);
                return;
            }
            if (nTaxYear.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "nTaxYear", "alert('Copy To Year Needed.');", true);
                return;
            }
            GoodConn gc = new GoodConn();
            string statement = "";
            string strSQL = "";
            string from_idReturnheaders = "";
            string new_idReturnheaders = "";
            string new_idControlHeaders = "";
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                // Get From idReturnheaders
                strSQL = "SELECT idReturnHeaders FROM rfrReturnHeaders WHERE fstrFileType = '" + oFileType.Text + "' AND flngTaxYear = '" + oTaxYear.Text + "';";
                from_idReturnheaders = gc.DoScalar(strSQL).ToString();
                // Add rfrTaxPgm Records
                strSQL = "INSERT INTO rfrTaxPgm ( ";
                strSQL += "fstrClass, fstrFileType, fstrTaxProgram, fstrTaxYear, fintJobIdDev, fintJobIdProd, ";
                strSQL += "fstrSQL, fstrBatchSource, fstrBatchPrefix, fstrBatchSuffix, fstrBatchType, fstrAccountType, fdtmFilingPeriod, ";
                strSQL += "fdtmDueDate, fstrDocType, fintDocVer, fstrPrimType, fstrSecType, fbln2Db, fblnImport, fblnExtract, fblnActive, ";
                strSQL += "fblnPtdAddition, fintCompDev, fintCompPrd, fblnAddBInfo2 ) ";
                strSQL += "SELECT fstrClass, '" + nFileType.Text + "', fstrTaxProgram, " + nTaxYear.Text + ", fintJobidDev, fintJobIdProd, ";
                strSQL += "fstrSQL, fstrBatchSource, fstrBatchPrefix, fstrBatchSuffix, fstrBatchType, fstrAccountType, fdtmFilingPeriod, ";
                strSQL += "fdtmDueDate, fstrDocType, fintDocVer, fstrPrimType, fstrSecType, fbln2Db, fblnImport, fblnExtract, fblnActive, ";
                strSQL += "fblnPtdAddition, fintCompDev, fintCompPrd, fblnAddBInfo2 FROM rfrTaxPgm WHERE fstrFileType = '" + oFileType.Text + "';";
                gc.DoExecute(strSQL);

                // Add rfrAddDoc Records
                strSQL = "INSERT INTO rfrAddDoc ( fstrFileType, fstrDocName, fstrValue, flngFunction, fblnActive, fblnPtdAddition ) ";
                strSQL += "SELECT '" + nFileType.Text + "', fstrDocName, fstrValue, flngFunction, fblnActive, fblnPtdAddition ";
                strSQL += "FROM rfrAddDoc WHERE fstrFileType = '" + oFileType.Text + "';";
                gc.DoExecute(strSQL);

                // e.CommandArgument = idReturnHeaders
                // there's probably an easier way to do this, but this is all I can think of right now
                statement = "INSERT INTO rfrReturnHeaders ( fstrFileType, fstrTaxProgram, flngTaxYear ) ";
                statement += "SELECT  '" + nFileType.Text + "', fstrTaxProgram, " + nTaxYear.Text + " FROM rfrReturnHeaders WHERE idReturnHeaders = " + from_idReturnheaders;
                gc.DoExecute(statement);
                // get the new return headers ID
                new_idReturnheaders = gc.DoScalar("SELECT SCOPE_IDENTITY();").ToString();

                // now loop over the control headers IDs with this return header ID
                statement = "SELECT idControlHeaders FROM rfrControlHeaders WHERE flngReturnHeadersIDFK = " + from_idReturnheaders;
                gc.DoSelect(statement);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    // here we get each of the old ControlHeaders IDs
                    // reinsert them, and get their new ID
                    foreach (DataRow row in dt.Rows)
                    {
                        statement = "INSERT INTO rfrControlHeaders ( fstrFileType, fstrTaxProgram, flngTaxYear, fstrTaxForm, fstrBlockTitle, flngBlock, ";
                        statement += "fstrTable, flngClipTop, flngClipRight, flngClipBottom, flngClipLeft, fstrTemplateImage, fintZoomPerc, fstrFormType, flngRepeatOffset, ";
                        statement += "flngHeaderStart, flngReturnHeadersIDFK, fstrImgSrc, flngSize, fstrBatchId, flngSequence, fstrKeepDec, flngRepTopBot, fstrAcctType, ";
                        statement += "flngRepeat2Offset, flngRepeat3Offset, flngRepeat4Offset, flngRepeat5Offset, flngRepeat6Offset, flngRepeat7Offset, ";
                        statement += "fstrTemplate2Image, fstrTemplate3Image, fstrTemplate4Image, fstrTemplate5Image, fstrTemplate6Image, fstrTemplate7Image, fblnLand ) ";
                        statement += "SELECT '" + nFileType.Text + "', fstrTaxProgram, " + nTaxYear.Text + ", fstrTaxForm, '";
                        statement += nTaxYear.Text + "' + SubString(fstrBlockTitle,5,len(fstrBlockTitle)), flngBlock, fstrTable, flngClipTop, flngClipRight, flngClipBottom, ";
                        statement += "flngClipLeft, fstrTemplateImage, fintZoomPerc, fstrFormType, flngRepeatOffset, flngHeaderStart, ";
                        statement += new_idReturnheaders + ", fstrImgSrc, flngSize, fstrBatchId, flngSequence, fstrKeepDec, flngRepTopBot, fstrAcctType, ";
                        statement += "flngRepeat2Offset, flngRepeat3Offset, flngRepeat4Offset, flngRepeat5Offset, flngRepeat6Offset, flngRepeat7Offset, ";
                        statement += "fstrTemplate2Image, fstrTemplate3Image, fstrTemplate4Image, fstrTemplate5Image, fstrTemplate6Image, fstrTemplate7Image, fblnLand ";
                        statement += " FROM rfrControlHeaders WHERE idControlHeaders = " + row["idControlHeaders"].ToString() + ";";
                        gc.DoExecute(statement);
                        new_idControlHeaders = gc.DoScalar("SELECT SCOPE_IDENTITY();").ToString();

                        // now reinsert the actual controls with this new control header ID
                        statement = "INSERT INTO rfrControls ( fstrFileType, fstrDocName, fstrInputID, fstrTaxProgram, flngTaxYear, fstrTaxForm, flngOrder, ";
                        statement += "fstrTable, fstrColumn, flngDispLength, flngMaxLength, fblnHidden, fblnRequired, flngVBVarType, flngBlock, fblnVertSkip, ";
                        statement += "fstrLabel, fblnActive, flngCtrlMove, flngImgMoveX, flngImgMoveY, flngMarkerMoveX, flngMarkerMoveY, fstrNextCtrl, ";
                        statement += "flngFormatIDFK, fstrTranslate, flngControlHeadersIDFK, fblnPtdAddition, ";
                        statement += "flngCtrl2Move, flngCtrl3Move, flngCtrl4Move, flngCtrl5Move, flngCtrl6Move, flngCtrl7Move, ";
                        statement += "flngImg2MoveX, flngImg3MoveX, flngImg4MoveX, flngImg5MoveX, flngImg6MoveX, flngImg7MoveX, ";
                        statement += "flngImg2MoveY, flngImg3MoveY, flngImg4MoveY, flngImg5MoveY, flngImg6MoveY, flngImg7MoveY, ";
                        statement += "flngMarker2MoveX, flngMarker3MoveX, flngMarker4MoveX, flngMarker5MoveX, flngMarker6MoveX, flngMarker7MoveX, ";
                        statement += "flngMarker2MoveY, flngMarker3MoveY, flngMarker4MoveY, flngMarker5MoveY, flngMarker6MoveY, flngMarker7MoveY ";
                        statement += ") ";
                        statement += "SELECT '" + nFileType.Text + "', fstrDocName, fstrInputID, fstrTaxProgram, " + nTaxYear.Text + ", fstrTaxForm, flngOrder, ";
                        statement += "fstrTable, fstrColumn, flngDispLength, flngMaxLength, fblnHidden, fblnRequired, flngVBVarType, flngBlock, fblnVertSkip, ";
                        statement += "fstrLabel, fblnActive, flngCtrlMove, flngImgMoveX, flngImgMoveY, flngMarkerMoveX, flngMarkerMoveY, fstrNextCtrl, ";
                        statement += "flngFormatIDFK, fstrTranslate, " + new_idControlHeaders + ", fblnPtdAddition, ";
                        statement += "flngCtrl2Move, flngCtrl3Move, flngCtrl4Move, flngCtrl5Move, flngCtrl6Move, flngCtrl7Move, ";
                        statement += "flngImg2MoveX, flngImg3MoveX, flngImg4MoveX, flngImg5MoveX, flngImg6MoveX, flngImg7MoveX, ";
                        statement += "flngImg2MoveY, flngImg3MoveY, flngImg4MoveY, flngImg5MoveY, flngImg6MoveY, flngImg7MoveY, ";
                        statement += "flngMarker2MoveX, flngMarker3MoveX, flngMarker4MoveX, flngMarker5MoveX, flngMarker6MoveX, flngMarker7MoveX, ";
                        statement += "flngMarker2MoveY, flngMarker3MoveY, flngMarker4MoveY, flngMarker5MoveY, flngMarker6MoveY, flngMarker7MoveY ";
                        statement += "FROM rfrControls WHERE flngControlHeadersIDFK = " + row["idControlHeaders"].ToString() + ";";
                        gc.DoExecute(statement);
                    }
                }
                // Update Table tblAutoJavaComplete - the Equations
                statement = "INSERT INTO tblAutoJavaComplete ( flngControlOutIDFK, flngControl1IDFK, flngControl2IDFK, fdecConstant, ";
                statement += "flngJavaFuncIDFK, flngOrder, fblnOnBlur, flngName1IDFK, flngName2IDFK, fstrFuncName, fstrFileType, ";
                statement += "fstrTaxForm, flngCtlBlock, flngOutOrder, flngC1Order, flngC2Order, flngN1Order, flngN2Order, flngReturnHeadersIDFK ) ";
                statement += "SELECT flngControlOutIDFK, flngControl1IDFK, flngControl2IDFK, fdecConstant, ";
                statement += "flngJavaFuncIDFK, flngOrder, fblnOnBlur, flngName1IDFK, flngName2IDFK, fstrFuncName, '" + nFileType.Text + "', ";
                statement += "fstrTaxForm, flngCtlBlock, flngOutOrder, flngC1Order, flngC2Order, flngN1Order, flngN2Order, " + new_idReturnheaders + " ";
                statement += "FROM tblAutoJavaComplete WHERE flngReturnHeadersIDFK = " + from_idReturnheaders + " ;";
                gc.DoExecute(statement);
                statement = "UPDATE dbo.tblAutoJavaComplete ";
                statement += "SET dbo.tblAutoJavaComplete.flngControlOutIDFK = rc.IDrfrControls, ";
                statement += "    dbo.tblAutoJavaComplete.flngControlHeadersIDFK = rc.flngControlHeadersIDFK ";
                statement += "FROM tblAutoJavaComplete tj inner join rfrControls rc on ";
                statement += "(tj.fstrFileType = rc.fstrFileType ";
                statement += "and tj.fstrTaxForm = rc.fstrTaxForm ";
                statement += "and tj.flngCtlBlock = rc.flngBlock ";
                statement += "and tj.flngOutOrder = rc.flngOrder ";
                statement += "and tj.flngOutOrder > 0)";
                statement += "where tj.flngReturnHeadersIDFK = " + new_idReturnheaders + " ;";
                gc.DoExecute(statement);
                statement = "UPDATE dbo.tblAutoJavaComplete ";
                statement += "SET dbo.tblAutoJavaComplete.flngControl1IDFK = rc.IDrfrControls ";
                statement += "FROM tblAutoJavaComplete tj inner join rfrControls rc on ";
                statement += "(tj.fstrFileType = rc.fstrFileType ";
                statement += "and tj.fstrTaxForm = rc.fstrTaxForm ";
                statement += "and tj.flngCtlBlock = rc.flngBlock ";
                statement += "and tj.flngC1Order = rc.flngOrder ";
                statement += "and tj.flngC1Order > 0)";
                statement += "where tj.flngReturnHeadersIDFK = " + new_idReturnheaders + " ;";
                gc.DoExecute(statement);
                statement = "UPDATE dbo.tblAutoJavaComplete ";
                statement += "SET dbo.tblAutoJavaComplete.flngControl2IDFK = rc.IDrfrControls ";
                statement += "FROM tblAutoJavaComplete tj inner join rfrControls rc on ";
                statement += "(tj.fstrFileType = rc.fstrFileType ";
                statement += "and tj.fstrTaxForm = rc.fstrTaxForm ";
                statement += "and tj.flngCtlBlock = rc.flngBlock ";
                statement += "and tj.flngC2Order = rc.flngOrder ";
                statement += "and tj.flngC2Order > 0)";
                statement += "where tj.flngReturnHeadersIDFK = " + new_idReturnheaders + " ;";
                gc.DoExecute(statement);
                statement = "UPDATE dbo.tblAutoJavaComplete ";
                statement += "SET dbo.tblAutoJavaComplete.flngName1IDFK = rc.IDrfrControls ";
                statement += "FROM tblAutoJavaComplete tj inner join rfrControls rc on ";
                statement += "(tj.fstrFileType = rc.fstrFileType ";
                statement += "and tj.fstrTaxForm = rc.fstrTaxForm ";
                statement += "and tj.flngCtlBlock = rc.flngBlock ";
                statement += "and tj.flngN1Order = rc.flngOrder ";
                statement += "and tj.flngN1Order > 0)";
                statement += "where tj.flngReturnHeadersIDFK = " + new_idReturnheaders + " ;";
                gc.DoExecute(statement);
                statement = "UPDATE dbo.tblAutoJavaComplete ";
                statement += "SET dbo.tblAutoJavaComplete.flngName2IDFK = rc.IDrfrControls ";
                statement += "FROM tblAutoJavaComplete tj inner join rfrControls rc on ";
                statement += "(tj.fstrFileType = rc.fstrFileType ";
                statement += "and tj.fstrTaxForm = rc.fstrTaxForm ";
                statement += "and tj.flngCtlBlock = rc.flngBlock ";
                statement += "and tj.flngN2Order = rc.flngOrder ";
                statement += "and tj.flngN2Order > 0)";
                statement += "where tj.flngReturnHeadersIDFK = " + new_idReturnheaders + " ;";
                gc.DoExecute(statement);

                tptxtFileType.Text = nFileType.Text;
                adtxtFileType.Text = nFileType.Text;
                chtxtFileType.Text = nFileType.Text;

                gc.Disconnect();

                // and then send them to the new forms blockBatch page to make their changes
                // this stays the same, each block will have it's ID on the next page
            //    string xferURL = "blockBatch.aspx?rhID=" + new_idReturnheaders;
            //    Response.Redirect(xferURL, true);
            }
         //   catch (ThreadAbortException tex)
         //   {
                // this happens when we do a Response.Redirect
                // already disconnected gc, so do nothing
         //   }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnRowDataBound_TaxPgm(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ((TextBox)e.Row.FindControl("tpFileTypeTXT")).Text = ((DataTable)TaxPgmGDV.DataSource).Rows[e.Row.RowIndex][0].ToString();
                ((TextBox)e.Row.FindControl("tpBatchTypeTXT")).Text = ((DataTable)TaxPgmGDV.DataSource).Rows[e.Row.RowIndex][1].ToString();
                ((TextBox)e.Row.FindControl("tpJobIdDevTXT")).Text = ((DataTable)TaxPgmGDV.DataSource).Rows[e.Row.RowIndex][2].ToString();
                ((TextBox)e.Row.FindControl("tpJobIdProdTXT")).Text = ((DataTable)TaxPgmGDV.DataSource).Rows[e.Row.RowIndex][3].ToString();
                ((TextBox)e.Row.FindControl("tpFilingPeriodTXT")).Text = ((DataTable)TaxPgmGDV.DataSource).Rows[e.Row.RowIndex][4].ToString();
                ((TextBox)e.Row.FindControl("tpDueDateTXT")).Text = ((DataTable)TaxPgmGDV.DataSource).Rows[e.Row.RowIndex][5].ToString();
                ((TextBox)e.Row.FindControl("tpDocVerTXT")).Text = ((DataTable)TaxPgmGDV.DataSource).Rows[e.Row.RowIndex][6].ToString();
            }
        }
        protected void OnCommand_getTaxPgm(object sender, CommandEventArgs e)
        {
            if (tptxtFileType.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "tpFileType", "alert('Tax Pgm FileType Needed.');", true);
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

                string strSQL = "";
                strSQL = "SELECT fstrFileType, fstrBatchType, ";
                strSQL += "fintJobIdDev, fintJobIdProd, fdtmFilingPeriod, fdtmDueDate, fintDocVer ";
                strSQL += "FROM rfrTaxPgm WHERE fstrFileType = '" + tptxtFileType.Text + "' ";
                strSQL += "ORDER BY fstrBatchType ;";
                gc.DoSelect(strSQL);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                TaxPgmGDV.DataSource = null;
                TaxPgmGDV.DataBind();
                if (numRows > 0)
                {
                    TaxPgmGDV.DataSource = dt;
                    TaxPgmGDV.DataBind();
                }

                adtxtFileType.Text = tptxtFileType.Text;
                chtxtFileType.Text = tptxtFileType.Text;

                gc.Disconnect();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnCommand_saveTaxPgm(object sender, CommandEventArgs e)
        {
            // if nothing in the GDV, leave
            if (e.CommandArgument.ToString() == "taxpgm" && TaxPgmGDV.Rows.Count == 0 )
            {
                return;
            }

            // everything in the GDV is already in the DB, so just loop an UPDATE

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string strSQL = "";
                int loopEnd = TaxPgmGDV.Rows.Count;
                for (int i = 0; i < loopEnd; i++)
                {
                    // build the UPDATE based on the DDL selected value
                    TextBox strFileType = (TextBox)TaxPgmGDV.Rows[i].FindControl("tpFileTypeTXT");
                    TextBox strBatchType = (TextBox)TaxPgmGDV.Rows[i].FindControl("tpBatchTypeTXT");
                    TextBox strJobIdDev = (TextBox)TaxPgmGDV.Rows[i].FindControl("tpJobIdDevTXT");
                    TextBox strJobIdProd = (TextBox)TaxPgmGDV.Rows[i].FindControl("tpJobIdProdTXT");
                    TextBox strFilingPeriod = (TextBox)TaxPgmGDV.Rows[i].FindControl("tpFilingPeriodTXT");
                    TextBox strDueDate = (TextBox)TaxPgmGDV.Rows[i].FindControl("tpDueDateTXT");
                    TextBox strDocVer = (TextBox)TaxPgmGDV.Rows[i].FindControl("tpDocVerTXT");

                    strSQL += "UPDATE rfrTaxPgm SET ";
                    strSQL += "fintJobIdDev  = '" + strJobIdDev.Text + "', ";
                    strSQL += "fintJobIdProd = '" + strJobIdProd.Text + "', ";
                    strSQL += "fdtmFilingPeriod = '" + strFilingPeriod.Text + "', ";
                    strSQL += "fdtmDueDate = '" + strDueDate.Text + "', ";
                    strSQL += "fintDocVer = '" + strDocVer.Text + "' ";
                    strSQL += "WHERE fstrFileType = '" + strFileType.Text + "' ";
                    strSQL += "AND fstrBatchType = '" + strBatchType.Text + "'; ";

                }
                // the loop strung all the UPDATEs together, execute them all
                gc.DoExecute(strSQL);
                // rebind the GDV
                strSQL = "SELECT fstrFileType, fstrBatchType, ";
                strSQL += "fintJobIdDev, fintJobIdProd, fdtmFilingPeriod, fdtmDueDate, fintDocVer ";
                strSQL += "FROM rfrTaxPgm WHERE fstrFileType = '" + tptxtFileType.Text + "' ";
                strSQL += "ORDER BY fstrBatchType ;";
                gc.DoSelect(strSQL);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                TaxPgmGDV.DataSource = null;
                TaxPgmGDV.DataBind();
                if (numRows > 0)
                {
                    TaxPgmGDV.DataSource = dt;
                    TaxPgmGDV.DataBind();
                }
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnRowDataBound_AddDoc(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                ((TextBox)e.Row.FindControl("adFileTypeTXT")).Text = ((DataTable)AddDocGDV.DataSource).Rows[e.Row.RowIndex][0].ToString();
                ((TextBox)e.Row.FindControl("adDocNameTXT")).Text = ((DataTable)AddDocGDV.DataSource).Rows[e.Row.RowIndex][1].ToString();
                ((TextBox)e.Row.FindControl("adValueTXT")).Text = ((DataTable)AddDocGDV.DataSource).Rows[e.Row.RowIndex][2].ToString();
                ((TextBox)e.Row.FindControl("adFunctionTXT")).Text = ((DataTable)AddDocGDV.DataSource).Rows[e.Row.RowIndex][3].ToString();
                ((TextBox)e.Row.FindControl("adActiveTXT")).Text = ((DataTable)AddDocGDV.DataSource).Rows[e.Row.RowIndex][4].ToString();
            }
        }
        protected void OnCommand_getAddDoc(object sender, CommandEventArgs e)
        {
            if (adtxtFileType.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "adFileType", "alert('Add Doc FileType Needed.');", true);
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

                string strSQL = "";
                strSQL = "SELECT fstrFileType, fstrDocName, fstrValue, flngFunction, ";
                strSQL += "fblnActive ";
                strSQL += "FROM rfrAddDoc WHERE fstrFileType = '" + adtxtFileType.Text + "' ";
                strSQL += "ORDER BY flngFunction ;";
                gc.DoSelect(strSQL);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                AddDocGDV.DataSource = null;
                AddDocGDV.DataBind();
                if (numRows > 0)
                {
                    AddDocGDV.DataSource = dt;
                    AddDocGDV.DataBind();
                }

                chtxtFileType.Text = adtxtFileType.Text;

                gc.Disconnect();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnCommand_saveAddDoc(object sender, CommandEventArgs e)
        {
            // if nothing in the GDV, leave
            if (e.CommandArgument.ToString() == "adddoc" && AddDocGDV.Rows.Count == 0)
            {
                return;
            }

            // everything in the GDV is already in the DB, so just loop an UPDATE

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string strSQL = "";
                int loopEnd = AddDocGDV.Rows.Count;
                for (int i = 0; i < loopEnd; i++)
                {
                    // build the UPDATE based on the DDL selected value
                    TextBox strFileType = (TextBox)AddDocGDV.Rows[i].FindControl("adFileTypeTXT");
                    TextBox strDocName = (TextBox)AddDocGDV.Rows[i].FindControl("adDocNameTXT");
                    TextBox strValue = (TextBox)AddDocGDV.Rows[i].FindControl("adValueTXT");
                    TextBox strFunction = (TextBox)AddDocGDV.Rows[i].FindControl("adFunctionTXT");
                    TextBox strActive = (TextBox)AddDocGDV.Rows[i].FindControl("adActiveTXT");

                    strSQL += "UPDATE rfrAddDoc SET ";
                    strSQL += "fstrDocName  = '" + strDocName.Text + "', ";
                    strSQL += "fstrValue = '" + strValue.Text + "', ";
                    strSQL += "fblnActive = '" + strActive.Text + "' ";
                    strSQL += "WHERE fstrFileType = '" + strFileType.Text + "' ";
                    strSQL += "AND flngFunction = '" + strFunction.Text + "'; ";

                }
                // the loop strung all the UPDATEs together, execute them all
                gc.DoExecute(strSQL);
                // rebind the GDV
                strSQL = "SELECT fstrFileType, fstrDocName, fstrValue, flngFunction, ";
                strSQL += "fblnActive ";
                strSQL += "FROM rfrAddDoc WHERE fstrFileType = '" + adtxtFileType.Text + "' ";
                strSQL += "ORDER BY flngFunction ;";
                gc.DoSelect(strSQL);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                AddDocGDV.DataSource = null;
                AddDocGDV.DataBind();
                if (numRows > 0)
                {
                    AddDocGDV.DataSource = dt;
                    AddDocGDV.DataBind();
                }
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnCommand_loadTemplate(object sender, CommandEventArgs e)
        {
            if (chtxtFileType.Text.Length == 0)
            {
                ScriptManager.RegisterClientScriptBlock(Page, Page.GetType(), "chFileType", "alert('Template FileType Needed.');", true);
                return;
            }
            string strTaxForm = "";
            string strImagePath = "";

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                string strSQL = "";
                strSQL = "SELECT fstrFormName, fstrImagePath ";
                strSQL += "FROM tblNM_BatchImage WHERE fstrBatchId = '" + chtxtBatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + chtxtSequence.Text + "' ";
                strSQL += "AND fstrFormName > ' ';";
                gc.DoSelect(strSQL);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    foreach(DataRow row in dt.Rows)
                    {
                        strTaxForm = row["fstrFormName"].ToString();
                        strImagePath = row["fstrImagePath"].ToString();
                        strSQL = "UPDATE rfrControlHeaders ";
                        strSQL += "SET fstrTemplateImage = '" + strImagePath + "' ";
                        strSQL += "WHERE fstrFileType = '" + chtxtFileType.Text + "' ";
                        strSQL += "AND flngBlock = 0 ";
                        strSQL += "AND fstrTaxForm = '" + strTaxForm + "' ;";
                        gc.DoExecute(strSQL);
                    }
                }

                gc.Disconnect();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }


        }
    }
}