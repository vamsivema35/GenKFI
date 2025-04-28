using GenKFI.Properties;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Reflection.Emit;
using System.Text;
using System.Threading;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace GenKFI.utils.entry
{
    public partial class KeyEntry : System.Web.UI.Page
    {

        string strCurrPage;

        protected void Page_Load(object sender, EventArgs e)
        {
            /*
             * left the movement buttons as they were, linked to javascript functions, since all they do 
             * is move stuff around, there is no need for a PostBack there
             */

            #region common load code

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            //@#@# common code on all pages
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            // this is the only thing that changes across pages
            strCurrPage = "Key Entry";
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

            // since we can't link our event to a control on the master page, make our own button here,
            // then just show it or hide it as needed

            Button repeaterBTN = new Button
            {
                ID = "repeaterBTN",
                Text = "More?",
                Visible = true
            };
            repeaterBTN.Click += new EventHandler(OnClick_repeaterBTN);
            ((Panel)Master.FindControl("repeaterPNL")).Controls.Add(repeaterBTN);
            // RPD requested another submit button at the bottom of repeater forms, so here it is
            Button submit2BTN = new Button
            {
                ID = "submit2BTN",
                Text = "Submit",
                Visible = true
            };
            submit2BTN.Click += new EventHandler(OnClick_btnSub);
            ((Panel)Master.FindControl("repeaterPNL")).Controls.Add(submit2BTN);


            if (Session["keyMode"] != null && (bool)Session["keyMode"] == true)
                adminKeyModeLBL.Visible = true;
            else
                adminKeyModeLBL.Visible = false;

            // for some JS on the master, set the type
            if (ViewState["fstrBatchStatus"] != null && (string)ViewState["fstrBatchStatus"] != "O")
                ((HiddenField)Master.FindControl("typeHID")).Value = "view";
            else
                ((HiddenField)Master.FindControl("typeHID")).Value = "key";

            // save the tax program for later, just in case
            taxProgHID.Value = Request.QueryString["TP"].ToString();

            // catch the forced post here, if caused by the formPick
            // update what we have, and select the new one
            if (formPickClick.Value == "Y")
            {
                DoUpdate(true);

                // whether there was a submission, or we are saving the values before the form pick change
                // we need to turn that flag off
                formPickClick.Value = "N";
            }

            if (!IsPostBack)
            {
                ((HiddenField)Master.FindControl("hidCCode")).Value = null;

                if (taxProgHID.Value == "OGD")
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
                LoadData(true);
            }

        }

        protected void OnClick_OgdBtn(object sender, EventArgs e)
        {
            OgdBtn.BackColor = System.Drawing.Color.LightCyan;
            O85Btn.BackColor = System.Drawing.Color.Empty;
            O99Btn.BackColor = System.Drawing.Color.Empty;
            OirBtn.BackColor = System.Drawing.Color.Empty;
            OsfBtn.BackColor = System.Drawing.Color.Empty;
            OsrBtn.BackColor = System.Drawing.Color.Empty;
            OasBtn.BackColor = System.Drawing.Color.Empty;
            ((HiddenField)Master.FindControl("hidOgdForm")).Value = "0";
            LoadData(false);
        }
        protected void OnClick_O85Btn(object sender, EventArgs e)
        {
            OgdBtn.BackColor = System.Drawing.Color.Empty;
            O85Btn.BackColor = System.Drawing.Color.LightCyan;
            O99Btn.BackColor = System.Drawing.Color.Empty;
            OirBtn.BackColor = System.Drawing.Color.Empty;
            OsfBtn.BackColor = System.Drawing.Color.Empty;
            OsrBtn.BackColor = System.Drawing.Color.Empty;
            OasBtn.BackColor = System.Drawing.Color.Empty;
            ((HiddenField)Master.FindControl("hidOgdForm")).Value = "2";
            LoadData(false);
        }
        protected void OnClick_O99Btn(object sender, EventArgs e)
        {
            OgdBtn.BackColor = System.Drawing.Color.Empty;
            O85Btn.BackColor = System.Drawing.Color.Empty;
            O99Btn.BackColor = System.Drawing.Color.LightCyan;
            OirBtn.BackColor = System.Drawing.Color.Empty;
            OsfBtn.BackColor = System.Drawing.Color.Empty;
            OsrBtn.BackColor = System.Drawing.Color.Empty;
            OasBtn.BackColor = System.Drawing.Color.Empty;
            ((HiddenField)Master.FindControl("hidOgdForm")).Value = "3";
            LoadData(false);
        }
        protected void OnClick_OirBtn(object sender, EventArgs e)
        {
            OgdBtn.BackColor = System.Drawing.Color.Empty;
            O85Btn.BackColor = System.Drawing.Color.Empty;
            O99Btn.BackColor = System.Drawing.Color.Empty;
            OirBtn.BackColor = System.Drawing.Color.LightCyan;
            OsfBtn.BackColor = System.Drawing.Color.Empty;
            OsrBtn.BackColor = System.Drawing.Color.Empty;
            OasBtn.BackColor = System.Drawing.Color.Empty;
            ((HiddenField)Master.FindControl("hidOgdForm")).Value = "4";
            LoadData(false);
        }
        protected void OnClick_OsfBtn(object sender, EventArgs e)
        {
            OgdBtn.BackColor = System.Drawing.Color.Empty;
            O85Btn.BackColor = System.Drawing.Color.Empty;
            O99Btn.BackColor = System.Drawing.Color.Empty;
            OirBtn.BackColor = System.Drawing.Color.Empty;
            OsfBtn.BackColor = System.Drawing.Color.LightCyan;
            OsrBtn.BackColor = System.Drawing.Color.Empty;
            OasBtn.BackColor = System.Drawing.Color.Empty;
            ((HiddenField)Master.FindControl("hidOgdForm")).Value = "5";
            LoadData(false);
        }
        protected void OnClick_OsrBtn(object sender, EventArgs e)
        {
            OgdBtn.BackColor = System.Drawing.Color.Empty;
            O85Btn.BackColor = System.Drawing.Color.Empty;
            O99Btn.BackColor = System.Drawing.Color.Empty;
            OirBtn.BackColor = System.Drawing.Color.Empty;
            OsfBtn.BackColor = System.Drawing.Color.Empty;
            OsrBtn.BackColor = System.Drawing.Color.LightCyan;
            OasBtn.BackColor = System.Drawing.Color.Empty;
            ((HiddenField)Master.FindControl("hidOgdForm")).Value = "6";
            LoadData(false);
        }
        protected void OnClick_OasBtn(object sender, EventArgs e)
        {
            OgdBtn.BackColor = System.Drawing.Color.Empty;
            O85Btn.BackColor = System.Drawing.Color.Empty;
            O99Btn.BackColor = System.Drawing.Color.Empty;
            OirBtn.BackColor = System.Drawing.Color.Empty;
            OsfBtn.BackColor = System.Drawing.Color.Empty;
            OsrBtn.BackColor = System.Drawing.Color.Empty;
            OasBtn.BackColor = System.Drawing.Color.LightCyan;
            ((HiddenField)Master.FindControl("hidOgdForm")).Value = "7";
            LoadData(false);
        }

        protected void OnClick_MavImgMove(object sender, EventArgs e)
        {
            //          Move Mavro Image

            DoUpdate(false);

            int numRows = 0;
            GoodConn MavroGC = new GoodConn();

            string MavKey = ((HiddenField)Master.FindControl("hidMavKey")).Value;
            string strTaxProgram = taxProgHID.Value;
            string strBatchId = (string)ViewState["Batch"] ?? "";
            string strSequence = (string)ViewState["Sequence"] ?? "";
            string strDocNbr = ((HiddenField)Master.FindControl("hidmvDocNbr")).Value;


            string statement = "Select ";
            statement += "flngFrontOffset, ";
            statement += "flngFrontSize, ";
            statement += "flngRearOffset, ";
            statement += "flngRearSize, ";
            statement += "flngDocNumber ";
            statement += "From tblNM_MavroOffset ";
            statement += "Where ";
            statement += "fstrTaxProgram = '" + strTaxProgram + "' ";
            statement += "And fstrBatchId = '" + strBatchId + "' ";
            statement += "And flngSequence = '" + strSequence + "' ";


#if DEBUG
            MavroGC.Connect(Resources.connString);
#else
			MavroGC.Connect( Resources.prodConnString );
#endif

            try
            {

                MavroGC.DoSelect(statement);
                DataTable dt = new DataTable();
                numRows = MavroGC.ReadSelect(out dt);
                int i = 0;
                if (numRows > 0)
                {
                    
                    if (MavKey == "Home")
                    {

                        ((HiddenField)Master.FindControl("hidmvOffset")).Value = dt.Rows[i]["flngFrontOffset"].ToString();
                        ((HiddenField)Master.FindControl("hidmvSize")).Value = dt.Rows[i]["flngFrontSize"].ToString();
                        ((HiddenField)Master.FindControl("hidmvDocNbr")).Value = dt.Rows[i]["flngDocNumber"].ToString();
                        Session["mvOffset"] = dt.Rows[i]["flngFrontOffset"].ToString();
                        Session["mvSize"] = dt.Rows[i]["flngFrontSize"].ToString();
                        Session["mvDocNbr"] = dt.Rows[i]["flngDocNumber"].ToString();
                    }
                    else
                    {
                        do
                        {
                            if ((i + 1).ToString() == strDocNbr) break;
                            i += 1;
                        } while (i < numRows - 1);
                        if (MavKey == "End")
                        {
                            ((HiddenField)Master.FindControl("hidmvOffset")).Value = dt.Rows[i]["flngRearOffset"].ToString();
                            ((HiddenField)Master.FindControl("hidmvSize")).Value = dt.Rows[i]["flngRearSize"].ToString();
                            ((HiddenField)Master.FindControl("hidmvDocNbr")).Value = dt.Rows[i]["flngDocNumber"].ToString();
                            Session["mvOffset"] = dt.Rows[i]["flngRearOffset"].ToString();
                            Session["mvSize"] = dt.Rows[i]["flngRearSize"].ToString();
                            Session["mvDocNbr"] = dt.Rows[i]["flngDocNumber"].ToString();
                        }
                        if (MavKey == "Up")
                        {
                            i--;
                            if (i < 0) i = 0;
                            ((HiddenField)Master.FindControl("hidmvOffset")).Value = dt.Rows[i]["flngFrontOffset"].ToString();
                            ((HiddenField)Master.FindControl("hidmvSize")).Value = dt.Rows[i]["flngFrontSize"].ToString();
                            ((HiddenField)Master.FindControl("hidmvDocNbr")).Value = dt.Rows[i]["flngDocNumber"].ToString();
                            Session["mvOffset"] = dt.Rows[i]["flngFrontOffset"].ToString();
                            Session["mvSize"] = dt.Rows[i]["flngFrontSize"].ToString();
                            Session["mvDocNbr"] = dt.Rows[i]["flngDocNumber"].ToString();
                        }
                        if (MavKey == "Down")
                        {
                            i++;
                            if (i + 1 > numRows) i = numRows - 1;
                            ((HiddenField)Master.FindControl("hidmvOffset")).Value = dt.Rows[i]["flngFrontOffset"].ToString();
                            ((HiddenField)Master.FindControl("hidmvSize")).Value = dt.Rows[i]["flngFrontSize"].ToString();
                            ((HiddenField)Master.FindControl("hidmvDocNbr")).Value = dt.Rows[i]["flngDocNumber"].ToString();
                            Session["mvOffset"] = dt.Rows[i]["flngFrontOffset"].ToString();
                            Session["mvSize"] = dt.Rows[i]["flngFrontSize"].ToString();
                            Session["mvDocNbr"] = dt.Rows[i]["flngDocNumber"].ToString();
                        }
                    }
                }

                MavroGC.Disconnect();

                ((HiddenField)Master.FindControl("keFocusHID")).Value = ((HiddenField)Master.FindControl("hidSaveFocus")).Value;

                ImgSrctxt.Text = ((HiddenField)Master.FindControl("hidmvImgSrc")).Value;
                DocNbrtxt.Text = ((HiddenField)Master.FindControl("hidmvDocNbr")).Value;
                Offsettxt.Text = ((HiddenField)Master.FindControl("hidmvOffset")).Value;
                Sizetxt.Text = ((HiddenField)Master.FindControl("hidmvSize")).Value;

                ((Image)Master.FindControl("imgImage")).ImageUrl = "noFront/imageLoad.aspx";
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(MavroGC, ex);
                MavroGC.Disconnect();
            }

        }
        // Country Button
        protected void CallLoadCountryName(object sender, EventArgs e)
        {
            ((HiddenField)Master.FindControl("hidSavFoc")).Value = ((HiddenField)Master.FindControl("keFocusHID")).Value;
            DoUpdate(false);
            ((Forms)Master).LoadCountryName();
            return;

        }
        /*
        old page went here via a 'form' tag with a query string
        we need to handle getting these values via the Session
        will also have to put the needed values in the Session from the 
        previous pages, since some are already init'ed there before coming here
        @#@ search for all links and redirects to this page
		
        Batch = kestrBatchId
        BatchDate = kedtmBatchDate
        ImageSource = kestrSource
        Sequence = kelngSequence
        DLN = kestrDLN
        Title = kestrTitle
        Block = kelngBlock
        TaxProgram = kestrTaxProgram
        FormName = kestrFormName
        FileType = kestrFileType
        */
        protected void OnClick_TimelyBTN(object sender, EventArgs e)
        {
            //Change Timely Flag
            string strSQL;
            string Timely = Timelytxt.Text.ToUpper();
            if (Timely == "Y")
                Timely = "N";
            else
                Timely = "Y";

            
                GoodConn gc = new GoodConn();
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                    strSQL = "UPDATE tblNM_BatchInfo ";
                    strSQL += "SET fstrTimelyBatch = '" + Timely + "' ";
                    strSQL += "WHERE fstrBatchID = '" + batchIDTXT.Text + "' ";
                    strSQL += "AND fstrTaxProgram = '" + TaxPgmtxt.Text + "' ";
                    gc.DoExecute(strSQL);

                    strSQL = "UPDATE tblKeQMast ";
                    strSQL += "SET fstrTimelyBatch = '" + Timely + "' ";
                    strSQL += "WHERE fstrBatchID = '" + batchIDTXT.Text + "' ";
                    strSQL += "AND fstrTaxProgram = '" + TaxPgmtxt.Text + "' ";
                    gc.DoExecute(strSQL);

                    strSQL = "UPDATE tblKeQueue ";
                    strSQL += "SET fstrTimelyBatch = '" + Timely + "' ";
                    strSQL += "WHERE fstrBatchID = '" + batchIDTXT.Text + "' ";
                    strSQL += "AND fstrTaxProgram = '" + TaxPgmtxt.Text + "' ";
                    gc.DoExecute(strSQL);
                
                    gc.Disconnect();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }
                LoadData(false);
        }
        protected void OnClick_homeBTN(object sender, EventArgs e)
        {
            Session["keyMode"] = false;
            // if this batch wasn't open to start, clear tblKeQueue
            // it was only needed to keep track of where we were in the return
            if (ViewState["fstrBatchStatus"] != null && (string)ViewState["fstrBatchStatus"] != "O")
            {
                string kestrBatchId = (string)ViewState["Batch"] ?? "";
                string kedtmBatchDate = (string)ViewState["BatchDate"] ?? "";
                string kelngSequence = (string)ViewState["Sequence"] ?? "";
                GoodConn gc = new GoodConn();
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                    string strSQL = "DELETE tblKeQueue";
                    strSQL += " WHERE fstrBatchId = '" + kestrBatchId + "'";
                    strSQL += " AND fstrTaxProgram = '" + taxProgHID.Value + "'";
                    strSQL += " AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "'";
                    strSQL += " AND flngSequence = '" + kelngSequence + "'";
                    gc.DoExecute(strSQL);

                    gc.Disconnect();
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }
            }
            Response.Redirect(ResolveClientUrl("~/" + Session["homeLink"]), true);
        }

        protected void OnClick_btnSub(object sender, EventArgs e)
        {
            DoUpdate(true);
        }

        // this is very similar to doUpdate
        // insert the data for that row on the repeater table
        protected void OnClick_repeaterBTN(object sender, EventArgs e)
        {
            // really just a pass through to the update and reload
            // queue flag is false to prevent updating the queue and moving to the next form
            DoUpdate(false);
        }

        private void DoUpdate(bool updateQueues)
        {

            string kestrBatchId = (string)ViewState["Batch"] ?? "";
            string kedtmBatchDate = (string)ViewState["BatchDate"] ?? "";
            string kestrSource = (string)ViewState["ImageSource"] ?? "";
            string kelngSequence = (string)ViewState["Sequence"] ?? "";
            string kestrDLN = (string)ViewState["DLN"] ?? "";
            string kestrDocNumber = (string)ViewState["DocNumber"] ?? "";
            string kestrTitle = (string)ViewState["Title"] ?? "";
            string kelngBlock = (string)ViewState["Block"] ?? "";
            string kestrFormName = (string)ViewState["FormName"] ?? "";
            string kestrFileType = (string)ViewState["FileType"] ?? "";
            string mfstrStatus = (string)ViewState["fstrBatchStatus"] ?? "";
            string kestrTaxProgram = Request.QueryString["TP"];

            string strTableName = (string)ViewState["strTableName"] ?? "";

            int repeatOffset = -1;
            if (ViewState["repeatOffset"] != null)
                repeatOffset = int.Parse(ViewState["repeatOffset"].ToString());

            // do the update to the databases here
            string sBuff1 = "";
            string sBuff2 = "";
            string sPayment = "";
            string statement = "";
            string updateStatement = "";
            string oldVals = "";
            string newVals = "";
            string allNewVals = "";
            bool allDone = false;
            GoodConn gc = new GoodConn();
            DataTable dt;
            int numRows;
            Exception hadException = null;
            string brokenControl = "";

            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif


                // old values for comparison
                oldVals = hidRec.Value;

                // Update Routine
                // Get TableName and Columns for Block To Update the Data from Entry
                statement = "SELECT c.fstrInputId, ";
                statement += "ch.fstrTable, ";
                statement += "c.fstrColumn, ";
                statement += "c.fstrLabel, ";
                statement += "c.flngMaxLength, ";
                statement += "ch.fstrKeepDec ";
                statement += "FROM rfrControls c, ";
                statement += "rfrControlHeaders ch, ";
                statement += "rfrReturnHeaders rh ";
                statement += "WHERE c.flngControlHeadersIDFK = ch.idControlHeaders AND ";
                statement += "ch.flngReturnHeadersIDFK = rh.idReturnHeaders AND ";
                statement += "ch.fstrTaxForm = '" + kestrFormName + "' AND ";
                statement += "rh.fstrFileType = '" + kestrFileType + "' AND ";
                statement += "ch.flngBlock = '" + kelngBlock + "' AND ";
                statement += "c.fblnActive = 1 AND ";
                statement += "c.flngOrder > 0 ";
                statement += "ORDER BY flngOrder;";

                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);

                // if this is a repeater form, whether end or not, loop until the values are done
                string repNum = "";
                if (repeatOffset != -1)
                    repNum = "0";

                //@#@# only run if batch is open, don't update any other kind of batch
                while (repNum != "-1" && mfstrStatus == "O")
                {
                    // if the repNum control isn't there, we're done looping
                    // check first non-checkbox
                    int q = 0;
                    while (dt.Rows[q]["fstrColumn"].ToString() == "" && q < numRows)
                        q++;
                    while (dt.Rows[q]["fstrColumn"].ToString().Substring(0, 4) == "fbln" && q < numRows)
                        q++;

                    // if this is a repeater form, but we are done with the repeats, leave
                    // extra checks for checkboxes, if the checkbox is checked, it's name is there and value is 1, if it's not checked, it's not included in Request.Form
                    if (numRows > 0 && dt.Rows[q]["fstrColumn"].ToString() != "" &&
                        Request.Form[dt.Rows[q]["fstrInputId"].ToString() + repNum] == null)
                    {
                        break;
                    }
                    // select the correct oldVals, and reset new vals for new row
                    if (repeatOffset != -1)
                    {
                        // +1 because construction puts an '^' at the beginning, leaving an empty string as first element
                        oldVals = hidRec.Value.Split('^')[int.Parse(repNum) + 1];
                        newVals = "";
                    }

                    updateStatement = "UPDATE " + strTableName + " SET ";
                    // Loop through all fields to build Update Sql
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            // if no column, we don't need that data
                            if (row["fstrColumn"].ToString() == "")
                                continue;

                            // save the control name, so we know what went wrong, if anything
                            brokenControl = row["fstrLabel"].ToString();
                            sBuff1 = row["fstrInputId"].ToString().Trim();		// Get Field Name
                            sBuff1 = Request.Form[sBuff1 + repNum];				// Get Field Value
                            // extra checks for checkboxes, if the checkbox is checked, it's name is there and value is 1, if it's not checked, it's not included in Request.Form
                            if (row["fstrColumn"].ToString().Substring(0, 4) == "fbln")
                            {
                                if (Request.Form[row["fstrInputId"].ToString() + repNum] == null)
                                    sBuff1 = "0";
                                else
                                    // if this is a checkbox, and it exists in the .Form, it's value will be '1'
                                    // if this isn't a checkbox, but it's related to a fbln column, it's value will be '0' or '1'
                                    sBuff1 = Request.Form[row["fstrInputId"].ToString() + repNum];
                            }
                            else
                            {
                                // Remove Single Quotes from all except boolean
                                sBuff1 = sBuff1.Replace("'", "");
                                // Remove Commas from currency
                                if (row["fstrColumn"].ToString().Substring(0, 4) == "fcur")
                                {
                                    sBuff1 = sBuff1.Replace(",", "");
                                    if (sBuff1 == "0" && row["fstrKeepDec"].ToString() == "Y")
                                        sBuff1 = "0.00";
                                }
                                // Remove Commas from integer
                                if (row["fstrColumn"].ToString().Substring(0, 4) == "fint")
                                    sBuff1 = sBuff1.Replace(",", "");
                                // Remove Commas from long
                                if (row["fstrColumn"].ToString().Substring(0, 4) == "flng")
                                    sBuff1 = sBuff1.Replace(",", "");
                                // Remove dashes if string and not a CR form and not fstrAcctType 
                                if (kestrFormName.IndexOf("-CR") < 0) 
                                {
                                    if (row["fstrColumn"].ToString() != "fstrAcctType")
                                    {
                                        if (row["fstrColumn"].ToString().Substring(0, 4) == "fstr")
                                            sBuff1 = sBuff1.Replace("-", "");
                                    }
                                }
                                if (row["fstrColumn"].ToString().Substring(0, 4) == "fdtm")
                                {
                                    // convert to 4 digit date, comes in as MM/DD/YY or MM/YY
                                    // handle blank dates
                                    if (sBuff1 == "")
                                        sBuff1 = "12/31/9999";
                                    else
                                    {
                                        // this will keep old dates old, i.e. 29 won't be 2029, but 1929
                                        CultureInfo ci = new CultureInfo(CultureInfo.CurrentCulture.LCID);
                                        ci.Calendar.TwoDigitYearMax = DateTime.Today.Year + 9;
                                        DateTime dtm = new DateTime();
                                        // try to parse
                                        bool tryDate = DateTime.TryParse(sBuff1, ci, DateTimeStyles.None, out dtm);
                                        // if it didn't work, at least assume they typed in the correct format MMDDYY, and it didn't get formatted right
                                        if (!tryDate)
                                            dtm = DateTime.Parse(sBuff1.Substring(0, 2) + "/" + sBuff1.Substring(2, 2) + "/" + sBuff1.Substring(4, 2), ci);
                                        if (dtm.Year >= 1800)
                                            sBuff1 = dtm.ToString("MM/dd/yyyy");
                                        else
                                            sBuff1 = "12/31/9999";
                                    }
                                }
                            }

                            // now check strings are within set data limits, just truncate, let GenTax deal with it later
                            if (UtilClass.Sanitize(sBuff1).Length > int.Parse(row["flngMaxLength"].ToString()) && row["fstrColumn"].ToString().Substring(0, 4) == "fstr")
                                sBuff1 = sBuff1.Substring(0, int.Parse(row["flngMaxLength"].ToString()));

                            // if the value is blank, and it should be a number (not bool, currency, string, or date), use zero
                            if (UtilClass.Sanitize(sBuff1).Length == 0 &&
                                row["fstrColumn"].ToString().Substring(0, 4) != "fbln" &&
                                row["fstrColumn"].ToString().Substring(0, 4) != "fstr" &&
                                row["fstrColumn"].ToString().Substring(0, 4) != "fdtm")
                            {
                                if (row["fstrKeepDec"].ToString() == "Y" && row["fstrColumn"].ToString().Substring(0, 4) == "fcur")
                                    sBuff1 = "0.00";
                                else
                                    sBuff1 = "0";
                            }
// if keep Decimal then 0.00
                            updateStatement += row["fstrColumn"].ToString() + " = '" + UtilClass.Sanitize(sBuff1) + "', ";
                            newVals += sBuff1;
                            allNewVals += sBuff1;
                        }
                    }
                    // if that all worked, we can clear the brokenControl
                    brokenControl = "";
                    // also include the who and wne of this data
                    updateStatement += "fstrWho = '" + MyUserRole.UserName() + "', ";
                    updateStatement += "fdtmWhen = GETDATE() ";
                    if (strTableName == "tblOgdS")
                    {
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "0")
                        {
                            updateStatement += ", fstrSource = '41374' ";
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "2")
                        {
                            updateStatement += ", fstrSource = '41285' ";
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "3")
                        {
                            updateStatement += ", fstrSource = '1099' ";
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "4")
                        {
                            updateStatement += ", fstrSource = '1099' ";
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "5")
                        {
                            updateStatement += ", fstrSource = '1099' ";
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "6")
                        {
                            updateStatement += ", fstrSource = '1099' ";
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "7")
                        {
                            updateStatement += ", fstrSource = '1099' ";
                        }
                    }
                    // if this is a repeater table, set filled if changed, to allow deletion of template default row later
                    if (repeatOffset != -1 && newVals != oldVals)
                        updateStatement += ", fblnFilled = 1 ";

                    updateStatement += "WHERE fstrBatchID = '" + kestrBatchId + "' ";
                    updateStatement += "AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' ";
                    updateStatement += "AND flngSequence = '" + kelngSequence + "'";
                    // if this is a repeater table, add the sequence number
                    if (repeatOffset != -1)
                    {
                        updateStatement += " AND flngRepNum = " + repNum + "";
                        updateStatement += " AND fstrTaxForm = '" + kestrFormName + "'";
                    }
                    // if this is a multi-page, add the DLN
                    if (ViewState["isMultiPage"] != null)
                    {
                        if (((HiddenField)Master.FindControl("hidmvImgSrc")).Value == "MAVRO")
                            updateStatement += " AND fstrMPDLN = '" + kestrDocNumber.ToString() + " - " + Session["kestrImagePath"].ToString() + "'";
                        else
                            updateStatement += " AND fstrMPDLN = '" + Session["kestrImagePath"].ToString() + "'";
                    }

                    updateStatement += ";";

                    // do the update with the values, if different
                    if (oldVals != newVals.Replace("12/31/9999", ""))
                        gc.DoExecute(updateStatement);

                    // if this isn't a repeater, turn off the flag to get out of the loop after one go
                    if (repeatOffset == -1)
                        repNum = "-1";
                    // if it is a repeater, increment for next try
                    else
                        repNum = (int.Parse(repNum) + 1).ToString();

                }	// end while repeater

                // if we got here, the UPDATES worked, so clear theVals
                theVals.Value = "";

                // if requested, update the queues
                if (updateQueues)
                {
                    // if this is also a repeater form, remove any unfilled rows, since the only way for a repeater to get here is to finish the form
                    if (repeatOffset != -1 && mfstrStatus == "O")
                    {
                        string st = "DELETE FROM " + strTableName + " WHERE ";
                        st += "fblnFilled = 0 AND ";
                        st += "fstrBatchID = '" + kestrBatchId + "' AND ";
                        st += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                        st += "flngSequence = '" + kelngSequence + "' AND ";
                        st += "fstrTaxForm = '" + kestrFormName + "';";
                        gc.DoExecute(st);
                    }

                    // Update Queue Record as Keyed (Sequence,Title,Block)
                    // Same no Change Else Changed
                    //@#@# don't update anything but open batches
                    if (mfstrStatus == "O")
                    {
                        if (allNewVals == oldVals)
                        {
                            updateStatement = "UPDATE tblKeQMast ";
                            updateStatement += "SET fstrStatus = 'K', ";
                            updateStatement += "fstrUserId = '" + MyUserRole.UserName() + "' ";
                            updateStatement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                            updateStatement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                            updateStatement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                            updateStatement += "flngSequence = '" + kelngSequence + "' AND ";
                            updateStatement += "fstrFormName = '" + kestrFormName + "' AND ";
                            updateStatement += "fstrTitle = '" + kestrTitle + "' AND ";
                            updateStatement += "flngBlock = '" + kelngBlock + "' AND ";
                            updateStatement += "fstrDLN = '" + kestrDLN + "'";
                        }
                        else
                        {
                            updateStatement = "UPDATE tblKeQMast ";
                            updateStatement += "SET fstrStatus = 'K', ";
                            updateStatement += "fstrChanged = 'Y', ";
                            updateStatement += "fstrUserId = '" + MyUserRole.UserName() + "' ";
                            updateStatement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                            updateStatement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                            updateStatement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                            updateStatement += "flngSequence = '" + kelngSequence + "' AND ";
                            updateStatement += "fstrFormName = '" + kestrFormName + "' AND ";
                            updateStatement += "fstrTitle = '" + kestrTitle + "' AND ";
                            updateStatement += "flngBlock = '" + kelngBlock + "' AND ";
                            updateStatement += "fstrDLN = '" + kestrDLN + "'";
                        }
                        // update status
                        gc.DoExecute(updateStatement);
                    }

                    // not sure what this is updating, 
                    //@#@# this can update any batch, it's how we keep track of where we are
                    //@#@# this is the only table we can update
                    //@#@# this table will be cleared on exit, if batch isn't open
                    updateStatement = "UPDATE tblKeQueue ";
                    updateStatement += "SET fstrStatus = 'K' ";
                    updateStatement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    updateStatement += "fstrBatchId = '" + kestrBatchId + "' AND ";
                    updateStatement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    updateStatement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    updateStatement += "flngSequence = '" + kelngSequence + "' AND ";
                    updateStatement += "fstrFormName = '" + kestrFormName + "' AND ";
                    updateStatement += "fstrTitle = '" + kestrTitle + "' AND ";
                    updateStatement += "flngBlock = '" + kelngBlock + "' AND ";
                    updateStatement += "fstrDLN = '" + kestrDLN + "'";
                    gc.DoExecute(updateStatement);

                    // Do we have any not keyed Queue items for Sequence, Title
                    statement = "SELECT fstrStatus ";
                    statement += "FROM tblKeQueue ";
                    statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    statement += "fstrBatchId = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrFormName = '" + kestrFormName + "' AND ";
                    statement += "fstrStatus = 'A'";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);

                    //@#@# only update open batches
                    if (numRows == 0 && mfstrStatus == "O")
                    {
                        // Check in Image (All Blocks Keyed for Image)
                        updateStatement = "UPDATE tblNM_BatchImage ";
                        updateStatement += "SET fdtmImageCheckedIn = GETDATE() ";
                        updateStatement += "WHERE fstrTaxProgram = '" + kestrTaxProgram + "' AND ";
                        updateStatement += "fstrBatchId = '" + kestrBatchId + "' AND ";
                        updateStatement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                        updateStatement += "flngSequence = '" + kelngSequence + "' AND ";
                        updateStatement += "fstrFormName = '" + kestrFormName + "' AND ";
                        updateStatement += "isnull(fblnImageBlankSizeCheck, 0) = 0";
                        gc.DoExecute(updateStatement);
                    }

                    // if all items in sequence is keyed - clear queue, redirect to batchModify
                    updateStatement = "SELECT fstrStatus ";
                    updateStatement += "FROM tblKeQueue ";
                    updateStatement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    updateStatement += "fstrBatchId = '" + kestrBatchId + "' AND ";
                    updateStatement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    updateStatement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    updateStatement += "flngSequence = '" + kelngSequence + "' AND ";
                    updateStatement += "fstrStatus = 'A'";
                    gc.DoSelect(updateStatement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);

                    if (numRows == 0)
                    {
                        // this is okay for any batch status
                        updateStatement = "DELETE tblKeQueue ";
                        updateStatement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                        updateStatement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                        updateStatement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                        updateStatement += "flngSequence = '" + kelngSequence + "'";
                        gc.DoExecute(updateStatement);

                        // Check if Mavro Regular - if so Sum Payment 
                        statement = "SELECT fstrPymType ";
                        statement += "FROM tblNM_BatchInfo ";
                        statement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                        statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                        statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                        statement += "fstrTaxProgram = '" + kestrTaxProgram + "'";
                        sBuff1 = gc.DoScalar(statement).ToString();
                        sPayment = "0.00";

                        if ((sBuff1 == "REG") || (sBuff1 == "ZERO") || (sBuff1 == "GEN"))
                        {
                            // Get Data Table Name
                            statement = "SELECT fstrTable ";
                            statement += "FROM rfrControlHeaders ";
                            statement += "WHERE fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                            statement += "fstrFileType = '" + kestrFileType + "' AND ";
                            statement += "flngBlock = 0";
                            sBuff2 = gc.DoScalar(statement).ToString();
                            if (sBuff1 != "REG")
                            {
                                statement = "UPDATE " + sBuff2 + " ";
                                statement += "SET fcurPayment = 0 ";
                                statement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                                statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' ";
                                gc.DoExecute(statement);
                            }
                            // Sum Payment amount from Data Table
                            statement = "SELECT SUM(fcurPayment) ";
                            statement += "FROM " + sBuff2 + " ";
                            statement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                            statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' ";
                            sPayment = gc.DoScalar(statement).ToString();
                            // Update Batch Amount in tblNM_BatchInfo with Data Table Payment Amount
                            statement = "UPDATE tblNM_BatchInfo ";
                            statement += "SET fcurBatchAmount = '" + sPayment + "' ";
                            statement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                            statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                            statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                            statement += "fstrTaxProgram = '" + kestrTaxProgram + "'";
                            gc.DoExecute(statement);

                        }

                        // Check if Sequence is > BatchCount
                        statement = "SELECT fintBatchCount ";
                        statement += "FROM tblNM_BatchInfo ";
                        statement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                        statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                        statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                        statement += "fstrTaxProgram = '" + kestrTaxProgram + "'";
                        sBuff1 = gc.DoScalar(statement).ToString();

                        //@#@# only update open batches
                        if (long.Parse(sBuff1) < long.Parse(kelngSequence) && mfstrStatus == "O")
                        {
                            // Update BatchInfo with Sequence - Complete
                            updateStatement = "UPDATE tblNM_BatchInfo ";
                            updateStatement += "SET fintBatchCount = '" + kelngSequence + "' ";
                            updateStatement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                            updateStatement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                            updateStatement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                            updateStatement += "fstrTaxProgram = '" + kestrTaxProgram + "'";
                            gc.DoExecute(updateStatement);
                        }

                        // update the master queue with the finished batch and sequence numbers
                        //@#@# only udpate open batches
                        if (mfstrStatus == "O")
                        {
                            statement = "UPDATE tblKeQMast SET ";
                            statement += "fdtmWhenFinished = GETDATE(), ";
                            statement += "fstrWhoFinished = '" + MyUserRole.UserName() + "' ";
                            statement += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                            statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                            statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                            statement += "flngSequence = '" + kelngSequence + "'";
                            gc.DoExecute(statement);
                        }

                        // Restart BatchModify.asp (allows user to pick next sequence)
                        // if this is the last form, and we didn't use the form picker to get here, then we can safely assume we are done
                        if (formPickClick.Value != "Y")
                        {
                            sBuff1 = "../BatchModify.aspx?Batch=" + kestrBatchId + ";" + kedtmBatchDate + ";" + kestrSource + ";" + Request.QueryString["TP"];
                            gc.Disconnect();
                            // use this flag to keep from reloading the same sequence number, so the Global can rebuild the query string to get to the next sequence
                            allDone = true;
                            Response.Redirect(ResolveClientUrl(sBuff1), true);
                            return;
                        }
                    }
                }	// end if updateQueues
                // clean up in finally block
            }
            // this is just for the Response.Redirect
            // expected, don't be afraid
            catch (ThreadAbortException tex)
            {
                object kkex = tex;
            }
            // catch a format error, probably a date
            catch (FormatException fex)
            {
                hadException = fex;
                // alert the user there was an error
                if (!Page.ClientScript.IsStartupScriptRegistered("alertBAD"))
                {
                    if (brokenControl == "")
                        brokenControl = "Unknown";
                    string alertBAD = "alert( \"There is an error in your keyed data. Please re-check your data and try again. More detail is below.\\n\\nControl causing error: " + brokenControl + "\\n" + fex.Message.Replace("\n", "").Replace("\r", "");
                    alertBAD += (fex.InnerException != null ? "\\n" + fex.InnerException.Message.Replace("\n", "").Replace("\r", "") : "") + "\");";
                    ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertBAD", alertBAD, true);
                }
            }
            // catch all for other errors
            catch (Exception ex)
            {
                hadException = ex;
                // any SQL errors will be wrapped in the expection, by construction of the GoodConn
                // catch SQL errors
                if (ex.InnerException != null && ex.InnerException is SqlException)
                {
                    // alert the user there was an error, skip out-of-range datetime errors
                    if (!Page.ClientScript.IsStartupScriptRegistered("alertBAD"))
                    {
                        string alertBAD = "alert( \"There has been an error submitting the data to the database. Please re-check your data and try again. More detail is below.\\n\\n" + ex.Message.Replace("\n", "").Replace("\r", "");
                        alertBAD += (ex.InnerException != null ? "\\n" + ex.InnerException.Message.Replace("\n", "").Replace("\r", "") : "") + "\");";
                        // skip out-of-range dtetime errors
                        if (alertBAD.IndexOf("out-of-range datetime value") == -1)
                            ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertBAD", alertBAD, true);
                    }
                }
                else
                {
                    // alert the user there was an error
                    if (!Page.ClientScript.IsStartupScriptRegistered("alertBAD"))
                    {
                        string alertBAD = "alert( \"There has been an unknown error. Please re-check your data and try again. The error is below.\\n\\n" + ex.Message.Replace("\n", "").Replace("\r", "");
                        alertBAD += (ex.InnerException != null ? "\\n" + ex.InnerException.Message.Replace("\n", "").Replace("\r", "") : "") + "\");";
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "alertBAD", alertBAD, true);
                    }
                }
            }
            finally
            {
                // if we had an exception (i.e. didn't get to the end of the try block)
                if (hadException != null)
                {
                    // record error
                    UtilClass.RecordError(gc, hadException);
                    // and put the old values back in
                    string replaceVals = "";
                    foreach (string nv in theVals.Value.Split('&'))
                    {
                        if (nv == "")
                            continue;

                        // we don't have access to the controls, they will be build later
                        // so we register a startup script that will put the values in the appropriate controls
                        replaceVals += "$('#" + nv.Split(']')[0].Replace("[", "").Replace("]", "") + "').val(\"" + nv.Split(']')[1].Replace("{", "").Replace("}", "").Replace("\"", "\\\"") + "\");";
                    }
                    if (!Page.ClientScript.IsStartupScriptRegistered("replaceVals"))
                        ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "replaceVals", replaceVals, true);
                }
                // clean up
                gc.Disconnect();
                // all done, reload the data we just put in there
                // don't load if we are done with this reutrn
                if (!allDone)
                    LoadData();
            }
        }

        private void LoadData(bool isFirstLoad = false)
        {

            GoodConn gc = new GoodConn();
            DataTable dt;
            DataTable tt;
            int numRows;
            int i;
            int lngRepTopBot = 0;
            string statement = "";
            string statement2 = "";
            string strKeepDec = "N";
            string[] hldTouch;
            string wrkTouch;
            DataTable ctrlDT;


            // these four come from BatchModify.aspx, so leave them as QueryString values
            string kestrBatchId = Request.QueryString["Batch"] ?? "";
            string kedtmBatchDate = Request.QueryString["BatchDate"] ?? "";
            string kestrSource = Request.QueryString["ImageSource"] ?? "";
            string kelngSequence = Request.QueryString["Sequence"] ?? "";
            // these only come from a postback on this page, put them in the ViewState
            string kestrDocNumber = (string)ViewState["DocNumber"] ?? "";
            string kestrDLN = (string)ViewState["DLN"] ?? "";
            string kestrTitle = (string)ViewState["Title"] ?? "";
            string kelngBlock = (string)ViewState["Block"] ?? "";
            string kestrTaxProgram = (string)ViewState["TaxProgram"] ?? "";
            string kestrFormName = (string)ViewState["FormName"] ?? "";
            string kestrFileType = (string)ViewState["FileType"] ?? "";
            string mfstrStatus = (string)ViewState["fstrBatchStatus"] ?? "";

            string kestrPickFormName = "";
            string kestrPickTitle = "";
            string kelngPickBlock = "";
            string kestrPickDln = "";
            string kestrPickDocNumber = "";

            string kestrImagePath = "";
            string kelngTaxYear = "";

            string strFormPick = "";

            string strTableName = "";
            bool isTimely = false;
            string keFocus = "";
            string keFocus2nd = "";
            string keRecOld = "";
            /**/
            int repeatOffset = -1;
            int headerStartNum = 0;
            if (ViewState["repeatOffset"] != null)
                repeatOffset = int.Parse(ViewState["repeatOffset"].ToString());
            /**/


            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                // Get Tables for Tax Program
                statement = "SELECT fstrTable ";
                statement += "FROM rfrTable ";
                statement += "WHERE fstrTaxProgram = '" + taxProgHID.Value + "';";
                tt = new DataTable();
                gc.DoSelect(statement);
                numRows = gc.ReadSelect(out tt);
                if (numRows > 0)
                {
                    // Create Table Entry for each table in tax Program that is not a repeater/Page for BatchId, Sequence
                    foreach (DataRow row in tt.Rows)
                    {
                        strTableName = row["fstrTable"].ToString();
                        statement = "SELECT fstrBatchId ";
                        statement += "FROM " + strTableName + " ";
                        statement += "WHERE fstrBatchId = '" + kestrBatchId + "' ";
                        statement += "AND flngSequence = '" + kelngSequence + "' ;";
                        dt = new DataTable();
                        gc.DoSelect(statement);
                        numRows = gc.ReadSelect(out dt);
                        if (numRows == 0)
                        {
                            statement = "INSERT INTO " + strTableName + " ";
                            statement += "(fstrBatchId, fdtmBatchDate, flngSequence, fstrWho) ";
                            statement += "VALUES ('" + kestrBatchId + "', '" + kedtmBatchDate + "', '" + kelngSequence + "', '" + MyUserRole.UserName() + "') ";
                            gc.DoExecute(statement);
                        }
                        dt.Dispose();
                    }
                }
                tt.Dispose();





                statement = "SELECT ";
                // use status to view closed batches
                statement += "	b.fstrBatchStatus, ";
                statement += "	b.fstrTimelyBatch, ";
                statement += "	b.fstrPymType, ";
                statement += "	b.fstrTaxProgram ";
                statement += "FROM ";
                statement += "	tblNM_BatchInfo b ";
                statement += "WHERE ";
                statement += "	b.fstrBatchId = '" + kestrBatchId + "' AND ";
                statement += "	b.fstrTaxProgram = '" + taxProgHID.Value + "';";

                //@#@# save the status immediately, it will be used everywhere
                dt = new DataTable();
                gc.DoSelect(statement);
                numRows = gc.ReadSelect(out dt);
                mfstrStatus = dt.Rows[0]["fstrBatchStatus"].ToString();
                TaxPgmtxt.Text = dt.Rows[0]["fstrTaxProgram"].ToString();
                PymTypetxt.Text = dt.Rows[0]["fstrPymType"].ToString();
                Timelytxt.Text = dt.Rows[0]["fstrTimelyBatch"].ToString();
                // if not open, disable the "Submit" button
                if (mfstrStatus != "O")
                {
                     
                    btnSub.Enabled = false;
                    ((HiddenField)Master.FindControl("typeHID")).Value = "view";
                }



                // some setup for the queue and checkouts of these forms and batches
                // Setup Entry Queue for Each Title / Block in Sequence - has Image Path
                string keLoadQMast = "Y";
                statement = "SELECT fstrFormName, ";
                statement += "flngBlock, ";
                statement += "fstrTitle ";
                statement += "FROM tblKeQMast ";
                statement += "WHERE fstrBatchID = '" + kestrBatchId + "' AND ";
                statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                statement += "flngSequence = '" + kelngSequence + "' ";
                statement += "ORDER BY fstrFormName, flngBlock, fstrTitle, fstrDLN";

                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                // if the select returned something, don't load int othe QMast
                if (numRows > 0)
                    keLoadQMast = "N";

                // Check if Entry Queue exist
                statement = "SELECT fstrFormName, ";
                statement += "flngBlock, ";
                statement += "fstrTitle ";
                statement += "FROM tblKeQueue ";
                statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                statement += "fstrBatchID = '" + kestrBatchId + "' AND ";
                statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                statement += "flngSequence = '" + kelngSequence + "' ";
                statement += "ORDER BY fstrFormName, ";
                statement += "flngBlock, fstrTitle, fstrDLN";

                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);


                // If Queue Does Not Exist - Create 
                if (numRows == 0)
                {
                    // Get all Forms / Blocks for BatchId, Sequence

                    //@#@# new select statement
                    statement = "SELECT DISTINCT ";
                    // tblNM_BatchImage
                    statement += "	i.flngSequence, ";
                    statement += "	i.fstrFormName, ";
                    statement += "	i.fstrImagePath, ";
                    statement += "	i.fstrDLN, ";
                    statement += "	i.fstrImageDocID, ";
                    //tblNM_BatchInfo
                    statement += "	b.fstrTaxProgram, ";
                    statement += "	b.fstrForm, ";
                    statement += "	b.fstrTimelyBatch, ";
                    statement += "	CONVERT( VARCHAR(10), b.fdtmPostmarkDate, 101 ) AS fdtmPostmarkDate, ";
                    // rfrReturnHeaders
                    statement += "	rh.fstrFileType, ";
                    // rfrControlHeaders
                    statement += "	ch.fstrBlockTitle, ";
                    statement += "	ch.flngBlock ";
                    statement += "FROM ";
                    statement += "	tblNM_BatchImage i, ";
                    statement += "	tblNM_BatchInfo b, ";
                    statement += "	rfrReturnHeaders rh, ";
                    statement += "	rfrControlHeaders ch ";
                    statement += "WHERE ";
                    statement += "	i.fstrBatchId = '" + kestrBatchId + "' AND ";
                    statement += "	i.fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "	i.flngSequence = '" + kelngSequence + "' AND ";
                    statement += "	i.fstrFormName IS NOT NULL AND ";
                    statement += "	ISNULL( i.fblnImageBlankSizeCheck, 0 ) = 0 AND ";
                    statement += "	i.fstrBatchId = b.fstrBatchId AND ";
                    statement += "	i.fstrTaxProgram = b.fstrTaxProgram AND ";
                    statement += "	CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) = CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ) AND ";
                    // link the headers
                    statement += "	ch.flngReturnHeadersIDFK = rh.idReturnHeaders AND ";
                    // link to this tax program
                    statement += "	b.fstrTaxProgram = rh.fstrTaxProgram AND ";
                    statement += "	i.fstrFormName = ch.fstrTaxForm AND ";
                    statement += "	b.fstrForm = rh.flngTaxYear AND ";
                    statement += "	ch.flngBlock <> 0 ";
                    statement += "GROUP BY ";
                    statement += "	i.flngSequence, ";
                    statement += "	i.fstrFormName, ";
                    statement += "	i.fstrImagePath, ";
                    statement += "	i.fstrDLN, ";
                    statement += "	i.fstrImageDocID, ";
                    statement += "	b.fstrTaxProgram, ";
                    statement += "	b.fstrForm, ";
                    statement += "	b.fstrTimelyBatch, ";
                    statement += "	fdtmPostmarkDate, ";
                    statement += "	ch.fstrBlockTitle, ";
                    statement += "	rh.fstrFileType, ";
                    statement += "	ch.flngBlock ";
                    statement += "ORDER BY ";
                    statement += "	i.flngSequence, ";
                    statement += "	i.fstrFormName, ";
                    statement += "	ch.flngBlock, ";
                    statement += "	i.fstrDLN;";


                    gc.DoSelect(statement);
                    ctrlDT = new DataTable();
                    numRows = gc.ReadSelect(out ctrlDT);

                    if (numRows > 0)
                    {
                        // Create Queue Entry for each form / block in BatchId, Sequence
                        foreach (DataRow row in ctrlDT.Rows)
                        {
                            statement = "INSERT INTO tblKeQueue ( ";
                            statement += "fstrUserId, ";
                            statement += "fstrBatchId, ";
                            statement += "fdtmBatchDate, ";
                            statement += "flngSequence, ";
                            statement += "fstrTitle, ";
                            statement += "flngBlock, ";
                            statement += "fstrFormName, ";
                            statement += "fstrImagePath, ";
                            statement += "fstrStatus, ";
                            statement += "fstrTaxProgram, ";
                            statement += "flngTaxYear, ";
                            statement += "fstrFileType, ";
                            statement += "fstrDLN, ";
                            statement += "fstrTimelyBatch, ";
                            statement += "fdtmPostMarkDate, ";
                            statement += "flngDocNumber )";
                            statement += " VALUES ( '" + MyUserRole.UserName() + "', ";
                            statement += "'" + kestrBatchId + "', ";
                            statement += "'" + kedtmBatchDate + "', ";
                            statement += "'" + kelngSequence + "', ";
                            statement += "'" + row["fstrBlockTitle"] + "', ";
                            statement += "'" + row["flngBlock"] + "', ";
                            statement += "'" + row["fstrFormName"] + "', ";
                            statement += "'" + row["fstrImagePath"] + "', ";
                            statement += "'A', ";
                            statement += "'" + row["fstrTaxProgram"] + "', ";
                            statement += "'" + row["fstrForm"] + "', ";
                            statement += "'" + row["fstrFileType"] + "', ";
                            statement += "'" + row["fstrDLN"] + "', ";
                            statement += "'" + row["fstrTimelyBatch"] + "', ";
                            statement += "'" + row["fdtmPostmarkDate"] + "', ";
                            statement += "'" + row["fstrImageDocID"] + "' )";

                            gc.DoExecute(statement);

                            if (keLoadQMast == "Y" && mfstrStatus == "O")
                            {
                                statement = "INSERT INTO tblKeQMast ( ";
                                statement += "fstrUserId, ";
                                statement += "fstrBatchId, ";
                                statement += "fdtmBatchDate, ";
                                statement += "flngSequence, ";
                                statement += "fstrTitle, ";
                                statement += "flngBlock, ";
                                statement += "fstrFormName, ";
                                statement += "fstrImagePath, ";
                                statement += "fstrStatus, ";
                                statement += "fstrChanged, ";
                                statement += "fstrTaxProgram, ";
                                statement += "flngTaxYear, ";
                                statement += "fstrFileType, ";
                                statement += "fstrDLN, ";
                                statement += "fstrTimelyBatch, ";
                                statement += "fdtmPostMarkDate, ";
                                statement += "flngDocNumber )";
                                statement += " VALUES ( '" + MyUserRole.UserName() + "', ";
                                statement += "'" + kestrBatchId + "', ";
                                statement += "'" + kedtmBatchDate + "', ";
                                statement += "'" + kelngSequence + "', ";
                                statement += "'" + row["fstrBlockTitle"] + "', ";
                                statement += "'" + row["flngBlock"] + "', ";
                                statement += "'" + row["fstrFormName"] + "', ";
                                statement += "'" + row["fstrImagePath"] + "', ";
                                statement += "'A', ";
                                statement += "'N', ";
                                statement += "'" + row["fstrTaxProgram"] + "', ";
                                statement += "'" + row["fstrForm"] + "', ";
                                statement += "'" + row["fstrFileType"] + "', ";
                                statement += "'" + row["fstrDLN"] + "', ";
                                statement += "'" + row["fstrTimelyBatch"] + "', ";
                                statement += "'" + row["fdtmPostmarkDate"] + "', ";
                                statement += "'" + row["fstrImageDocID"] + "' )";

                                gc.DoExecute(statement);
                            }
                        }
                    }
                }

                // Check if Form Pick Occurred
                // If Form is Picked or did we use the link to get here
                //@#@# update this one to be the most recent keyed?
                if (formPickClick.Value == "Y" ||
                    (isFirstLoad && Request.QueryString["fstrFormName"] != null && Request.QueryString["fstrFormName"] != ""))
                {
                    if (formPickClick.Value == "Y")
                    {
                        kestrPickFormName = hidFormName.Value;
                        kestrPickTitle = hidTitle.Value;
                        kelngPickBlock = hidBlock.Value;
                        kestrPickDln = hidDln.Value;
                        kestrPickDocNumber = hidDocNumber.Value;
                        // turn that off, we don't need it anymore
                        formPickClick.Value = "N";
                    }
                    else if (isFirstLoad && Request.QueryString["fstrFormName"] != null && Request.QueryString["fstrFormName"] != "")
                    {
                        // we need the title referenced by this form name and block
                        statement = "SELECT fstrFormName, flngBlock, fstrTitle ";
                        statement += "FROM tblKeQueue ";
                        statement += "WHERE fstrBatchID = '" + kestrBatchId + "' AND ";
                        statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                        statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                        statement += "flngSequence = '" + kelngSequence + "' AND ";
                        statement += "flngBlock = 1 AND fstrFormName = '" + Request.QueryString["fstrFormName"] + "';";
                        dt = new DataTable();
                        gc.DoSelect(statement);
                        numRows = gc.ReadSelect(out dt);
                        kestrPickFormName = dt.Rows[0]["fstrFormName"].ToString();
                        kelngBlock = dt.Rows[0]["flngBlock"].ToString();
                        kestrPickTitle = dt.Rows[0]["fstrTitle"].ToString();
                        kestrPickDln = " ";
                        kestrPickDocNumber = " ";
                    }

                    // First Set all to Active - Picking above where we were
                    statement = "UPDATE tblKeQueue ";
                    statement += "SET fstrStatus = 'A' ";
                    statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    statement += "fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "'";
                    gc.DoExecute(statement);

                    // Marked as Key if less than Form Name
                    statement = "UPDATE tblKeQueue ";
                    statement += "SET fstrStatus = 'K' ";
                    statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    statement += "fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrFormName < '" + kestrPickFormName + "'";
                    gc.DoExecute(statement);

                    // Marked as Key if less than Title
                    statement = "UPDATE tblKeQueue ";
                    statement += "SET fstrStatus = 'K' ";
                    statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    statement += "fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrFormName = '" + kestrPickFormName + "' AND ";
                    statement += "fstrTitle < '" + kestrPickTitle + "'";
                    gc.DoExecute(statement);

                    // Marked as Key if less than block of Title
                    statement = "UPDATE tblKeQueue ";
                    statement += "SET fstrStatus = 'K' ";
                    statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    statement += "fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrFormName = '" + kestrPickFormName + "' AND ";
                    statement += "fstrTitle = '" + kestrPickTitle + "' AND ";
                    statement += "flngBlock < '" + kelngPickBlock + "'";
                    gc.DoExecute(statement);

                    // Marked as Key if less than DLN, block of Title
                    statement = "UPDATE tblKeQueue ";
                    statement += "SET fstrStatus = 'K' ";
                    statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                    statement += "fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrFormName = '" + kestrPickFormName + "' AND ";
                    statement += "fstrTitle = '" + kestrPickTitle + "' AND ";
                    statement += "flngBlock = '" + kelngPickBlock + "' AND ";
                    statement += "fstrDLN < '" + kestrPickDln + "'";
                    gc.DoExecute(statement);

                    // reset the form pick
                    // this value gets reset outside in the form load, outside of !IsPostBack to handle the update also
                }

                // Get Queue 
                statement = "SELECT fstrTitle, ";
                statement += "flngBlock, ";
                statement += "fstrFormName, ";
                statement += "fstrImagePath, ";
                statement += "fstrStatus, ";
                statement += "fstrTaxProgram, ";
                statement += "flngTaxYear, ";
                statement += "fstrFileType, ";
                statement += "fstrDLN, ";
                statement += "flngDocNumber ";
                statement += "FROM tblKeQueue ";
                statement += "WHERE fstrUserId = '" + MyUserRole.UserName() + "' AND ";
                statement += "fstrBatchID = '" + kestrBatchId + "' AND ";
                statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                statement += "flngSequence = '" + kelngSequence + "' ";
                // if this is the first load, and we have the form name in the query string, go there instead of the 'next to key'
                if (isFirstLoad && Request.QueryString["fstrFormName"] != null && Request.QueryString["fstrFormName"] != "")
                {
                    statement += "AND fstrFormName = '" + Request.QueryString["fstrFormName"] + "'";
                    statement += " AND flngBlock = 1 ";
                }
                statement += "ORDER BY fstrFormName, flngBlock, fstrTitle, fstrDLN";

                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);

                // Get First Block (if already key then check if there is an Active one)
                //@#@# this forces the user to go to the next one to key, if they used the other form link, they should go to that form
                //@#@# since that is where they wanted to do, and took the time to click there
                //@#@# how do we define they clicked that link, and how do we know which form/block to go to
                //@#@# how do we change what we load vs a normal 'key whatever is next' load

                if (numRows > 0)
                {
                    kestrTitle = dt.Rows[0]["fstrTitle"].ToString();
                    kelngBlock = dt.Rows[0]["flngBlock"].ToString();
                    kestrFormName = dt.Rows[0]["fstrFormName"].ToString();
                    kestrImagePath = dt.Rows[0]["fstrImagePath"].ToString();
                    kestrTaxProgram = dt.Rows[0]["fstrTaxProgram"].ToString();
                    kelngTaxYear = dt.Rows[0]["flngTaxYear"].ToString();
                    kestrFileType = dt.Rows[0]["fstrFileType"].ToString();
                    kestrDLN = dt.Rows[0]["fstrDLN"].ToString();
                    kestrDocNumber = dt.Rows[0]["flngDocNumber"].ToString();
                    if (dt.Rows[0]["fstrStatus"].ToString() != "A")
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            if (row["fstrStatus"].ToString() == "A")
                            {
                                kestrFormName = row["fstrFormName"].ToString();
                                kestrTitle = row["fstrTitle"].ToString();
                                kelngBlock = row["flngBlock"].ToString();
                                kestrFormName = row["fstrFormName"].ToString();
                                kestrImagePath = row["fstrImagePath"].ToString();
                                kestrTaxProgram = row["fstrTaxProgram"].ToString();
                                kelngTaxYear = row["flngTaxYear"].ToString();
                                kestrFileType = row["fstrFileType"].ToString();
                                kestrDLN = row["fstrDLN"].ToString();
                                kestrDocNumber = row["flngDocNumber"].ToString();
                                break;
                            }
                        }
                    }
                }
                else
                {
                    Response.Write("Missing Images - No Queue");
                    Response.End();
                }
                //   Check if the form name exist - multi forms for Mavro
                if (((HiddenField)Master.FindControl("hidmvImgSrc")).Value == "MAVRO")
                {
                    statement = "SELECT ";
                    statement += "flngDocNumber, ";
                    statement += "flngFrontOffSet, ";
                    statement += "flngFrontSize ";
                    statement += "FROM tblNM_MavroOffset ";
                    statement += "WHERE fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrFormType = '" + kestrFormName + "' AND ";
                    statement += "flngDocNumber = '" + kestrDocNumber + "' ";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        Offsettxt.Text = dt.Rows[0]["flngFrontOffset"].ToString();
                        Sizetxt.Text = dt.Rows[0]["flngFrontSize"].ToString();
                        DocNbrtxt.Text = dt.Rows[0]["flngDocNumber"].ToString();
                        ((HiddenField)Master.FindControl("hidmvDocNbr")).Value = dt.Rows[0]["flngDocNumber"].ToString();
                        Session["mvDocNbr"] = dt.Rows[0]["flngDocNumber"].ToString();
                        ((HiddenField)Master.FindControl("hidmvOffset")).Value = dt.Rows[0]["flngFrontOffset"].ToString();
                        Session["mvOffset"] = dt.Rows[0]["flngFrontOffset"].ToString();
                        ((HiddenField)Master.FindControl("hidmvSize")).Value = dt.Rows[0]["flngFrontSize"].ToString();
                        Session["mvSize"] = dt.Rows[0]["flngFrontSize"].ToString();
                    }
                }


                // need the header ID 
                statement = "SELECT idControlHeaders ";
                statement += "FROM rfrControlHeaders ch, ";
                statement += "rfrReturnHeaders rh ";
                statement += "WHERE ch.flngReturnHeadersIDFK = rh.idReturnHeaders AND ";
                statement += "rh.fstrFileType = '" + kestrFileType + "' AND ";
                statement += "ch.fstrTaxForm = '" + kestrFormName + "' AND ";
                statement += "ch.flngBlock = " + kelngBlock + ";";
                string chID = gc.DoScalar(statement).ToString();

                // Set LandScape

                statement = "SELECT STR(fblnLand,1) As strLand ";
                statement += "FROM rfrControlHeaders ";
                statement += "WHERE idControlHeaders = " + chID + ";";
                string strLand1 = gc.DoScalar(statement).ToString();

                ((HiddenField)Master.FindControl("hidLand")).Value = strLand1.ToString();

                // Check if txtCountry is in Control - if so allow Pick Country 

                statement = "SELECT fstrInputId ";
                statement += "FROM rfrControls ";
                statement += "WHERE flngControlHeadersIDFK = " + chID + " ";
                statement += "AND fstrInputID = 'txtCountry' ";
                statement += "AND fblnActive = 1 ";
                statement += "AND flngOrder > 0; ";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);

                if (numRows > 0)
                    CountryChk.Visible = true;
                if (numRows == 0)
                    CountryChk.Visible = false;

                statement = "SELECT fstrFormType, ";
                statement += "fstrTable, ";
                statement += "flngRepeatOffset, ";
                statement += "flngRepeat2Offset, ";
                statement += "flngRepeat3Offset, ";
                statement += "flngRepeat4Offset, ";
                statement += "flngRepeat5Offset, ";
                statement += "flngRepeat6Offset, ";
                statement += "flngRepeat7Offset, ";
                statement += "flngHeaderStart, ";
                statement += "fstrImgSrc, ";
                statement += "fstrKeepDec, ";
                statement += "flngRepTopBot ";
                statement += "FROM rfrControlHeaders ";
                statement += "WHERE idControlHeaders = " + chID + ";";
                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                //                
                lngRepTopBot = int.Parse(dt.Rows[0]["flngRepTopBot"].ToString());
                strTableName = dt.Rows[0]["fstrTable"].ToString();

                //   
                repeatOffset = -1;
                if (numRows > 0)
                {
                    ((HiddenField)Master.FindControl("hidmvImgSrc")).Value = dt.Rows[0]["fstrImgSrc"].ToString();
                    Session["mvImgSrc"] = dt.Rows[0]["fstrImgSrc"].ToString();
                    Session["KeepDec"] = dt.Rows[0]["fstrKeepDec"].ToString();

                    if (dt.Rows[0]["fstrFormType"].ToString() == "N")
                    {
                        repeatOffset = -1;
                        ViewState["repeatOffset"] = -1;
                        ViewState["isMultiPage"] = null;
                        ((Panel)Master.FindControl("repeaterPNL")).Visible = false;
                    }
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "R")
                    {
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "0")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "2")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat2Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "3")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat3Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "4")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat4Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "5")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat5Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "6")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat6Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "7")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat7Offset"].ToString());
                        }
                        //repeatOffset = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                        headerStartNum = int.Parse(dt.Rows[0]["flngHeaderStart"].ToString());
                        ViewState["repeatOffset"] = repeatOffset;
                        ViewState["isMultiPage"] = null;
                        // don't show the repeater panel on PIT, show it on the rest
                        // with 2014, the PIT-CR needs the repeater panel
                        // if (kestrTaxProgram == "PIT" && kestrFormName.IndexOf("CR") == -1)
                        if (strTableName == "tblPitS") 
                            ((Panel)Master.FindControl("repeaterPNL")).Visible = false;
                        else
                            ((Panel)Master.FindControl("repeaterPNL")).Visible = true;
                    }
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "P")
                    {
                        repeatOffset = -1;
                        headerStartNum = 0;
                        ViewState["repeatOffset"] = -1;
                        ViewState["isMultiPage"] = "Y";
                        ((Panel)Master.FindControl("repeaterPNL")).Visible = false;
                    }
                    else if (dt.Rows[0]["fstrFormType"].ToString() == "RP")
                    {
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "0")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "2")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat2Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "3")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat3Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "4")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat4Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "5")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat5Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "6")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat6Offset"].ToString());
                        }
                        if (((HiddenField)Master.FindControl("hidOgdForm")).Value == "7")
                        {
                            repeatOffset = int.Parse(dt.Rows[0]["flngRepeat7Offset"].ToString());
                        }
                        //repeatOffset = int.Parse(dt.Rows[0]["flngRepeatOffset"].ToString());
                        headerStartNum = int.Parse(dt.Rows[0]["flngHeaderStart"].ToString());
                        ViewState["repeatOffset"] = repeatOffset;
                        ViewState["isMultiPage"] = "Y";
                        // don't show the repeater panel on PIT, show it on the rest
                        // with 2014, the PIT-CR needs the repeater panel
                        if (strTableName == "tblPitS")
                        //if (kestrTaxProgram == "PIT" && kestrFormName.IndexOf("CR") == -1)
                            ((Panel)Master.FindControl("repeaterPNL")).Visible = false;
                        else
                            ((Panel)Master.FindControl("repeaterPNL")).Visible = true;
                    }

                    // show buttons and link handlers if we need
                    // do this out here, because we need to relink the handler each load if it's needed

                    // since we can't tie a child function to a master pages control event
                    // we will simply make our own button and add it to the repeater page
                    // handle the keydown, move to submit if tab, otherwise let system handle it
                    if (!Page.ClientScript.IsStartupScriptRegistered("moreBTNkeydown"))
                    {
                        string moreBTNkeydown = @"$('#" + ((Panel)Master.FindControl("repeaterPNL")).FindControl("repeaterBTN").ClientID + @"').on('keydown', function() {
												if((window.event.keyCode == 9) && (!window.event.shiftKey))
												{
													$('#" + ((Panel)Master.FindControl("repeaterPNL")).FindControl("submit2BTN").ClientID + @"').focus();
													event.returnValue = false;
												}
											});";
                        moreBTNkeydown += @"$('#" + ((Panel)Master.FindControl("repeaterPNL")).FindControl("submit2BTN").ClientID + @"').on('keydown', function() {
												if((window.event.keyCode == 9) && (!window.event.shiftKey))
												{
													$('#" + btnSub.ClientID + @"').focus();
													event.returnValue = false;
												}
											});";
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "moreBTNkeydown", moreBTNkeydown, true);
                    }
                }

                // put image in here, from kestrImagePath
                // formIMG
                Session["kestrImagePath"] = kestrImagePath;


                string DocNbr = "1";
                if (DocNbrtxt.Text != "")
                    DocNbr = DocNbrtxt.Text;

                if (((HiddenField)Master.FindControl("hidmvImgSrc")).Value == "MAVRO")
                {
                    statement = "SELECT ";
                    statement += "flngDocNumber, ";
                    statement += "flngFrontOffSet, ";
                    statement += "flngFrontSize ";
                    statement += "FROM tblNM_MavroOffset ";
                    statement += "WHERE fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "flngDocNumber = '" + DocNbr + "' ";
                    gc.DoSelect(statement);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        Offsettxt.Text = dt.Rows[0]["flngFrontOffset"].ToString();
                        Sizetxt.Text = dt.Rows[0]["flngFrontSize"].ToString();
                        DocNbrtxt.Text = dt.Rows[0]["flngDocNumber"].ToString();
                        ((HiddenField)Master.FindControl("hidmvDocNbr")).Value = dt.Rows[0]["flngDocNumber"].ToString();
                        Session["mvDocNbr"] = dt.Rows[0]["flngDocNumber"].ToString();
                        ((HiddenField)Master.FindControl("hidmvOffset")).Value = dt.Rows[0]["flngFrontOffset"].ToString();
                        Session["mvOffset"] = dt.Rows[0]["flngFrontOffset"].ToString();
                        ((HiddenField)Master.FindControl("hidmvSize")).Value = dt.Rows[0]["flngFrontSize"].ToString();
                        Session["mvSize"] = dt.Rows[0]["flngFrontSize"].ToString();
                    }
                }


                batchIDTXT.Text = kestrBatchId;
                batchDateTXT.Text = kedtmBatchDate;
                itemNoTXT.Text = kelngSequence;
                Titletxt.Text = kestrTitle;
                Blocktxt.Text = kelngBlock;
                ImgSrctxt.Text = Session["mvImgSrc"].ToString();
                string chkpath = Session["kestrImagePath"].ToString();

                // check if it can load it
                if (TryLoad())
                    ((Image)Master.FindControl("imgImage")).ImageUrl = "noFront/imageLoad.aspx";
                else
                    ((Image)Master.FindControl("imgImage")).ImageUrl = "images/imgError.jpg";


                // Get Entry Queue for Form Pick
                // also get the timely flag and postmark
                statement = "SELECT ";
                string postMarkDate = "";
                string nextCtrl = "";
                bool havePostmark = false;
                statement = "SELECT fstrFormName, ";
                statement += "fstrTitle, ";
                statement += "flngBlock, ";
                statement += "fstrStatus, ";
                statement += "fstrChanged, ";
                statement += "fstrDLN, ";
                statement += "fstrTimelyBatch, ";
                statement += "CONVERT( VARCHAR(10), fdtmPostMarkDate, 101 ) as fdtmPostMarkDate, ";
                statement += "flngDocNumber ";
                statement += "FROM tblKeQMast ";
                statement += "WHERE fstrBatchID = '" + kestrBatchId + "' AND ";
                statement += "fstrTaxProgram = '" + taxProgHID.Value + "' AND ";
                statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                statement += "flngSequence = '" + kelngSequence + "' ";
                statement += "ORDER BY fstrFormName, flngBlock, fstrTitle, fstrDLN";

                gc.DoSelect(statement);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                isTimely = (dt.Rows[0]["fstrTimelyBatch"].ToString() == "Y");
                postMarkDate = dt.Rows[0]["fdtmPostMarkDate"].ToString();
                // put form list in here, from strFormPick
                // be sure to include all <td></td> elements needed for each part
                // formListLIT
                strFormPick = "";
                if (numRows > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        strFormPick += "<tr @@@ >";
                        strFormPick += "<td>" + row["fstrFormName"] + "</td>";
                        strFormPick += "<td>" + row["fstrTitle"] + "</td>";
                        strFormPick += "<td>" + row["flngBlock"] + "</td>";
                        strFormPick += "<td>" + row["fstrStatus"] + "</td>";
                        strFormPick += "<td>" + row["fstrChanged"] + "</td>";
                        strFormPick += "<td>" + row["fstrDLN"] + "</td>";
                        strFormPick += "<td>" + row["flngDocNumber"] + "</td>";
                        strFormPick += "</tr>";
                        if (row["flngBlock"].ToString() == kelngBlock && row["fstrFormName"].ToString() == kestrFormName && row["fstrTitle"].ToString() == kestrTitle && row["fstrDLN"].ToString() == kestrDLN)
                            strFormPick = strFormPick.Replace("@@@", "style=\"background: #FFFFFF;\"");
                        else
                            strFormPick = strFormPick.Replace("@@@", "onmouseover=\"ChangeColor(this,true);\" onmouseout=\"ChangeColor(this,false);\" onclick=\"if(checkRequired()){SelectPickRow(" + "'" + row["fstrDln"].ToString() + "', '" + row["flngBlock"].ToString() + "', '" + row["fstrTitle"].ToString() + "', '" + row["fstrFormName"].ToString() + "');}\"");
                    }
                    formListLIT.Text = strFormPick;
                }

                // Set Image as Checked Out
                //@#@# if batch is open
                if (mfstrStatus == "O")
                {
                    statement = "UPDATE tblNM_BatchImage ";
                    statement += "SET fdtmImageCheckedOut = GETDATE() ";
                    statement += "WHERE fstrTaxProgram = '" + kestrTaxProgram + "' AND ";
                    statement += "fstrBatchId = '" + kestrBatchId + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrFormName = '" + kestrFormName + "' AND ";
                    statement += "fstrDln = '" + kestrDLN + "' AND ";
                    statement += "ISNULL( fblnImageBlankSizeCheck, 0 ) = 0 ";
                    gc.DoExecute(statement);
                }


                // Get Controls and Columns for Block
                string ctrlStatement = "SELECT c.fstrInputId, ";
                ctrlStatement += "ch.fstrTable, ";
                ctrlStatement += "ch.fstrKeepDec, ";
                ctrlStatement += "c.fstrColumn, ";
                ctrlStatement += "c.fstrNextCtrl, ";
                ctrlStatement += "c.fblnRequired ";
                ctrlStatement += "FROM rfrControls c, ";
                ctrlStatement += "rfrControlHeaders ch, ";
                ctrlStatement += "rfrReturnHeaders rh ";
                ctrlStatement += "WHERE c.flngControlHeadersIDFK = ch.idControlHeaders AND ";
                ctrlStatement += "ch.flngReturnHeadersIDFK = rh.idReturnHeaders AND ";
                ctrlStatement += "ch.fstrTaxForm = '" + kestrFormName + "' AND ";
                ctrlStatement += "rh.fstrFileType = '" + kestrFileType + "' AND ";
                ctrlStatement += "ch.flngBlock = '" + kelngBlock + "' AND ";
                ctrlStatement += "c.fblnActive = 1 AND ";
                ctrlStatement += "c.flngOrder > 0 ";
                ctrlStatement += "ORDER BY c.flngOrder";

                gc.DoSelect(ctrlStatement);
                ctrlDT = new DataTable();
                numRows = gc.ReadSelect(out ctrlDT);
                if (numRows > 0)
                { 
                    strTableName = ctrlDT.Rows[0]["fstrTable"].ToString();      // Get Data TableName for Block
                    strKeepDec = ctrlDT.Rows[0]["fstrKeepDec"].ToString();      // Get Data KeepDec for Block
                }
                DataTable valDT = new DataTable();
                DataTable repeatNums = new DataTable();

                // now that we have the controls, check for a repeater table
                int loopBound = 1;
                int maxFlngRepNum = 0;
                bool allRowsFilled = true;

                if (repeatOffset != -1)
                {
                    //@#@#@# this might change, if we want to have all the rows we need available
                    //@#@#@# this is going to get too specific to PIT dependants and PIT-S
                    //@#@#@# how to get around it

                    // if repeater, get the max sequence value
                    // we'll need that to display what we have, and then make one more for new values
                    statement = "SELECT flngRepNum, ";
                    statement += "fblnFilled ";
                    statement += "FROM " + strTableName + " ";
                    statement += "WHERE fstrBatchID = '" + kestrBatchId + "' AND ";
                    statement += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                    statement += "flngSequence = '" + kelngSequence + "' AND ";
                    statement += "fstrTaxForm = '" + kestrFormName + "'";
                    if (ViewState["isMultiPage"] != null)
                    {
                        if (((HiddenField)Master.FindControl("hidmvImgSrc")).Value == "MAVRO")
                            statement += " AND fstrMPDLN = '" + kestrDocNumber.ToString() + " - " + kestrImagePath + "';";
                        else
                            statement += " AND fstrMPDLN = '" + kestrImagePath + "';";
                    }
                    gc.DoSelect(statement);
                    int q = gc.ReadSelect(out repeatNums);
                    // need to know if we need to enter another empty row

                    foreach (DataRow row in repeatNums.Rows)
                    {
                        // if we have a 'not filled' reset the needEmpty flag, we don't need an empty row if we alredy have one
                        if (row["fblnFilled"].ToString() == "0")
                        {
                            loopBound = 0;
                            // this is used below to determine if we need an empty row to fill
                            allRowsFilled = false;
                        }
                        // keep track of the max, not necessarily the same as the number of rows
                        if (int.Parse(row["flngRepNum"].ToString()) > maxFlngRepNum)
                            maxFlngRepNum = int.Parse(row["flngRepNum"].ToString());
                    }
                    // if we need an empty, we need a new rep num
                    // this becomes 1, where we start our repeat number, for the pull later
                    if (loopBound != 0)
                        maxFlngRepNum++;
                }

                // Now Get the Controls ready for Entry
                string btnSubID = btnSub.ClientID;

                // on PIT the number of generated lines is done by exemptions number, on everything else go next to the 'more' button
                // for 2014, the PIT-CR page is now a simple list of credits, filled as the tax payer needs, so we need the more button back on this PIT form
                if (repeatOffset != -1 && (strTableName != "tblPitS")) 
                    btnSubID = ((Button)((Forms)Master).FindControl("repeaterBTN")).ClientID;

                // markers either removed or replaced with offsets as needed
                string moveOffsetM = "";
                string moveOffsetI = "";
                string moveOffsetC = "";
                string inputClass = "";
                string alignName = "";
                string rowOffset = "";
                if (repeatOffset != -1)
                {
                    moveOffsetM = "~@M@~";
                    moveOffsetI = "~@I@~";
                    moveOffsetC = "~@C@~";
                    inputClass = "~@IC@~";
                    alignName = "~@AL@~";
                    rowOffset = "~@RO@~";
                }
                // get the controls, scroll, and zoom
                StringBuilder controlString = ((Forms)Master).GetControlsTable(gc, btnSubID, chID, moveOffsetM, moveOffsetI, moveOffsetC, inputClass, (repeatOffset != -1 ? 7 : 7), alignName, rowOffset);
                string finalControls = "";
                //@#@# this might need to move, to handle auto scripts on repeater pages
                //@#@# this links the functions to the main control names, but the repeater pages add an index to the names
                //@#@# so we need this function to also attach indices, if needed, and only as many as needed
                //@#@# long maxScrl = ( (forms)Master ).registerAutoJavaScripts( gc, chID );
                //@#@# ( (forms)Master ).setZoomFactor( chID, ( (Image)( (forms)Master ).FindControl( "imgImage" ) ).ClientID, gc );
                //@#@# moved to after the value set loop, in the control building loop
                //@#@# approx lines 1612

                //@#@#@#
                // if this is a repeater, otherwise leave the loop bound at 1, from above
                if (repeatOffset != -1)
                {
                    // how do we know how many repeater rows we need?
                    // it should already be in dummyMineHID
                    // all these have +1 for an extra entry, if needed
                    // if not needed, it won't get filled, and then will be cleaned up in the last doUpdate
                    // if needed, they will have to click there and enter
                    // then the more button will enter one more empty row to be filled
                    if (((HiddenField)((Forms)Master).FindControl("dummyMineHID")).Value != "" && (strTableName == "tblPitS"))
                    {
                        int filingStatusMod = 1;
                        // the pit dependents also needs the filing status, see PutValInfo.xlsx in the notes folder for the dummy HID control where this is stored
                        //** currently in dummy0HID **
                        // don't change that value!
                        // if they are filing joint, subtract 2, else subtract 1
                        // if the exemption number is greater than 5, then do this
                        if (((HiddenField)((Forms)Master).FindControl("dummy0HID")).Value == "2")
                            filingStatusMod = 2;
                        // the number of dependents = exemption number - mod number
                        int dependentNum = int.Parse(((HiddenField)((Forms)Master).FindControl("dummyMineHID")).Value) - filingStatusMod;

                        // if the table is tblPitS and the block is 2, we have at most 5
                        // if they want less than 5, just do that number
                        // if they want more than 5, just do 5
                        if (strTableName == "tblPitS" && kelngBlock == "2")
                            loopBound = Math.Min(dependentNum, 5);
                        // if the table is tblPitS and the block is 1, we already had 5 on front page, so use 5 less
                        else if (strTableName == "tblPitS" && kelngBlock == "1")
                            loopBound = dependentNum - 5;

                        // for the extra entry row, if needed
                        // they don't want this
                        //@#@# might want this only on one of the pages above
                        // this is becoming a not-so-generic KFI, sigh... users
                        //@#@# loopBound += 1;

                        // limit by zero
                        loopBound = Math.Max(loopBound, 0);
                    }
                    // if the number isn't there, and we have a selected number from above
                    else if (repeatNums.Rows.Count != 0)
                    {
                        loopBound = repeatNums.Rows.Count;
                    }
                    // if neither of those are there, enter nothing
                    else
                    {
                        loopBound = 0;
                    }
                    // now, if the bound is equal to the amount of rows we already have, and all those rows are filled, add one more
                    // on PIT only key the number of exemptions, no more
                    // for 2014, we need the extra row on the PIT-CR
                    if (loopBound == repeatNums.Rows.Count && allRowsFilled && (strTableName != "tblPitS" ))
                        loopBound++;
                }
                //@#@#@#

                // Get first Entry Item so Focus can be set on it
                // unless a label, then get the next one
                i = 0;
                while (i < numRows && ctrlDT.Rows[i]["fstrInputId"].ToString().Substring(0, 3) == "lbl")
                { i++; }
                keFocus = ctrlDT.Rows[i]["fstrInputId"].ToString();
                if (i < numRows)
                    keFocus2nd = ctrlDT.Rows[i + 1]["fstrInputId"].ToString();

                // if we have a repeater table, we need to loop the value gathering part
                // so set up limits to a generic loop around it
                int useRepNum = 0;
                long maxScrl = 0;
                //@#@#@# for( int lt = 0; lt < repeatNums.Rows.Count + loopBound; lt++ )
                for (int lt = 0; lt < loopBound; lt++)
                {
                    // init this here
                    // it will either simply be a string of the values in the database
                    // or a delimited list of values in repeater rows, rows separated by '^'
                    if (repeatOffset != -1)
                        keRecOld += "^";
                    else
                        keRecOld = "";


                    // based on if repeater and what repetition, set the repNum
                    if (repeatOffset != -1)
                    {
                        useRepNum = lt;
                    }

                    // Set up Select to Read Data Table for Values (numRows > 0 => we have controls)
                    if (numRows > 0)
                    {
                        // clear the required list first
                        requiredNamesHID.Value = "";

                        //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
                        //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
                        //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
                        //@#@# HERE IT BREAKS!! Sets the table name to the next table, even though we are stuck on the page before
                        //@#@# breaks if the user is going too fast
                        //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
                        //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
                        //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

                        // add identifier for repeater rows, if not PIT this will get set to the highest repeater row needed, the new one
                        if (repeatOffset != -1)
                        {
                            if (!int.TryParse(keFocus.Substring(keFocus.Length - 1), out int q))
                                keFocus += useRepNum.ToString();
                            // already has a number, replace it
                            // for 2014, the PIT-CR forms need the extra row
                            // else if (kestrTaxProgram != "PIT" || (kestrTaxProgram == "PIT" && kestrFormName.IndexOf("CR") != -1))
                            else if (strTableName != "tblPitS")
                            {
                                // we need to accomodate multiple digits
                                // we need to replace the old number, which is useRepNum - 1
                                // but we can't just do a replace, because the name might contain that number
                                // so cut off the length of the old useRepNum
                                keFocus = keFocus.Substring(0, keFocus.Length - (useRepNum - 1).ToString().Length) + useRepNum.ToString();
                            }
                        }
                        Session["keFocus"] = keFocus;
                        ViewState["strTableName"] = strTableName;
                        hidTableName.Value = strTableName;

                        statement2 = "SELECT ";
                        // Clear Fields to Start
                        ((HiddenField)Master.FindControl("hidTouchName")).Value = "";
                        ((HiddenField)Master.FindControl("hidSavFoc")).Value = "";
                        foreach (DataRow row in ctrlDT.Rows)
                        {
                            // if required, add it's name to the list
                            if (row["fblnRequired"].ToString() == "1")
                                requiredNamesHID.Value += row["fstrInputId"].ToString() + ";";

                            // if no column, it's a spacer control
                            if (row["fstrColumn"].ToString() == "")
                                continue;

                            // for possible postmark skipping, save the previous control, and the move to next control, stop on reaching postmark
                            if (!havePostmark)
                            {
                                // save the name of the next control
                                nextCtrl = row["fstrNextCtrl"].ToString();
                                if (row["fstrInputId"].ToString() == "txtPostMarkDate")
                                    havePostmark = true;
                            }
                            // OVER 9000!
                            if (row["fstrColumn"].ToString().Substring(0, 4) == "fdtm")
                                // taking this out because GenTax users are used to seeing the 9999 year meaining no date
                                // 20131115 - revert, keyers are apparently not GenTax users, putting this back in
                                statement2 += "CASE WHEN YEAR( " + row["fstrColumn"].ToString() + " ) > 9000 THEN '' ELSE CONVERT( VARCHAR(10), " + row["fstrColumn"].ToString() + ", 101 ) END AS " + row["fstrColumn"].ToString() + ", ";
                            else if (row["fstrColumn"].ToString().Substring(0, 4) == "fcur")
                                statement2 += "CONVERT( VARCHAR(25), " + row["fstrColumn"].ToString() + ", 0 ) AS " + row["fstrColumn"].ToString() + ", ";
                            else
                                statement2 += "LTRIM( RTRIM( " + row["fstrColumn"].ToString() + " ) ) AS " + row["fstrColumn"].ToString() + ", ";
                        }
                        statement2 = statement2.Substring(0, statement2.Length - 2);
                        statement2 += " FROM " + strTableName + " ";
                        statement2 += "WHERE fstrBatchId = '" + kestrBatchId + "' AND ";
                        statement2 += "CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + kedtmBatchDate + "' AND ";
                        statement2 += "flngSequence = '" + kelngSequence + "'";

                        // if this is a repeater, limit by the repeat number
                        if (repeatOffset != -1)
                        {
                            statement2 += " AND flngRepNum = " + useRepNum.ToString();
                            statement2 += " AND fstrTaxForm = '" + kestrFormName + "'";
                        }
                        // if a multi page, get the right DLN for this image
                        if (ViewState["isMultiPage"] != null)
                        {
                            if (((HiddenField)Master.FindControl("hidmvImgSrc")).Value == "MAVRO")
                                statement2 += " AND fstrMPDLN = '" + kestrDocNumber.ToString() + " - " + Session["kestrImagePath"].ToString() + "'";
                            else
                                statement2 += " AND fstrMPDLN = '" + Session["kestrImagePath"].ToString() + "'";
                        }

                        // Open Data values from the form data table
                        // if no controls, we won't have the select statement for the values
                        // no controls, no data, don't select
                        gc.DoSelect(statement2);
                        valDT = new DataTable();
                        numRows = gc.ReadSelect(out valDT);

                        // if Record Does Not Exist - Create it
                        //@#@# if batch is open
                        if (mfstrStatus == "O")
                        {
                            // if this batch is open, and there were already values selected above
                            // mark the required items as touched
                            // presumably if this form was already submitted, the required items have already been entered
                            if (numRows != 0)
                            {
                                hldTouch = requiredNamesHID.Value.Split(';');
                                wrkTouch = "";
                                if (hldTouch.Length > 1)
                                {
                                    for (i = 0; i < hldTouch.Length - 1; i++)
                                    {
                                        wrkTouch += hldTouch[i] + "Touched;";
                                    }
                                    ((HiddenField)Master.FindControl("hidTouchName")).Value = wrkTouch;
                                }
                                    // register a startup script to change all the 'Touched' elements to value of '1'
                                    string touchedReset = "$(document).ready(function(){$('[id$=\"Touched\"]').each(function(){$(this).val(\"1\");});});";
                                if (!Page.ClientScript.IsStartupScriptRegistered("touchedReset"))
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "touchedReset", touchedReset, true);
                            }

                            if (numRows == 0)
                            {
                                statement = "INSERT INTO " + strTableName;
                                statement += " ( fstrBatchId, fdtmBatchDate, flngSequence";
                                // extra for repeater or multi-page forms
                                if (repeatOffset != -1)
                                    statement += ", flngRepNum, fstrTaxForm";
                                if (ViewState["isMultiPage"] != null)
                                    statement += ", fstrMPDLN";
                                if (isTimely && havePostmark)
                                    statement += ", fdtmPostMarkDate";
                                statement += " ) ";
                                statement += " VALUES ( '" + kestrBatchId + "', '";
                                statement += kedtmBatchDate + "', '";
                                statement += kelngSequence + "'";
                                if (repeatOffset != -1)
                                    statement += ", " + useRepNum.ToString() + ", '" + kestrFormName + "' ";
                                if (ViewState["isMultiPage"] != null)
                                {
                                    if (((HiddenField)Master.FindControl("hidmvImgSrc")).Value == "MAVRO")
                                        statement += ", '" + kestrDocNumber.ToString() + " - " + Session["kestrImagePath"].ToString() + "'";
                                    else
                                        statement += ", '" + Session["kestrImagePath"].ToString() + "'";
                                }
                                // trying the image path here, instead of the possibly duplicated DLN
                                if (isTimely && havePostmark)
                                    statement += ", '" + postMarkDate + "'";

                                statement += " )";
                                gc.DoExecute(statement);

                                // Read Record Back ( for default values ) kSqlSelect built above
                                gc.DoSelect(statement2);
                                valDT = new DataTable();
                                numRows = gc.ReadSelect(out valDT);
                            }
                            // if it does exist, fill in the postmark, if needed
                            else if (isTimely && havePostmark)
                            {
                                statement = "UPDATE " + strTableName;
                                statement += " SET fdtmPostMarkDate = '" + postMarkDate + "'";
                                statement += " WHERE " + statement2.Substring(statement2.IndexOf("WHERE fstrBatchId") + 6);
                                gc.DoExecute(statement);

                                // Read Record Back ( for default values ) kSqlSelect built above
                                gc.DoSelect(statement2);
                                valDT = new DataTable();
                                numRows = gc.ReadSelect(out valDT);
                            }
                        }
                    }

                    // put controls in here, just leave as HTML controls, and the javascript can
                    // handle everything from the events and scripts in the database
                    // controlsLIT
                    // String manipulation into html 
                    // in creation of html table, if this is a repeater table, we need to know which control goes with which flngRepNum
                    // so in replace of names for values, also replace the actual name with the addition of flngRepNum
                    // then all controls get the right values, and are referenced correctly
                    // it will be unstrung in the doUpdate, when needed
                    string ctrlBuff = controlString.ToString();
                    string firstCtrl = "";
                    if (numRows > 0)
                    {
                        // Set the Values from Data Table for this Block
                        for (i = 0; i < valDT.Columns.Count; i++)
                        {
                            // guessing there is only one row here ??
                            if (valDT.Columns[i].ColumnName.Substring(0, 4) == "fbln")
                            {
                                if (valDT.Rows[0][i].ToString() == "0")
                                {
                                    ctrlBuff = ctrlBuff.Replace("~" + valDT.Columns[i].ColumnName + "~", "0");
                                    keRecOld += "0";
                                }
                                else
                                {
                                    ctrlBuff = ctrlBuff.Replace("~" + valDT.Columns[i].ColumnName + "~\"", "1\" checked=true");
                                    keRecOld += "1";
                                }
                            }
                            else
                            {
                                //@#@# this throws off the od vs new value check in doUpdate, but it makes for a weird display, will need to ask if we want to replace this or not
                                //@#@# for now don't, to see if it all works
                                //@#@# ctrlBuff = ctrlBuff.Replace( "~" + valDT.Columns[ i ].ColumnName + "~", valDT.Rows[ 0 ][ i ].ToString().Replace( ".0000", "" ) );
                                string s = valDT.Rows[0][i].ToString().Trim();
                                if (s.Substring((s.Length > 3 ? s.Length - 3 : 0)) == ".00")  
                                    s = s.Replace(".00", "");
                                if (strKeepDec == "N" && valDT.Columns[i].ColumnName.Substring(0, 4) == "fcur")
                                { 
                                    string k = valDT.Rows[0][i].ToString().Trim();
                                    k = k.Replace(".00", "");
                                    keRecOld += k; 
                                }
                                else
                                    keRecOld += valDT.Rows[0][i].ToString();

                                // if a date, clear the "no date" value
                                if (valDT.Columns[i].ColumnName.Substring(0, 4) == "fdtm")
                                    s = s.Replace("12/31/9999", "");
                                ctrlBuff = ctrlBuff.Replace("~" + valDT.Columns[i].ColumnName + "~", s);
                             //   keRecOld += valDT.Rows[0][i].ToString();
                            }
                            // also replace the name if needed
                            if (repeatOffset != -1)
                            {
                                // loop over the ctrlDT to find the control name for this column
                                foreach (DataRow row in ctrlDT.Rows)
                                {
                                    if (row["fstrColumn"].ToString() == valDT.Columns[i].ColumnName)
                                    {
                                        ctrlBuff = ctrlBuff.Replace(row["fstrInputId"].ToString(), row["fstrInputId"].ToString() + useRepNum.ToString());
                                        // save the first control name, will be used for continuous flow across rows
                                        if (firstCtrl == "")
                                            firstCtrl = row["fstrInputId"].ToString();
                                    }
                                }
                            }
                        }

                        // if this is a repeter, replace the marker string
                        // also replace the table name, need unique IDs
                        if (repeatOffset != -1)
                        {

                            // save the size of the table, then on the next rows, simply move down a talbe height and subtract the offset ??

                            ctrlBuff = ctrlBuff.Replace("~@markerRow@~", "<tr><td colspan=\"2\" style=\"background-color: lightgray;\">Row " + (useRepNum + 1 + headerStartNum).ToString() + "</td></tr>");
                            ctrlBuff = ctrlBuff.Replace("tableCtrl", "tableCtrl" + useRepNum.ToString());
                            ctrlBuff = ctrlBuff.Replace("~@TB@~", lngRepTopBot.ToString());
                            if (useRepNum > 0)
                                ctrlBuff = ctrlBuff.Replace("~@TI@~", useRepNum.ToString());
                            else
                                ctrlBuff = ctrlBuff.Replace("~@TI@~", "");
                            // with jQuery, we can find the locations of everything
                            // first make the sizer div big enough
                            // only once, only one control div
                            if (!Page.ClientScript.IsStartupScriptRegistered("sizerDiv") )
                            {
                                string sizerDiv = "$('#ctrlSizer').height($('#tableCtrl0').height()*($('[id*=\"tableCtrl\"]').length+1));\n$('#divControls').scrollTop($('#tableCtrl0').height()*$('[id*=\"tableCtrl\"]').length);";
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "sizerDiv", sizerDiv, true);
                            }

                            // and clear out the placeholders
                            // keep the marker offset, to get to the right place on the image
                            // putting this in the onfocus causes weird behaviour
                            // it's moving based on the last known position of the marker, not a simple contant offset for this row
                            // how do we get a constant offset to use for this row alone
                            // again something in the on focus for the first control
                            // is there something that occurs before the onfocus?
                            // don't do this on the first one
                            if (useRepNum == 0)
                            {
                                ctrlBuff = ctrlBuff.Replace(moveOffsetM, "+foomZactor*(" + (useRepNum * repeatOffset).ToString() + ")");
                                // image has no movement, but the registered function above should work
                                ctrlBuff = ctrlBuff.Replace(moveOffsetI, "");
                                // again, registered script above should take care of the contorl scrolling
                                ctrlBuff = ctrlBuff.Replace(moveOffsetC, "");
                                // first one has no class
                                ctrlBuff = ctrlBuff.Replace(inputClass, "");
                                // no need to align the top row, it's at the top
                                ctrlBuff = ctrlBuff.Replace(alignName, "");
                                // first row, no row offset
                                ctrlBuff = ctrlBuff.Replace(rowOffset, "");
                            }
                            else
                            {
                                ctrlBuff = ctrlBuff.Replace(moveOffsetM, "+foomZactor*(" + (useRepNum * repeatOffset).ToString() + ")");
                                // image has no movement, but the registered function above should work
                                ctrlBuff = ctrlBuff.Replace(moveOffsetI, "");
                                // again, registered script above should take care of the contorl scrolling
                                ctrlBuff = ctrlBuff.Replace(moveOffsetC, "");
                                // the rest get alignme class
                                ctrlBuff = ctrlBuff.Replace(inputClass, "alignme" + useRepNum.ToString());
                                // we need to align to the top of this data row
                                ctrlBuff = ctrlBuff.Replace(alignName, ",'tableCtrl" + useRepNum.ToString() + "'");
                                // this gets put in the call to moveStuff, send this rows offset down the image
                                // as opposed to adding to the value passed to moveStuff
                                ctrlBuff = ctrlBuff.Replace(rowOffset, "," + ((useRepNum) * repeatOffset).ToString());
                            }

                            // based on if repeater and what repetition, set the selNext control
                            // the -1 gives us the final control mapping to the submit button as next
                            // note this is the 'final' control, based on exemption number
                            // the extra row won't get mapped into, and will hve to be clicked, if there are more entries than listed
                            // extra row is gone
                            if (lt < loopBound - 1)
                                ctrlBuff = ctrlBuff.Replace(btnSubID, firstCtrl + (lt + 1).ToString());
                            // also set the auto scripts, they need to be registered with the ID names, set in the value loop above
                            maxScrl = ((Forms)Master).RegisterAutoJavaScripts(gc, chID, useRepNum.ToString());
                            ((Forms)Master).SetZoomFactor(chID, ((Image)((Forms)Master).FindControl("imgImage")).ClientID, gc);
//
//


                            // append to the controls string
                            finalControls += ctrlBuff;
                        }
                        // else just get rid of it
                        else
                        {
                            // register the auto scripts, only once here since we aren't repeating we don't need the ID numbers on the names
                            maxScrl = ((Forms)Master).RegisterAutoJavaScripts(gc, chID);
                            ((Forms)Master).SetZoomFactor(chID, ((Image)((Forms)Master).FindControl("imgImage")).ClientID, gc);
                            // and make the final controls string
                            ctrlBuff = ctrlBuff.Replace("~@TI@~", "");
                            ctrlBuff = ctrlBuff.Replace("~@TB@~", "0");
                            finalControls += ctrlBuff.Replace("~@markerRow@~", "");
                        }

                        // for repeater forms, this is done above
                        if (!Page.ClientScript.IsStartupScriptRegistered("sizerDiv") && repeatOffset == -1)
                        {
                            string sizerDiv = @"$('#ctrlSizer').height( $('#divControls').height() + parseInt( $('#" + ((HiddenField)Master.FindControl("maxScrl")).ClientID + @"').val() ) );";
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "sizerDiv", sizerDiv, true);
                        }
                        if (isTimely)
                        {
                            finalControls = finalControls.Replace("selNext(txtPostMarkDate)", "selNext(" + nextCtrl + ")");
                        }
                        // lastly, replace any "no column" values
                        finalControls = finalControls.Replace("~~", "");

                        // save the current values, for comparison later
                        hidRec.Value = keRecOld;
                    }

                }	// end loop for repeater if needed
                // finally put the controls table into the display literal
                ((Literal)Master.FindControl("controlsLIT")).Text = finalControls;
                // set maxScrl
                ((HiddenField)Master.FindControl("maxScrl")).Value = maxScrl.ToString();

                // Set LandScape

                statement = "SELECT STR(fblnLand,1) As strLand ";
                statement += "FROM rfrControlHeaders ";
                statement += "WHERE idControlHeaders = " + chID + ";";
                string strLand = gc.DoScalar(statement).ToString();

                ((HiddenField)Master.FindControl("hidLand")).Value = strLand.ToString();

                // fill these with header information
                // batchIDTXT		from kestrBatchId
                batchIDTXT.Text = kestrBatchId;
                // batchDateTXT		from kedtmBatchDate
                batchDateTXT.Text = kedtmBatchDate;
                // itemNoTXT		from kelngSequence
                itemNoTXT.Text = kelngSequence;
                // titleLBL			from kestrTitle
                Titletxt.Text = kestrTitle;
                Blocktxt.Text = kelngBlock;

                ImgSrctxt.Text = ((HiddenField)Master.FindControl("hidmvImgSrc")).Value;
                DocNbrtxt.Text = ((HiddenField)Master.FindControl("hidmvDocNbr")).Value;
                Offsettxt.Text = ((HiddenField)Master.FindControl("hidmvOffset")).Value;
                Sizetxt.Text = ((HiddenField)Master.FindControl("hidmvSize")).Value;
                ((HiddenField)Master.FindControl("hidmvBatchId")).Value = kestrBatchId;
                ((HiddenField)Master.FindControl("hidmvBatchDate")).Value = kedtmBatchDate;
                ((HiddenField)Master.FindControl("hidmvSequence")).Value = kelngSequence;
                ((HiddenField)Master.FindControl("hidmvTaxPgm")).Value = taxProgHID.Value;


                // before we leave, save this info in the ViewState for the postback
                ViewState["Batch"] = kestrBatchId;
                ViewState["BatchDate"] = kedtmBatchDate;
                ViewState["ImageSource"] = kestrSource;
                ViewState["Sequence"] = kelngSequence;
                ViewState["DLN"] = kestrDLN;
                ViewState["DocNumber"] = kestrDocNumber;
                ViewState["Title"] = kestrTitle;
                ViewState["Block"] = kelngBlock;
                ViewState["TaxProgram"] = kestrTaxProgram;
                ViewState["FormName"] = kestrFormName;
                ViewState["FileType"] = kestrFileType;
                //@#@# save batch state
                ViewState["fstrBatchStatus"] = mfstrStatus;
                // save the tax year for checking later
                hidYYear.Value = kelngTaxYear;


                // if there was no loop, there were no controls, so just doUpdate to get to the next form
                if (loopBound == 0)
                {
                    gc.Disconnect();
                    // turn off the repeater flag, so we don't try to update the wrong table
                    ViewState["repeatOffset"] = -1;
                    DoUpdate(true);
                    // and leave, nothing more to see here
                    return;
                }

                gc.Disconnect();
            }
            catch (ThreadAbortException tex)
            {
                object kkex = tex;
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

            // check if the batch is timely, and if the first control is the postmark date (txtPostMarkDate)
            // if so, start on the next control
            if (isTimely && keFocus == "txtPostMarkDate")
                ((HiddenField)Master.FindControl("keFocusHID")).Value = keFocus2nd;
            else
                ((HiddenField)Master.FindControl("keFocusHID")).Value = keFocus;
            

        }

        private bool TryLoad()
		{
 			try
			{
				FileStream fs = new FileStream( Session[ "kestrImagePath" ].ToString(), FileMode.Open, FileAccess.Read );
				BinaryReader reader = new BinaryReader( fs );

                int lngSize = (Int32)fs.Length;

                if (Convert.ToString(Session["mvImgSrc"]) == "MAVRO")
                {
                    fs.Position = Convert.ToInt32(Session["mvOffset"]);
                    lngSize = Convert.ToInt32(Session["mvSize"]);
                }

                Byte[] img = reader.ReadBytes(lngSize);

				reader.Close();
//				fs.Close();
				return true;
			}
            catch (Exception)
            {
                return false;
			}

		}
    }
}
