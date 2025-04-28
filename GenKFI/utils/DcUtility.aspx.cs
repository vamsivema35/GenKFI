using GenKFI.Properties;
using System;
using System.Data;
using System.IO;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class DcUtility : System.Web.UI.Page
    {
        string strCurrPage;
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
            strCurrPage = "DC Utility";
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
        protected void OnClick_BlankForm(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            string strSQL = "";
            int numRows = 0;
            string strFormPick = "";
            OpStatus.Text = "";
            string strBlank = "";
            bool blnBlank;
            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                strSQL = "DELETE tblKeQueue ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                gc.DoExecute(strSQL);

                strSQL = "DELETE tblKeQMast ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                gc.DoExecute(strSQL);

                strSQL = "SELECT fblnImageBlankSizeCheck ";
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                strBlank = gc.DoScalar(strSQL).ToString();
                blnBlank = Convert.ToBoolean(strBlank);
                blnBlank = !blnBlank;

                strSQL = "UPDATE tblNM_BatchImage ";
                strSQL += "SET fblnImageBlankSizeCheck = '" + blnBlank + "' ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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
                BatchId.Text = "";
                SeqNbr.Text = "";
                ImgSrctxt.Text = "";
                Positiontxt.Text = "";
                Cameratxt.Text = "";
                Formnametxt.Text = "";
                strFormPick = "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">";
                strFormPick += "</table>";
                controlsLIT.Text = strFormPick;
                DcImage.ImageUrl = "";
                
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

            DdTaxPgm.Focus();

        }
        protected void OnClick_Mavro(object sender, EventArgs e)
        {
            string strDir = "";
            string strSQL = "";
            string strFormPick = "";
            string strFile = "";
            string strPath = "";
            string strBatchDate = "01/01/2018";
            char slash = Convert.ToChar(92);
            int numRows = 0;
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            OpStatus.Text = "";

            if (ImgSrctxt.Text == "MAVRO")
            {
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                    // Update File and ImagePath with Previous Image File
                    strSQL = "SELECT fstrDir ";
                    strSQL += "FROM tblNM_BatchImage ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                    strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                    strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                    strDir = gc.DoScalar(strSQL).ToString();
                    strDir = strDir + slash + MavPrev.Text;

                    strSQL = "SELECT fdtmBatchDate ";
                    strSQL += "FROM tblNM_BatchInfo ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        strBatchDate = dt.Rows[0]["fdtmBatchDate"].ToString();
                    }
                    strSQL = "SELECT fstrFile, ";
                    strSQL += "fstrImagePath ";
                    strSQL += "FROM tblNM_BatchImage ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                    strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                    strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        strFile = dt.Rows[0]["fstrFile"].ToString();
                        strPath = dt.Rows[0]["fstrImagePath"].ToString();
                    }

                    strSQL = "SELECT fstrOrgFile ";
                    strSQL += "FROM tblNM_MavImg ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    strSQL += "AND fdtmBatchDate = '" + strBatchDate + "' ";
                    strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        strSQL = "UPDATE tblNM_MavImg ";
                        strSQL += "SET fstrOldFile = '" + strFile + "', ";
                        strSQL += "fstrOldPath = '" + strPath + "', ";
                        strSQL += "fstrNewFile = '" + MavPrev.Text + "', ";
                        strSQL += "fstrNewPath = '" + strDir + "', ";
                        strSQL += "fblnActive = 1 ";
                        strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                        strSQL += "AND fdtmBatchDate = '" + strBatchDate + "' ";
                        strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                        gc.DoExecute(strSQL);
                    }
                    else
                    {
                        strSQL = "INSERT INTO tblNM_MavImg ";
                        strSQL += "(fstrBatchId, fdtmBatchDate, flngSequence, ";
                        strSQL += "fstrOrgFile, fstrOrgPath, fstrOldFile, fstrOldPath, ";
                        strSQL += "fstrNewFile, fstrNewpath, fblnActive) ";
                        strSQL += "VALUES ('" + BatchId.Text + "', '" + strBatchDate + "', '";
                        strSQL += SeqNbr.Text + "', '" + strFile + "', '" + strPath + "', '";
                        strSQL += strFile + "', '" + strPath + "', '" + MavPrev.Text + "', '" + strDir + "', 1)";
                        gc.DoExecute(strSQL);
                    }


                    strSQL = "UPDATE tblNM_BatchImage ";
                    strSQL += "SET fstrFile = '" + MavPrev.Text + "', ";
                    strSQL += "fstrImagePath = '" + strDir + "' ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                    strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                    strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                    gc.DoExecute(strSQL);

                    strSQL = "DELETE tblKeQueue ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                    gc.DoExecute(strSQL);

                    strSQL = "DELETE tblKeQMast ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                    gc.DoExecute(strSQL);

                    strSQL = "SELECT fstrTaxProgram, ";
                    strSQL += "fstrFormName, ";
                    strSQL += "fstrDLN, ";
                    strSQL += "flngPosInBatch, ";
                    strSQL += "flngCamera, ";
                    strSQL += "fstrFormCode, ";
                    strSQL += "fblnImageBlankSizeCheck, ";
                    strSQL += "fstrImgSrc ";
                    strSQL += "FROM tblNM_BatchImage ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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

                OpStatus.Text = "Mavro File Update Complete";

                // Retry the Image Side

            }
        }
        protected void OnClick_UnDelete(object sender, EventArgs e)
        {
            // Mark Batch Deleted
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            int numRows = 0;
            string strBatchTaxPgm = "";
            string strBatchUploaded = "";
            string strBatchStatus = "";
            string strSQL = "";
            bool blnUpd = true;
            OpStatus.Text = "";

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                // Get Batch
                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrBatchUploaded, ";
                strSQL += "fstrBatchStatus ";
                strSQL += "FROM tblNM_BatchInfo ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "'";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    strBatchTaxPgm = dt.Rows[0]["fstrTaxProgram"].ToString();
                    strBatchUploaded = dt.Rows[0]["fstrBatchUploaded"].ToString();
                    strBatchStatus = dt.Rows[0]["fstrBatchStatus"].ToString();
                }
                if (numRows == 0)
                {
                    OpStatus.Text = "Batch Not Found";
                    blnUpd = false;
                }
                if (strBatchTaxPgm != DdTaxPgm.Text)
                {
                    OpStatus.Text = "Tax Pgm for Batch is '" + strBatchTaxPgm + "'";
                    blnUpd = false;
                }
                if (strBatchUploaded == "Y")
                {
                    OpStatus.Text = "Batch Already Uploaded";
                    blnUpd = false;
                }
                if (strBatchStatus != "D")
                {
                    OpStatus.Text = "Batch Not Deleted";
                    blnUpd = false;
                }
                if (blnUpd)
                {
                    strSQL = "UPDATE tblNM_BatchInfo ";
                    strSQL += "SET fstrBatchStatus = 'O' ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    gc.DoExecute(strSQL);
                    OpStatus.Text = "Batch '" + BatchId.Text + "' Un-Deleted";
                }
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
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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

                // Clear Form

                strSQL = "UPDATE tblNM_BatchImage ";
                strSQL += "SET fstrFormName = ' ' ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "AND flngPosInBatch = '" + Positiontxt.Text + "' ";
                strSQL += "AND flngCamera = '" + Cameratxt.Text + "' ";
                gc.DoExecute(strSQL);

                // Remove from current Run Queue (used by Entry) - no longer has a form name
                strSQL = "DELETE tblKeQueue ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                gc.DoExecute(strSQL);

                // Remove from Master Queue
                strSQL = "DELETE tblKeQMast ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                gc.DoExecute(strSQL);


                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrFormName, ";
                strSQL += "fstrDLN, ";
                strSQL += "flngPosInBatch, ";
                strSQL += "flngCamera, ";
                strSQL += "fstrFormCode, ";
                strSQL += "fblnImageBlankSizeCheck, ";
                strSQL += "fstrImgSrc ";
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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
                strSQL = "DELETE tblKeQueue ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                gc.DoExecute(strSQL);

                strSQL = "DELETE tblKeQMast ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                gc.DoExecute(strSQL);

                strSQL = "UPDATE tblNM_BatchImage ";
                strSQL += "SET fstrFormName = '" + hidFormName.Value + "' ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
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
                        DcImage.ImageUrl = "DcimgLoad.aspx"; 
                       

                    }
                    catch (Exception ex)
                    {
                        object kkex = ex;
                        DcImage.ImageUrl = "~/images/imgError.jpg";
                    }

                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_DeleteBatch(object sender, EventArgs e)
        {
            // Mark Batch Deleted
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            int numRows = 0;
            string strBatchTaxPgm = "";
            string strBatchUploaded = "";
            string strBatchStatus = "";
            string strForm = "";
//            string strTable = "";
            string strSQL = "";
            bool blnUpd = true;
            OpStatus.Text = "";

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                // Get Batch
                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrForm, ";
                strSQL += "fstrBatchUploaded, ";
                strSQL += "fstrBatchStatus ";
                strSQL += "FROM tblNM_BatchInfo ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "'";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    strBatchTaxPgm = dt.Rows[0]["fstrTaxProgram"].ToString();
                    strForm = dt.Rows[0]["fstrForm"].ToString();
                    strBatchUploaded = dt.Rows[0]["fstrBatchUploaded"].ToString();
                    strBatchStatus = dt.Rows[0]["fstrBatchStatus"].ToString();
                }
                if (numRows == 0)
                {
                    OpStatus.Text = "Batch Not Found";
                    blnUpd = false;
                }
                if (strBatchTaxPgm != DdTaxPgm.Text)
                {
                    OpStatus.Text = "Tax Pgm for Batch is '" + strBatchTaxPgm + "'";
                    blnUpd = false;
                }
                if (strBatchUploaded == "Y")
                {
                    OpStatus.Text = "Batch Already Uploaded";
                    blnUpd = false;
                }
                if (strBatchStatus == "D")
                {
                    OpStatus.Text = "Batch Already Deleted";
                    blnUpd = false;
                }
                if (blnUpd)
                {
                    // Remove from current Run Queue (used by Entry) 
                    strSQL = "DELETE tblKeQueue ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    gc.DoExecute(strSQL);


                    // Update Batch Header
                    strSQL = "UPDATE tblNM_BatchInfo ";
                    strSQL += "SET fstrBatchStatus = 'D' ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                    gc.DoExecute(strSQL);
                    OpStatus.Text = "Batch '" + BatchId.Text + "' Deleted";
                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }
        protected void OnClick_GetImages(object sender, EventArgs e)
        {
            // Get Images for the Batch /Sequence
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();
            int numRows = 0;
            string strBatchTaxPgm = "";
            string strSQL = "";
            string strTaxYear = "";
            string strFile1 = "";
            int lngSeq = 0;
            bool blnUpd = true;
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

                // Get Batch
                strSQL = "SELECT fstrTaxProgram, ";
                strSQL += "fstrFormName, ";
                strSQL += "fstrDLN, ";
                strSQL += "flngPosInBatch, ";
                strSQL += "flngCamera, ";
                strSQL += "fstrFormCode, ";
                strSQL += "fblnImageBlankSizeCheck, ";
                strSQL += "fstrFile, ";
                strSQL += "fstrImgSrc ";
                strSQL += "FROM tblNM_BatchImage ";
                strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                strSQL += "ORDER BY flngPosInBatch, flngCamera ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    strBatchTaxPgm = dt.Rows[0]["fstrTaxProgram"].ToString();
                    strFile1 = dt.Rows[0]["fstrFile"].ToString();
                }
                if (numRows == 0)
                {
                    OpStatus.Text = "Batch/Sequence Not Found";
                    blnUpd = false;
                }
                if (strBatchTaxPgm != DdTaxPgm.Text)
                {
                    OpStatus.Text = "Tax Pgm for Batch is '" + strBatchTaxPgm + "'";
                    blnUpd = false;
                }
                if (blnUpd)
                {
                    // Load Possible Form Names for Batch
                    ImgSrctxt.Text = dt.Rows[0]["fstrImgSrc"].ToString();

                    strFormPick = "<table id=\"tableCtrl\" cellspacing=\"0\" cellpadding=\"0\" style=\"margin: auto; width: 90%;\">";
                    strFormPick +=  "<tr style=\"background: lime;\">";
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
                        //      
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
                    // Mavro - Get Offset and Size (Stub front)
                    if (ImgSrctxt.Text == "MAVRO")
                    {
                        MavFile.Text = strFile1;               // Current File Name
                        strSQL = "SELECT flngFrontOffset, ";
                        strSQL += "flngFrontSize ";
                        strSQL += "FROM tblNM_MavroOffset ";
                        strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                        strSQL += "AND flngSequence = '" + SeqNbr.Text + "' ";
                        strSQL += "ORDER BY flngDocNumber ";
                        gc.DoSelect(strSQL);
                        dt = new DataTable();
                        numRows = gc.ReadSelect(out dt);
                        if (numRows > 0)
                        {
                            Offsettxt.Text = dt.Rows[0]["flngFrontOffset"].ToString();
                            Sizetxt.Text = dt.Rows[0]["flngFrontSize"].ToString();
                        }
                        // Previous File Names
                        lngSeq = Convert.ToInt32(SeqNbr.Text);
                        lngSeq = lngSeq - 1;

                        strSQL = "SELECT fstrFile ";
                        strSQL += "FROM tblNM_BatchImage ";
                        strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";
                        strSQL += "AND flngSequence = '" + lngSeq.ToString() + "' ";
                        strSQL += "ORDER BY flngPosInBatch, flngCamera ";

                        gc.DoSelect(strSQL);
                        dt = new DataTable();
                        numRows = gc.ReadSelect(out dt);
                        if (numRows > 0)
                        {
                            MavPrev.Text = dt.Rows[0]["fstrFile"].ToString();
                        }

                    }
                    // Show List of Images in Right Panel
                    strSQL = "SELECT fstrForm ";
                    strSQL += "FROM tblNM_BatchInfo ";
                    strSQL += "WHERE fstrBatchId = '" + BatchId.Text + "' ";

                    strTaxYear = gc.DoScalar(strSQL).ToString();

                    strSQL = "SELECT fstrTaxForm ";
                    strSQL += "FROM rfrControlHeaders ";
                    strSQL += "WHERE fstrTaxProgram = '" + DdTaxPgm.Text + "' ";
                    strSQL += "AND flngTaxYear = '" + strTaxYear + "' ";
                    strSQL += "AND flngBlock = 0 ";
                    strSQL += "ORDER BY fstrTaxForm ";

                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    // put form list in here, from strFormPick
                    // be sure to include all <td></td> elements needed for each part
                    // formListLIT
                    strFormPick = "";
                    if (numRows > 0)
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            strFormPick += "<tr @@@ >";
                            strFormPick += "<td>" + row["fstrTaxForm"] + "</td>";
                            strFormPick += "</tr>";
                            strFormPick = strFormPick.Replace("@@@", "onmouseover=\"ChgColor(this,true);\" onmouseout=\"ChgColor(this,false);\" onclick=\"SelectPickRow(" + "'" + row["fstrTaxForm"].ToString() + "');\"");
                        }
                        formListLIT.Text = strFormPick;
                    }

                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnClick_homeBTN(object sender, EventArgs e)
        {
            // Home Button Click
            Response.Redirect(ResolveClientUrl("~/" + Session["homeLink"]), true);
        }

    }
}