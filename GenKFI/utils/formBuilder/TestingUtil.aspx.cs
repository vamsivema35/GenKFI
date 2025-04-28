using GenKFI.Properties;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace GenKFI.utils.formBuilder
{
    public partial class TestingUtil : System.Web.UI.Page
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
            strCurrPage = "Testing Utility";
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

        }
        protected void OnClick_Reset(object sender, EventArgs e)
        {
            string strSQL = "";
            int numRows = 0;
            string strTaxProgram = "";

            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();

            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                strSQL = "SELECT fstrTaxProgram FROM tblNM_BatchInfo WHERE fstrBatchId = '" + txtBatchId.Text + "'";
                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows == 0)
                {
                    lblMsg.Text = "Batch Not Found";
                }
                else
                {
                    strTaxProgram = dt.Rows[0]["fstrTaxProgram"].ToString();
                    // Clear Batch table used for PTW-D behind another Tax Program (CIT, PTE, Scorp, FID)
                    strSQL = "DELETE tblNM_BInfo2 Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    // Reset Header for Extract and set Status = Open
                    strSQL = "Update tblNM_BatchInfo Set fstrBatchUploaded = 'N', fdtmBatchUploaded = '12/31/9999', fstrBatchStatus = 'O', ";
                    strSQL += "fstrPaymentUploaded = 'N', fdtmPaymentUploaded = '12/31/9999'";
                    if (strTaxProgram.Substring(2) != "M")
                    {
                        strSQL += ", fstrImageUploaded = 'N', fdtmImageUploaded = '12/31/9999' ";
                    }
                    strSQL += " Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    lblMsg.Text = "Batch Reset Complete";
                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }
        protected void OnClick_Clear(object sender, EventArgs e)
        {
            string strSQL = "";
            int numRows = 0;
            string strTaxProgram = "";
            GoodConn gc = new GoodConn();
            DataTable dt = new DataTable();

            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif
                strSQL = "SELECT fstrTaxProgram FROM tblNM_BatchInfo WHERE fstrBatchId = '" + txtBatchId.Text + "'";
                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows == 0)
                {
                    lblMsg.Text = "Batch Not Found";
                }
                else
                {
                    strTaxProgram = dt.Rows[0]["fstrTaxProgram"].ToString();
                    // Clear Batch table used for PTW-D behind another Tax Program (CIT, PTE, Scorp, FID)
                    strSQL = "Delete tblNM_BInfo2 Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    // Update Batch Header File - New Batch
                    strSQL = "Update tblNM_BatchInfo Set fstrBatchUploaded = 'N', fdtmBatchUploaded = '12/31/9999', fstrBatchStatus = 'O', ";
                    strSQL += "fstrPaymentUploaded = 'N', fdtmPaymentUploaded = '12/31/9999', fintBatchCount = 0";
                    if (strTaxProgram.Substring(2) != "M")
                    {
                        strSQL += ", fstrImageUploaded = 'N', fdtmImageUploaded = '12/31/9999' ";
                    }
                    strSQL += " Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    // Update Image Check In/Out Dates
                    strSQL = "Update tblNM_BatchImage Set fdtmImageCheckedOut = null, fdtmImageCheckedIn = '12/31/9999' ";
                    strSQL += "Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    // Empty Queues
                    strSQL = "Delete tblKeQMast Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    strSQL = "Delete tblKeQueue Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    // Get Data Tables to Clear Batch like it never was keyed
                    strSQL = "Select fstrTable From rfrTestTable Where fstrTaxProgram = '" + strTaxProgram + "' And fblnClr = 1";
                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows == 0)
                    {
                        lblMsg.Text = "rfrTestTable Empty - No Tables";
                    }
                    else
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            strSQL = "Delete " + row["fstrTable"].ToString() + " Where fstrBatchId = '" + txtBatchId.Text + "'";
                            gc.DoExecute(strSQL);
                        }
                    }
                }
                lblMsg.Text = "Clear Batch Complete";
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }
        protected void OnClick_Amend(object sender, EventArgs e)
        {
            string strSQL = "";
            string strBatchIdAmend = "";
            string strTaxProgram = "";
            string strTable = "";
            string strFields = "";
            string strValue = "";
            string strAllValue = "";
            string strName = "";

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
                strSQL = "SELECT fstrTaxProgram FROM tblNM_BatchInfo WHERE fstrBatchId = '" + txtBatchId.Text + "'";
                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows == 0)
                {
                    lblMsg.Text = "Batch Not Found";
                }
                else
                {
                    strBatchIdAmend = txtBatchId.Text + "A";
                    strTaxProgram = dt.Rows[0]["fstrTaxProgram"].ToString();

                    strSQL = "DELETE tblNM_BInfo2 Where fstrBatchId = '" + txtBatchId.Text + "'";
                    gc.DoExecute(strSQL);
                    strSQL = "Select fstrTable from rfrTestTable Where fstrTaxProgram = '" + strTaxProgram + "' ";
                    gc.DoSelect(strSQL);
                    DataTable dr = new DataTable();
                    numRows = gc.ReadSelect(out dr);
                    strFields = "";
                    foreach (DataRow rrow in dr.Rows)
                    {
                        strTable = rrow["fstrTable"].ToString();
                        strSQL = "SELECT c.name FROM sys.columns c ";
                        strSQL += "INNER JOIN sys.objects t ON ";
                        strSQL += "(c.[object_id] = t.[object_id] ";
                        strSQL += "AND t.[name] = '" + strTable + "') ";
                        strSQL += "WHERE c.is_identity = 0; ";
                        gc.DoSelect(strSQL);
                        DataTable dn = new DataTable();
                        numRows = gc.ReadSelect(out dn);
                        strFields = "";
                        foreach (DataRow nrow in dn.Rows)
                        {
                            strFields += nrow["name"].ToString();
                            strFields += ", ";
                        }
                        strFields = strFields.Substring(0, strFields.Length - 2);
                        strSQL = "SELECT " + strFields + " FROM " + strTable + " Where fstrBatchId = '" + txtBatchId.Text + "' ";
                        gc.DoSelect(strSQL);
                        DataTable dc = new DataTable();
                        numRows = gc.ReadSelect(out dc);
                        if (numRows > 0)
                        {
                            foreach (DataRow crow in dc.Rows)
                            {
                                strSQL = "INSERT INTO " + strTable + " ( " + strFields + " ) VALUES ( ";
                                foreach (DataRow nrow in dn.Rows)
                                {
                                    strName = nrow["name"].ToString();
                                    if (strName.ToLower() != "fstrbatchid") 
                                    {
                                        strValue = crow[strName].ToString();
                                        if (strValue == "False")
                                        {
                                            strValue = "0";
                                        }
                                        if (strValue == "True")
                                        {
                                            strValue = "1";
                                        }
                                    }
                                    else
                                    {
                                        strValue = strBatchIdAmend;
                                    }
                                    if ((strName.Substring(0, 4) == "fstr") || (strName.Substring(0, 4) == "fdtm"))
                                    {
                                        strValue = "'" + strValue + "', ";
                                    }
                                    else
                                    {
                                        if ((strName.Substring(0,4) == "flng") && (strValue == ""))
                                        {
                                            strValue = "0";
                                        }
                                        strValue += ", ";
                                    }
                                    strAllValue += strValue;
                                }
                                strAllValue = strAllValue.Substring(0, strAllValue.Length - 2);
                                strAllValue += " );";
                                strSQL += strAllValue;
                                gc.DoExecute(strSQL);
                                strAllValue = "";
                            }

                        }
                        lblMsg.Text = strTable;
                    }

                    lblMsg.Text = "Create Amend Complete";
                }
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

    }
}