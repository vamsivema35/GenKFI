using GenKFI.Properties;
using System;
using System.Data;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class UtilDev : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            #region common load code

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            //@#@# common code on all pages
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

            DataTable dt = new DataTable();
            int numRows = 0;

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            // this is the only thing that changes across pages
            string strCurrPage = "DEV Utility";
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

            if (!IsPostBack)
            {
                GoodConn gc = new GoodConn();

                string strSQL = "";

                // same connection for all the select below
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                    // fill Tax Program 
                    strSQL = "SELECT progCode ";
                    strSQL += "FROM progCodes ";
                    strSQL += "WHERE removed = 0 ";
                    strSQL += "Order by progCode ";

                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    DdTaxPgm.Items.Clear();
                    DdTaxPgm.Items.Add(new ListItem(" ", "-1"));
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            DdTaxPgm.Items.Add(new ListItem(row["progCode"].ToString()));
                        }
                    }
                }
                catch (Exception ex)
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();
                }

                DdTaxPgm.Focus();

            }
        }
        protected void OnClick_ClearChoice(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            string strSQL = "";
            int numRows = 0;
            string strFormPick = "";
            OpStatus.Text = "";

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                // fill Tax Program 
                strSQL = "SELECT progCode ";
                strSQL += "FROM progCodes ";
                strSQL += "WHERE removed = 0 ";
                strSQL += "Order by progCode ";

                gc.DoSelect(strSQL);
                numRows = gc.ReadSelect(out dt);
                DdTaxPgm.Items.Clear();
                DdTaxPgm.Items.Add(new ListItem(" ", "-1"));
                if (numRows > 0)
                {
                    foreach (DataRow row in dt.Rows)
                    {
                        DdTaxPgm.Items.Add(new ListItem(row["progCode"].ToString()));
                    }
                }

                Line1.Text = "";
                Line2.Text = "";
                Line3.Text = "";
                Line4.Text = "";
                Line5.Text = "";
                Line6.Text = "";
                Line7.Text = "";

                BatchId.Text = "";
                BatchDate.Text = "";
                SeqNbr.Text = "";
                ImgTable.Text = "";
                RecTable.Text = "";
                TaxYear.Text = "";
                ImgSrctxt.Text = "";
                Positiontxt.Text = "";
                Cameratxt.Text = "";
                Formnametxt.Text = "";
                strFormPick = "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">";
                strFormPick += "</table>";
                controlsLIT.Text = strFormPick;
                //UdImage.ImageUrl = "";

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

            DdTaxPgm.Focus();

        }
        protected void OnClick_Sql(object sender, EventArgs e)
        {
            string strSQL = "";
            GoodConn gc = new GoodConn();
            OpStatus.Text = "";

            try
            {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                // Run
                strSQL =  Line1.Text + " ";
                strSQL += Line2.Text + " ";
                strSQL += Line3.Text + " ";
                strSQL += Line4.Text + " ";
                strSQL += Line5.Text + " ";
                strSQL += Line6.Text + " ";
                strSQL += Line7.Text + ";";
                gc.DoExecute(strSQL);
                gc.Disconnect();
                OpStatus.Text = "Sql Complete";

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }
        protected void OnClick_UpdRec(object sender, EventArgs e)
        {
            // Mark Batch Deleted
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            int numRows = 0;
            string strSQL = "";
            string strSQL2 = "";
            OpStatus.Text = "";
            string sBuff1 = "";

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                // Get Form to Update
                strSQL = "SELECT c.name, c.max_length FROM sys.columns c ";
                strSQL += "INNER JOIN sys.objects t ON ";
                strSQL += "(c.[object_id] = t.[object_id] ";
                strSQL += "AND t.[name] = '" + RecTable.Text + "') ";
                strSQL += "WHERE c.is_identity = 0; ";
                gc.DoSelect(strSQL);
                DataTable dn = new DataTable();
                numRows = gc.ReadSelect(out dn);
                strSQL2 = "UPDATE " + RecTable.Text + " SET ";
                foreach (DataRow nrow in dn.Rows)
                {
                    if ((nrow["name"].ToString() != "fstrBatchId") && (nrow["name"].ToString() != "fdtmBatchDate") && (nrow["name"].ToString() != "flngSequence"))
                    {
                        strSQL2 += nrow["name"].ToString() + " = ";
                        sBuff1 = nrow["name"].ToString().Trim();      // Get Field Name
                        sBuff1 = Request.Form[sBuff1]; // + repNum];             // Get Field Value
                                                                            // extra checks for checkboxes, if the checkbox is checked, it's name is there and value is 1, if it's not checked, it's not included in Request.Form
                        if (nrow["name"].ToString().Substring(0, 4) == "fbln")
                        {
                            if (Request.Form[nrow["name"].ToString()] == null)
                                sBuff1 = "0";
                            else
                                // if this is a checkbox, and it exists in the .Form, it's value will be '1'
                                // if this isn't a checkbox, but it's related to a fbln column, it's value will be '0' or '1'
                                sBuff1 = Request.Form[nrow["name"].ToString()];
                        }
                        else
                        {
                            // Remove Single Quotes from all except boolean
                            sBuff1 = sBuff1.Replace("'", "");
                            // Remove Commas from currency
                            if (nrow["name"].ToString().Substring(0, 4) == "fcur")
                            {
                                sBuff1 = sBuff1.Replace(",", "");
                            }
                            // Remove Commas from integer
                            if (nrow["name"].ToString().Substring(0, 4) == "fint")
                                sBuff1 = sBuff1.Replace(",", "");
                            // Remove Commas from long
                            if (nrow["name"].ToString().Substring(0, 4) == "flng")
                                sBuff1 = sBuff1.Replace(",", "");
                            // Remove dashes if string and not a CR form and not fstrAcctType 
                                if (nrow["name"].ToString() != "fstrAcctType")
                                {
                                    if (nrow["name"].ToString().Substring(0, 4) == "fstr")
                                        sBuff1 = sBuff1.Replace("-", "");
                                }
                            if (nrow["name"].ToString().Substring(0, 4) == "fdtm")
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
                        if (UtilClass.Sanitize(sBuff1).Length > int.Parse(nrow["max_length"].ToString()) && nrow["name"].ToString().Substring(0, 4) == "fstr")
                            sBuff1 = sBuff1.Substring(0, int.Parse(nrow["max_length"].ToString()));

                        // if the value is blank, and it should be a number (not bool, currency, string, or date), use zero
                        if (UtilClass.Sanitize(sBuff1).Length == 0 &&
                            nrow["name"].ToString().Substring(0, 4) != "fbln" &&
                            nrow["name"].ToString().Substring(0, 4) != "fstr" &&
                            nrow["name"].ToString().Substring(0, 4) != "fdtm")
                        {
                            if (nrow["name"].ToString().Substring(0, 4) == "fcur")
                                sBuff1 = "0";
                        }
                        // if keep Decimal then 0.00
                        // updateStatement += row["fstrColumn"].ToString() + " = '" + UtilClass.Sanitize(sBuff1) + "', ";
                        strSQL2 += "'" + UtilClass.Sanitize(sBuff1) + "', ";

                    }
                }
                strSQL2 = strSQL2.Substring(0, strSQL2.Length - 2) + " ";
                strSQL2 += "WHERE fstrBatchID = '" + BatchId.Text + "' ";
                strSQL2 += "AND CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) = '" + BatchDate.Text + "' ";
                strSQL2 += "AND flngSequence = '" + SeqNbr.Text + "';";
                gc.DoExecute(strSQL2);

                OpStatus.Text = "Updated Batch '" + BatchId.Text + "' Seq '" + SeqNbr.Text + "'";
                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnClick_ClearForm(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();

            string strSQL = "";
            int numRows = 0;
            DataTable dt = new DataTable();
            string strFormPick = "";
            OpStatus.Text = "";
            string strFormName = "";
            string strDLN = "";

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                // Get Current Form Name before Clearing

                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrFormName, ";
                strSQL += "fstrDLN, ";
                strSQL += "flngPosInBatch, ";
                strSQL += "flngCamera, ";
                strSQL += "fstrFormCode, ";
                strSQL += "fblnImageBlankSizeCheck, ";
                strSQL += "fstrImgSrc ";
                strSQL += "FROM " + ImgTable.Text + " ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                strSQL += "ORDER BY flngPosInBatch, flngCamera ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    strFormName = dt.Rows[0]["fstrFormName"].ToString();
                    strDLN = dt.Rows[0]["fstrDLN"].ToString();
                }



                strSQL = "UPDATE " + ImgTable.Text + " ";
                strSQL += "SET fstrFormName = ' ' ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                gc.DoExecute(strSQL);

                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrFormName, ";
                strSQL += "fstrDLN, ";
                strSQL += "flngPosInBatch, ";
                strSQL += "flngCamera, ";
                strSQL += "fstrFormCode, ";
                strSQL += "fblnImageBlankSizeCheck, ";
                strSQL += "fstrImgSrc ";
                strSQL += "FROM " + ImgTable.Text + "' ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "ORDER BY flngPosInBatch, flngCamera ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    // Load Possible Form Names for Batch
                    ImgSrctxt.Text = dt.Rows[0]["fstrImgSrc"].ToString();

                    strFormPick = "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">";
                    strFormPick += "<tr style=\"background: lime;\">";
                    strFormPick += "<td> FormName </td>";
                    strFormPick += "<td> DLN </td>";
                    strFormPick += "<td> Position </td>";
                    strFormPick += "<td> Camera </td>";
                    strFormPick += "<td> FormCode </td>";
                    strFormPick += "<td> Blank </td>";
                    strFormPick += "</tr>";

                    foreach (DataRow row in dt.Rows)
                    {
                        strFormPick += "<tr @@@ >";
                        strFormPick += "<td>" + row["fstrFormName"] + "   </td>";
                        strFormPick += "<td>" + row["fstrDLN"] + "   </td>";
                        strFormPick += "<td>" + row["flngPosInBatch"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["flngCamera"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["fstrFormCode"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["fblnImageBlankSizeCheck"].ToString() + "   </td>";
                        strFormPick += "</tr>";
                        if ((row["flngPosinBatch"].ToString() == Positiontxt.Text) && (row["flngCamera"].ToString() == Cameratxt.Text))
                        {
                            strFormPick = strFormPick.Replace("@@@", "style=\"background: olive;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
                        }
                        else
                        {
                            strFormPick = strFormPick.Replace("@@@", "style=\"background: aqua;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
                        }
                    }
                    strFormPick += "</table>";
                    controlsLIT.Text = strFormPick;
                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }


        }
        protected void OnClick_pickForm(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();

            string strSQL = "";
            int numRows = 0;
            DataTable dt = new DataTable();
            string strFormPick = "";
            OpStatus.Text = "";
            //            string strFormName = "";
            //            string strDLN = "";
            Formnametxt.Text = hidFormName.Value.ToString();

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif


                strSQL = "UPDATE " + ImgTable.Text + " ";
                strSQL += "SET fstrFormName = '" + hidFormName.Value + "' ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                gc.DoExecute(strSQL);



                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrFormName, ";
                strSQL += "fstrDLN, ";
                strSQL += "flngPosInBatch, ";
                strSQL += "flngCamera, ";
                strSQL += "fstrFormCode, ";
                strSQL += "fblnImageBlankSizeCheck, ";
                strSQL += "fstrImgSrc ";
                strSQL += "FROM " + ImgTable.Text + " ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "ORDER BY flngPosInBatch, flngCamera ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    // Load Possible Form Names for Batch
                    ImgSrctxt.Text = dt.Rows[0]["fstrImgSrc"].ToString();

                    strFormPick = "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">";
                    strFormPick += "<tr style=\"background: lime;\">";
                    strFormPick += "<td> FormName </td>";
                    strFormPick += "<td> DLN </td>";
                    strFormPick += "<td> Position </td>";
                    strFormPick += "<td> Camera </td>";
                    strFormPick += "<td> FormCode </td>";
                    strFormPick += "<td> Blank </td>";
                    strFormPick += "</tr>";

                    foreach (DataRow row in dt.Rows)
                    {
                        strFormPick += "<tr @@@ >";
                        strFormPick += "<td>" + row["fstrFormName"] + "   </td>";
                        strFormPick += "<td>" + row["fstrDLN"] + "   </td>";
                        strFormPick += "<td>" + row["flngPosInBatch"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["flngCamera"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["fstrFormCode"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["fblnImageBlankSizeCheck"].ToString() + "   </td>";
                        strFormPick += "</tr>";
                        if ((row["flngPosinBatch"].ToString() == Positiontxt.Text) && (row["flngCamera"].ToString() == Cameratxt.Text))
                        {
                            strFormPick = strFormPick.Replace("@@@", "style=\"background: olive;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
                        }
                        else
                        {
                            strFormPick = strFormPick.Replace("@@@", "style=\"background: aqua;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
                        }
                    }
                    strFormPick += "</table>";
                    controlsLIT.Text = strFormPick;
                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }


        }
        protected void OnClick_showImg(object sender, EventArgs e)
        {
            Positiontxt.Text = hidPosition.Value.ToString();
            Cameratxt.Text = hidCamera.Value.ToString();
            Formnametxt.Text = hidFormName.Value.ToString();
            OpStatus.Text = "";
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            int numRows = 0;
            string strSQL = "";
            string strImgPath = "";
            string strFormPick = "";

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrFormName, ";
                strSQL += "fstrDLN, ";
                strSQL += "flngPosInBatch, ";
                strSQL += "flngCamera, ";
                strSQL += "fstrFormCode, ";
                strSQL += "fblnImageBlankSizeCheck, ";
                strSQL += "fstrImgSrc ";
                strSQL += "FROM " + ImgTable.Text + " ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "ORDER BY flngPosInBatch, flngCamera ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    // Load Possible Form Names for Batch
                    ImgSrctxt.Text = dt.Rows[0]["fstrImgSrc"].ToString();

                    strFormPick = "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">";
                    strFormPick += "<tr style=\"background: lime;\">";
                    strFormPick += "<td> FormName </td>";
                    strFormPick += "<td> DLN </td>";
                    strFormPick += "<td> Position </td>";
                    strFormPick += "<td> Camera </td>";
                    strFormPick += "<td> FormCode </td>";
                    strFormPick += "<td> Blank </td>";
                    strFormPick += "</tr>";

                    foreach (DataRow row in dt.Rows)
                    {
                        strFormPick += "<tr @@@ >";
                        strFormPick += "<td>" + row["fstrFormName"] + "   </td>";
                        strFormPick += "<td>" + row["fstrDLN"] + "   </td>";
                        strFormPick += "<td>" + row["flngPosInBatch"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["flngCamera"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["fstrFormCode"].ToString() + "   </td>";
                        strFormPick += "<td>" + row["fblnImageBlankSizeCheck"].ToString() + "   </td>";
                        strFormPick += "</tr>";
                        if ((row["flngPosinBatch"].ToString() == Positiontxt.Text) && (row["flngCamera"].ToString() == Cameratxt.Text))
                        {
                            strFormPick = strFormPick.Replace("@@@", "style=\"background: olive;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
                        }
                        else
                        {
                            strFormPick = strFormPick.Replace("@@@", "style=\"background: aqua;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
                        }
                    }
                    strFormPick += "</table>";
                    controlsLIT.Text = strFormPick;
                }

                // Get Image Location to Display
                strSQL = "SELECT fstrImagePath ";
                strSQL += "FROM " + ImgTable.Text + " ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    strImgPath = dt.Rows[0]["fstrImagePath"].ToString();
                    try
                    {
                        FileStream fs = new FileStream(strImgPath.ToString(), FileMode.Open, FileAccess.Read);
                        BinaryReader reader = new BinaryReader(fs);

                        int lngSize = (Int32)fs.Length;

                        if (ImgSrctxt.Text == "MAVRO")
                        {
                            fs.Position = Convert.ToInt32(Offsettxt.Text);
                            lngSize = Convert.ToInt32(Sizetxt.Text);
                            Session["mvOffset"] = Offsettxt.Text;
                            Session["mvSize"] = Sizetxt.Text;
                            Session["mvImgSrc"] = ImgSrctxt.Text;
                        }

                        Byte[] img = reader.ReadBytes(lngSize);

                        reader.Close();
                        //				fs.Close();
                        Session["kestrImagePath"] = strImgPath.ToString();
                        //UdImage.ImageUrl = "UdimgLoad.aspx";


                    }
                    catch (Exception ex)
                    {
                        object kkex = ex;
                        //UdImage.ImageUrl = "~/images/imgError.jpg";
                    }

                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_GetRec(object sender, EventArgs e)
        {
            // Mark Batch Deleted
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            int numRows = 0;
            string strFields = "";
            //            string strTable = "";
            string strSQL = "";
            string strSQL2 = "";
            OpStatus.Text = "";

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                // LC - Build Load Control for Record
                strSQL = "SELECT c.name, c.max_length FROM sys.columns c ";
                strSQL += "INNER JOIN sys.objects t ON ";
                strSQL += "(c.[object_id] = t.[object_id] ";
                strSQL += "AND t.[name] = '" + RecTable.Text + "') ";
                strSQL += "WHERE c.is_identity = 0; ";
                gc.DoSelect(strSQL);
                DataTable dn = new DataTable();
                numRows = gc.ReadSelect(out dn);
                strFields = "";
                foreach (DataRow nrow in dn.Rows)
                {
                    if ((nrow["name"].ToString() != "fstrBatchId") && (nrow["name"].ToString() != "fdtmBatchDate") && (nrow["name"].ToString() != "flngSequence"))
                    {
                        strFields += nrow["name"].ToString();
                        strFields += ", ";
                    }
                }
                strFields = strFields.Substring(0, strFields.Length - 2);
                // Get Record
                strSQL = "SELECT " + strFields + " FROM " + RecTable.Text + " ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND fdtmBatchDate = '" + BatchDate.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows == 0)
                {
                    // if no record - create record
                    strSQL2 = "INSERT INTO " + RecTable.Text + " ";
                    strSQL2 += "(fstrBatchId, fdtmBatchDate, flngSequence) ";
                    strSQL2 += "VALUES ('" + BatchId.Text + "', '" + BatchDate.Text + "', '" + SeqNbr.Text + "');";
                    gc.DoExecute(strSQL2);
                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                }
                StringBuilder  ctrlStr = new StringBuilder();
                int intTab = 30;
                //long maxScrl = 0;
                foreach (DataRow nrow in dn.Rows)
                {
                    if ((nrow["name"].ToString() != "fstrBatchId") && (nrow["name"].ToString() != "fdtmBatchDate") && (nrow["name"].ToString() != "flngSequence"))
                    {

                        ctrlStr.Append("<tr>\n");
                        ctrlStr.Append("	<td>\n");
                        ctrlStr.Append("		fstrLabel\n");
                        ctrlStr.Append("	</td>\n");
                        ctrlStr.Append("	<td>\n");
                        ctrlStr.Append("		<input\n");
                        ctrlStr.Append("			id=\"~fstrInputId\"\n");
                        ctrlStr.Append("			name=\"~fstrInputId\"\n");
                        ctrlStr.Append("			tabindex=\"" + "" + intTab.ToString() + "\"");
                        ctrlStr.Append("			type=\"fblnHiddenfstrInputId\"\n");
                        ctrlStr.Append("			maxlength=\"flngMaxLengthmx\"\n");
                        ctrlStr.Append("			style=\"height: 22px;\n");
                        ctrlStr.Append("				width: flngDispLengthpx;\n");
                        ctrlStr.Append("				background-color: rgb(255, 255, 255);\"\n");
                        ctrlStr.Append("			value=\"fstrColumn\">\n");
                        ctrlStr.Append("	</td>\n");
                        ctrlStr.Append("</tr>\n");

                        ctrlStr.Replace("fstrLabel", nrow["name"].ToString());
                        if (nrow["name"].ToString().Substring(0, 4) == "fbln")
                            ctrlStr.Replace("fblnHiddenfstrInputId", "checkbox");
                        else
                            ctrlStr.Replace("fblnHiddenfstrInputId", "text");
                        ctrlStr.Replace("~fstrInputId", nrow["name"].ToString());
                        ctrlStr.Replace("flngMaxLengthmx", nrow["max_length"].ToString());
                        int myWidth = int.Parse(nrow["max_length"].ToString()) * 18;
                        if (myWidth > 252)
                            myWidth = 252;
                        ctrlStr.Replace("flngDispLengthpx", myWidth.ToString() + "px");
                        ctrlStr.Replace("fstrColumn", dt.Rows[0][nrow["name"].ToString()].ToString());
                        intTab = intTab + 1;
                    }
                }
                ctrlStr.Insert(0, "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">");
                ctrlStr.Append("</table>");
                controlsLIT.Text = ctrlStr.ToString();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }
//        protected void OnClick_GetImages(object sender, EventArgs e)
//        {
//            // Get Images for the Batch /Sequence
//            GoodConn gc = new GoodConn();
//            DataTable dt = new DataTable();
//            int numRows = 0;
//            string strBatchTaxPgm = "";
//            string strSQL = "";
//            string strFile1 = "";
//            bool blnUpd = true;
//            string strFormPick = "";
//            OpStatus.Text = "";

//            // same connection for all the select below
//            try
//            {
//#if DEBUG
//                gc.Connect(Resources.connString);
//#else
//					gc.Connect( Resources.prodConnString );
//#endif

//                // Get Batch
//                strSQL = "SELECT fstrTaxProgram, ";
//                strSQL += "fstrFormName, ";
//                strSQL += "fstrDLN, ";
//                strSQL += "flngPosInBatch, ";
//                strSQL += "flngCamera, ";
//                strSQL += "fstrFormCode, ";
//                strSQL += "fblnImageBlankSizeCheck, ";
//                strSQL += "fstrFile, ";
//                strSQL += "fstrImgSrc ";
//                strSQL += "FROM " + ImgTable.Text + " ";
//                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
//                strSQL += "AND fdtmScanDate = '" + BatchDate.Text + "' ";
//                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
//                strSQL += "ORDER BY flngPosInBatch, flngCamera ";

//                gc.DoSelect(strSQL);
//                dt = new DataTable();
//                numRows = gc.ReadSelect(out dt);
//                if (numRows > 0)
//                {
//                    strBatchTaxPgm = dt.Rows[0]["fstrTaxProgram"].ToString();
//                    strFile1 = dt.Rows[0]["fstrFile"].ToString();
//                }
//                if (numRows == 0)
//                {
//                    OpStatus.Text = "Batch/Sequence Not Found";
//                    blnUpd = false;
//                }
//                if (strBatchTaxPgm != DdTaxPgm.Text)
//                {
//                    OpStatus.Text = "Tax Pgm for Batch is '" + strBatchTaxPgm + "'";
//                    blnUpd = false;
//                }
//                if (blnUpd)
//                {
//                    // Load Possible Form Names for Batch
//                    ImgSrctxt.Text = dt.Rows[0]["fstrImgSrc"].ToString();

//                    strFormPick = "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">";
//                    strFormPick += "<tr style=\"background: lime;\">";
//                    strFormPick += "<td> FormName </td>";
//                    strFormPick += "<td> DLN </td>";
//                    strFormPick += "<td> Position </td>";
//                    strFormPick += "<td> Camera </td>";
//                    strFormPick += "<td> FormCode </td>";
//                    strFormPick += "<td> Blank </td>";
//                    strFormPick += "</tr>";



//                    foreach (DataRow row in dt.Rows)
//                    {
//                        strFormPick += "<tr @@@ >";
//                        strFormPick += "<td>" + row["fstrFormName"] + "   </td>";
//                        strFormPick += "<td>" + row["fstrDLN"] + "   </td>";
//                        strFormPick += "<td>" + row["flngPosInBatch"].ToString() + "   </td>";
//                        strFormPick += "<td>" + row["flngCamera"].ToString() + "   </td>";
//                        strFormPick += "<td>" + row["fstrFormCode"].ToString() + "   </td>";
//                        strFormPick += "<td>" + row["fblnImageBlankSizeCheck"].ToString() + "   </td>";
//                        strFormPick += "</tr>";
//                        //      
//                        if ((row["flngPosinBatch"].ToString() == Positiontxt.Text) && (row["flngCamera"].ToString() == Cameratxt.Text))
//                        {
//                            strFormPick = strFormPick.Replace("@@@", "style=\"background: olive;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
//                        }
//                        else
//                        {
//                            strFormPick = strFormPick.Replace("@@@", "style=\"background: aqua;\"onclick=\"ChgColor(this,true);RegImg(" + "'" + row["fstrFormName"].ToString() + "', '" + row["flngPosInBatch"].ToString() + "', '" + row["flngCamera"].ToString() + "');\"");
//                        }
//                    }
//                    strFormPick += "</table>";
//                    controlsLIT.Text = strFormPick;
//                    // Mavro - Get Offset and Size (Stub front)
//                    if (ImgSrctxt.Text == "MAVRO")
//                    {
////                        MavFile.Text = strFile1;               // Current File Name
//                        strSQL = "SELECT flngFrontOffset, ";
//                        strSQL += "flngFrontSize ";
//                        strSQL += "FROM tblNM_MavroOffset ";
//                        strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
//                        strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
//                        strSQL += "ORDER BY flngDocNumber ";
//                        gc.DoSelect(strSQL);
//                        dt = new DataTable();
//                        numRows = gc.ReadSelect(out dt);
//                        if (numRows > 0)
//                        {
//                            Offsettxt.Text = dt.Rows[0]["flngFrontOffset"].ToString();
//                            Sizetxt.Text = dt.Rows[0]["flngFrontSize"].ToString();
//                        }

//                    }

//                    strSQL = "SELECT fstrTaxForm ";
//                    strSQL += "FROM rfrControlHeaders ";
//                    strSQL += "WHERE fstrTaxProgram = '" + DdTaxPgm.Text + "' ";
//                    strSQL += "AND flngTaxYear = '" + TaxYear.Text + "' ";
//                    strSQL += "AND flngBlock = 0 ";
//                    strSQL += "ORDER BY fstrTaxForm ";

//                    gc.DoSelect(strSQL);
//                    dt = new DataTable();
//                    numRows = gc.ReadSelect(out dt);
//                    // put form list in here, from strFormPick
//                    // be sure to include all <td></td> elements needed for each part
//                    // formListLIT
//                    strFormPick = "";
//                    if (numRows > 0)
//                    {
//                        foreach (DataRow row in dt.Rows)
//                        {
//                            strFormPick += "<tr @@@ >";
//                            strFormPick += "<td>" + row["fstrTaxForm"] + "</td>";
//                            strFormPick += "</tr>";
//                            strFormPick = strFormPick.Replace("@@@", "onmouseover=\"ChgColor(this,true);\" onmouseout=\"ChgColor(this,false);\" onclick=\"SelectPickRow(" + "'" + row["fstrTaxForm"].ToString() + "');\"");
//                        }
//                        formListLIT.Text = strFormPick;
//                    }

//                }
//            }
//            catch (Exception ex)
//            {
//                UtilClass.RecordError(gc, ex);
//                gc.Disconnect();
//            }

//        }
        protected void OnClick_homeBTN(object sender, EventArgs e)
        {
            // Home Button Click
            Response.Redirect(ResolveClientUrl("~/" + Session["homeLink"]), true);
        }

    }

}