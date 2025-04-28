using GenKFI.Properties;
using System;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class GkInstall : Page
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
            strCurrPage = "Gk Install";
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
        protected void OnClick_AddEntry(object sender, EventArgs e)
        {
            string strInstName = "";
            string strCmd = "";
            string strFileType = "";
            string strTable = "";
            string strColumn = "";
            string strDataType = "";
            string strNull = "";
            string strDefault = "";
            string strFilter = "";
            string strOrderBy = "";
            string strSQL = "";
            Boolean blnSkip = false;
            
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                strInstName = txtInstName.Text;
                strInstName = strInstName.ToUpper();
                strCmd = txtCmd.Text;
                strCmd = strCmd.ToUpper();
                strCmd = strCmd.Trim();
                strFileType = txtFileType.Text;
                strFileType = strFileType.ToUpper();
                strFileType = strFileType.Trim();
                strTable = txtTable.Text;
                strTable = strTable.Trim();
                strColumn = txtColumn.Text;
                strColumn = strColumn.Trim();
                strDataType = txtDataType.Text;
                strDataType = strDataType.ToLower();
                strDataType = strDataType.Trim();
                strNull = txtNull.Text;
                strNull = strNull.ToUpper();
                strNull = strNull.Trim();
                strDefault = txtDefault.Text;
                strDefault = strDefault.ToUpper();
                strDefault = strDefault.Trim();
                strFilter = txtFilter.Text;
                strFilter = strFilter.Trim();
                strOrderBy = txtOrderBy.Text;
                strOrderBy = strOrderBy.Trim();

                // Check Data Valid
                switch (strCmd)
                {
                    case "AF":                                                          // Add Field - Tech Team Script
                        if (strTable.Length == 0)
                        {
                            lblOpStatus.Text = "Table Required";
                            blnSkip = true;
                        }
                        if (strColumn.Length == 0)
                        {
                            lblOpStatus.Text = "Column Required";
                            blnSkip = true;
                        }
                        if (strDataType.Length == 0)
                        {
                            lblOpStatus.Text = "Data Type Required";
                            blnSkip = true;
                        }
                        break;
                    case "DF":                                                         // Drop Field - Tech Team Script
                        if (strTable.Length == 0)
                        {
                            lblOpStatus.Text = "Table Required";
                            blnSkip = true;
                        }
                        if (strColumn.Length == 0)
                        {
                            lblOpStatus.Text = "Column Required";
                            blnSkip = true;
                        }
                        break;
                    case "LC":                                                        // Load Controls - Install Script
                        switch (strTable)
                        {
                            case "rfrTaxPgm":
                                strOrderBy = "fstrAccountType, fblnPtdAddition, fbln2Db";
                                break;
                            case "rfrAddDoc":
                                strOrderBy = "fblnPtdAddition, flngFunction";
                                break;
                            case "rfrReturnHeaders":
                                strOrderBy = "";
                                break;
                            case "rfrControlHeaders":
                                strOrderBy = "fstrTaxForm, flngBlock, fstrTable";
                                break;
                            case "rfrControls":
                                strOrderBy = "fstrTaxForm, flngBlock, flngOrder";
                                break;
                            case "tblAutoJavaComplete":
                                strOrderBy = "fstrTaxForm, flngCtlBlock, flngOutOrder, fblnOnBlur, flngOrder";
                                break;
                            default:
                                blnSkip = true;
                                lblOpStatus.Text = "Invalid Table";
                                break;
                        }
                        break;
                    case "LD":                                                       // Load Data - Install Script
                        switch (strTable)
                        {
                            case "rfrTaxTable":
                                if (strFilter.Length == 0)
                                {
                                    lblOpStatus.Text = "Filter fstrTaxYear=yyyy Required";
                                    blnSkip = true;
                                }
                                strOrderBy = "fcurLower, fcurUpper";
                                break;
                            case "rfrPitRcLic":
                                if (strFilter.Length == 0)
                                {
                                    lblOpStatus.Text = "Filter fstrTaxYear=yyyy Required";
                                    blnSkip = true;
                                }
                                strOrderBy = "fcurLower, fcurUpper";
                                break;
                            case "rfrCrsLocation":
                                strOrderBy = "fstrLocationCode";
                                break;
                            case "rfrCrsRate":
                                strOrderBy = "fstrLocation, fstrRateType, fdtmStart, fdtmEnd";
                                break;
                            case "rfrGrtRate":
                                strOrderBy = "fstrLocation, fstrRateType, fdtmStart, fdtmEnd";
                                break;
                            case "rfrCmpRate":
                                strOrderBy = "fstrLocation, fstrRateType, fdtmStart, fdtmEnd";
                                break;
                            case "rfrTable":
                                strOrderBy = "fstrTaxProgram, fstrTable";
                                break;
                            case "rfrTestTable":
                                strOrderBy = "fstrTaxProgram, fstrTable";
                                break;
                            case "rfrCountry":
                                strOrderBy = "fstrCountryName";
                                break;
                            case "rfrTaxRun":
                                strOrderBy = "fstrTaxProgram, fstrBatchType";
                                break;
                            case "rfrTaxPgm":
                                strOrderBy = "fstrFileType, fstrAccountType, fstrBatchType";
                                break;
                            default:
                                blnSkip = true;
                                lblOpStatus.Text = "Invalid Table";
                                break;
                        }
                        break;
                    default:
                        lblOpStatus.Text = "Invalid Command";
                        blnSkip = true;
                        break;
                }

                txtInstName.Text = strInstName;
                txtCmd.Text = strCmd;
                txtFileType.Text = strFileType;
                txtTable.Text = strTable;
                txtColumn.Text = strColumn;
                txtDataType.Text = strDataType;
                txtNull.Text = strNull;
                txtDefault.Text = strDefault;
                txtFilter.Text = strFilter;
                txtOrderBy.Text = strOrderBy;
                if (blnSkip == true)
                {
                    return;
                }
                strSQL = "INSERT INTO rfrGkInstall ";
                strSQL += "(fstrInstName, fstrCmd, fstrFileType, fstrTable, fstrColumn, ";
                strSQL += "fstrDataType, fstrNull, fstrDefault, fstrFilter, fstrOrderBy) ";
                strSQL += "VALUES ('" + txtInstName.Text + "', '" + txtCmd.Text + "', '" + txtFileType.Text + "', '";
                strSQL += txtTable.Text + "', '" + txtColumn.Text + "', '" + txtDataType.Text + "', '";
                strSQL += txtNull.Text + "', '" + txtDefault.Text + "', '" + txtFilter.Text + "', '" + txtOrderBy.Text + "') ;";

                gc.DoExecute(strSQL);

                lblOpStatus.Text = "Add Entry Complete";
                gc.Disconnect();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnClick_TechTeam(object sender, EventArgs e)
        {
            string strInstName = "";
            string strCmd = "";
            string strFileType = "";
            string strTable = "";
            string strColumn = "";
            string strDataType = "";
            string strNull = "";
            string strDefault = "";
            string strOrderBy = "";
            string strLine = "";
            string GkInstallFile = "\\\\PipeLineDev\\wwwRoot\\Xfer\\GkTechInstall.txt";

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                if (File.Exists(GkInstallFile))
                {
                    File.Delete(GkInstallFile);
                }

                strInstName = txtInstName.Text;
                strInstName = strInstName.Trim();

                string strSQL = "";
                strSQL = "SELECT fstrInstName, fstrCmd, fstrFileType, fstrTable, ";
                strSQL += "fstrColumn, fstrDataType, fstrNull, fstrDefault, fstrOrderBy ";
                strSQL += "FROM rfrGkInstall ";
                strSQL += "WHERE fstrCmd in ('AF', 'DF') ";
                if (strInstName.Length > 0)
                {
                    strSQL += "AND fstrInstName = '" + strInstName + "' ";
                }
                strSQL += "ORDER BY fstrCmd, fstrTable, fstrColumn; ";

                gc.DoSelect(strSQL);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    using (StreamWriter sf = File.CreateText(GkInstallFile))
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            strCmd = row["fstrCmd"].ToString();
                            strCmd = strCmd.ToUpper();
                            strCmd = strCmd.Trim();
                            strFileType = row["fstrFileType"].ToString();
                            strFileType = strFileType.ToUpper();
                            strFileType = strFileType.Trim();
                            strTable = row["fstrTable"].ToString();
                            strTable = strTable.Trim();
                            strColumn = row["fstrColumn"].ToString();
                            strColumn = strColumn.Trim();
                            strDataType = row["fstrDataType"].ToString();
                            strDataType = strDataType.ToLower();
                            strDataType = strDataType.Trim();
                            strNull = row["fstrNull"].ToString();
                            strNull = strNull.ToUpper();
                            strNull = strNull.Trim();
                            strDefault = row["fstrDefault"].ToString();
                            strDefault = strDefault.ToUpper();
                            strDefault = strDefault.Trim();
                            strOrderBy = row["fstrOrderBy"].ToString();
                            strOrderBy = strOrderBy.Trim();
                            switch (strCmd)
                            {
                                case "AF":                                       // Add Field
                                    strLine = "ALTER TABLE [dbo].[" + strTable + "] ADD [" + strColumn + "] ";
                                    strLine += strDataType + " " + strNull + " NULL ";
                                    strLine += "CONSTRAINT [DF_" + strTable + "_" + strColumn + "] DEFAULT ";
                                    switch (strDefault)
                                    {
                                        case "BLANK":
                                            strLine += "(' ')";
                                            break;
                                        case "EMPTY":
                                            strLine += "('')";
                                            break;
                                        case "ZERO":
                                            strLine += "((0))";
                                            break;
                                        case "BATCH":
                                            strLine += "('Batch')";
                                            break;
                                        case "GETDATE":
                                            strLine += "(getDate())";
                                            break;
                                        case "HIGHDATE":
                                            strLine += "('12/31/9999')";
                                            break;
                                        default:
                                            if (strDataType == "money") {
                                                strLine += strDefault;
                                             }
                                            else
                                            { 
                                                if (strDataType == "tinyint")
                                                {
                                                    strLine += strDefault;
                                                }
                                                else
                                                {
                                                    strLine += "('" + strDefault + "')";
                                                }
                                            } 
                                            break;
                                    }
                                    //strLine += " ;";
                                    strLine += " ;";
                                    sf.WriteLine(strLine);
                                    break;
                                case "DF":                                      // Drop Field
                                    strLine = "ALTER TABLE " + strTable + " DROP CONSTRAINT [DF_";
                                    strLine += strTable + "_" + strColumn + "]; ";
                                    sf.WriteLine(strLine);

                                    strLine = "ALTER TABLE " + strTable + " DROP COLUMN " + strColumn + " ;";
                                    sf.WriteLine(strLine);
                                    break;
                                default:
                                    break;
                            }
//                            sf.WriteLine("^^");
                        }
                        sf.Close();
                        lblOpStatus.Text = "Tech Install Complete";

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
        protected void OnClick_Script(object sender, EventArgs e)
        {
            string strInstName = "";
            string strCmd = "";
            string strFileType = "";
            string strTable = "";
            string strColumn = "";
            string strDataType = "";
            string strNull = "";
            string strDefault = "";
            string strFilter = "";
            string strOrderBy = "";
            string strLine = "";
            string strFields = "";
            string strName = "";
            string strValue = "";
            Int32 lngCount = 0;
            string GkInstallFile = "\\\\PipeLineDev\\wwwRoot\\Xfer\\GkInstall.txt";

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                if (File.Exists(GkInstallFile))
                {
                    File.Delete(GkInstallFile);
                }

                strInstName = txtInstName.Text;
                strInstName = strInstName.Trim();

                string strSQL = "";
                strSQL = "SELECT fstrInstName, fstrCmd, fstrFileType, fstrTable, ";
                strSQL += "fstrColumn, fstrDataType, fstrNull, fstrDefault, fstrFilter, fstrOrderBy ";
                strSQL += "FROM rfrGkInstall ";
                strSQL += "WHERE fstrCmd in ('LC', 'LD') ";
                if (strInstName.Length > 0)
                {
                    strSQL += "AND fstrInstName = '" + strInstName + "' ";
                }
                strSQL += "ORDER BY fstrCmd, fstrFileType, fstrTable, fstrColumn; ";

                gc.DoSelect(strSQL);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    using (StreamWriter sf = File.CreateText(GkInstallFile))
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            strCmd = row["fstrCmd"].ToString();
                            strCmd = strCmd.ToUpper();
                            strCmd = strCmd.Trim();
                            strFileType = row["fstrFileType"].ToString();
                            strFileType = strFileType.ToUpper();
                            strFileType = strFileType.Trim();
                            strTable = row["fstrTable"].ToString();
                            strTable = strTable.Trim();
                            strColumn = row["fstrColumn"].ToString();
                            strColumn = strColumn.Trim();
                            strDataType = row["fstrDataType"].ToString();
                            strDataType = strDataType.ToLower();
                            strDataType = strDataType.Trim();
                            strNull = row["fstrNull"].ToString();
                            strNull = strNull.ToUpper();
                            strNull = strNull.Trim();
                            strDefault = row["fstrDefault"].ToString();
                            strDefault = strDefault.ToUpper();
                            strDefault = strDefault.Trim();
                            strFilter = row["fstrFilter"].ToString();
                            strFilter = strFilter.Trim();
                            strOrderBy = row["fstrOrderBy"].ToString();
                            strOrderBy = strOrderBy.Trim();
                            // LC - Build Load Control
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
                            strSQL = "SELECT " + strFields + " FROM " + strTable + " ";
                            if (strCmd == "LC")
                            { 
                                strSQL += "WHERE fstrFileType = '" + strFileType + "' ";
                            }
                            if ((strCmd == "LD") && (strFilter.Length > 0))
                            {
                                strSQL += "WHERE " + strFilter + " ";
                            }
                            if (strOrderBy.Length > 0)
                            {
                                strSQL += "ORDER BY " + strOrderBy;
                            }
                            strSQL += "; ";
                            gc.DoSelect(strSQL);
                            DataTable dc = new DataTable();
                            numRows = gc.ReadSelect(out dc);
                            if (numRows > 0)
                            {
                                foreach (DataRow crow in dc.Rows)
                                {
                                    strLine = "INSERT INTO " + strTable + " ( " + strFields + " ) VALUES ( ";
                                    foreach (DataRow nrow in dn.Rows)
                                    {
                                        strName = nrow["name"].ToString();
                                        strValue = crow[strName].ToString();
                                        if ((strName.Substring(0,4) == "fstr") || (strName.Substring(0, 4) == "fdtm"))
                                        {
                                            strValue = "'" + strValue + "', ";
                                        }
                                        else
                                        {
                                            strValue += ", ";
                                        }
                                        strLine += strValue;
                                    }
                                    strLine = strLine.Substring(0, strLine.Length - 2);
                                    strLine += " );";
                                    sf.WriteLine(strLine);
                                    sf.WriteLine("^^");
                                    lngCount++;
                                    lblOpStatus.Text = "Script: " + lngCount.ToString();
                                }
                            }
                        }
                        sf.Close();
                    }
                }

                gc.Disconnect();
                lblOpStatus.Text = "Script Complete";

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnClick_PullBatch(object sender, EventArgs e)
        {
            string strPBatchId = "";
            string strTable = "";
            string strLine = "";
            string strFields = "";
            string strName = "";
            string strValue = "";
         //   Int32 lngCount = 0;
            string GkInstallFile = "\\\\PipeLineDev\\wwwRoot\\Xfer\\GkInstall.txt";

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
                gc.Connect(Resources.prodConnString);
#endif

                if (File.Exists(GkInstallFile))
                {
                    File.Delete(GkInstallFile);
                }

                strPBatchId = TxtPBatchId.Text;
                string strSQL = "";
                strSQL = "SELECT fstrTaxProgram  ";
                strSQL += "FROM tblNM_BatchInfo ";
                strSQL += "WHERE fstrBatchId = '" + strPBatchId + "' ; ";

                string strTaxProgram = gc.DoScalar(strSQL).ToString();
                strSQL = "SELECT fstrTable FROM rfrTestTable WHERE fstrTaxProgram = '" + strTaxProgram + "' ; ";
                gc.DoSelect(strSQL);

                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    using (StreamWriter sf = File.CreateText(GkInstallFile))
                    {
                        foreach (DataRow row in dt.Rows)
                        {
                            strTable = row["fstrTable"].ToString();

                            // Build Load Data to Table
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
                            strSQL = "SELECT " + strFields + " FROM " + strTable + " ";
                                strSQL += "WHERE fstrBatchId = '" + strPBatchId + "' ";
                            strSQL += "; ";
                            gc.DoSelect(strSQL);
                            DataTable dc = new DataTable();
                            numRows = gc.ReadSelect(out dc);
                            if (numRows > 0)
                            {
                                foreach (DataRow crow in dc.Rows)
                                {
                                    strLine = "INSERT INTO " + strTable + " ( " + strFields + " ) VALUES ( ";
                                    foreach (DataRow nrow in dn.Rows)
                                    {
                                        strName = nrow["name"].ToString();
                                        strValue = crow[strName].ToString();
                                        if (strName == "fblnImageBlankSizeCheck")
                                        {
                                            if (strValue == "True")
                                            {
                                                strValue = "1";
                                            }
                                            else
                                            {
                                                strValue = "0";
                                            }
                                        }
                                        if ((strName.Substring(0, 4) == "fstr") || (strName.Substring(0, 4) == "fdtm"))
                                        {
                                            strValue = "'" + strValue + "', ";
                                        }
                                        else
                                        {
                                            strValue += ", ";
                                        }
                                        strLine += strValue;
                                    }
                                    strLine = strLine.Substring(0, strLine.Length - 2);
                                    strLine += " );";
                                    sf.WriteLine(strLine);
                                    sf.WriteLine("^^");
                                 //   lngCount++;
                                 //   lblOpStatus.Text = "Pull: " + lngCount.ToString();
                                }
                            }
                        }
                        sf.Close();
                    }
                }

                gc.Disconnect();
                lblOpStatus.Text = "Pull Batch Complete";

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
            string strInstName = "";
            strInstName = txtInstName.Text;
            strInstName = strInstName.Trim();


            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif

                strSQL = "DELETE rfrGkInstall ";
                if (strInstName.Length > 0)
                {
                    strSQL += "WHERE fstrInstName = '" + strInstName + "' ";
                }

                gc.DoExecute(strSQL);
                lblOpStatus.Text = "Clear GkInstall Complete";

                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnClick_Install(object sender, EventArgs e)
        {
            string strLine = "";
            string strSQL = "";
            string GkInstallFile = "\\\\PipeLineDev\\wwwRoot\\Xfer\\GkInstall.txt";

            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif


                StreamReader Sr = new StreamReader(GkInstallFile);
                    
                while((strLine = Sr.ReadLine()) != null)
                {
                    if (strLine == "^^")
                    {
                        gc.DoExecute(strSQL);
                        strSQL = "";
                        strLine = "";
                    }
                    strSQL += strLine;
                }
                Sr.Close();


                lblOpStatus.Text = "Install Complete";
                gc.Disconnect();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnClick_ReLink(object sender, EventArgs e)
        {
            string strSQL = "";
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif


                // ReLink rfrControlHeaders from rfrReturnHeaders

                strSQL = "UPDATE dbo.rfrControlHeaders ";
                strSQL += "SET dbo.rfrControlHeaders.flngReturnHeadersIDFK = rh.idReturnHeaders ";
                strSQL += "FROM rfrControlHeaders ch INNER JOIN rfrReturnHeaders rh ON ";
                strSQL += " (ch.fstrFileType = rh.fstrFileType); ";
                gc.DoExecute(strSQL);

                // ReLink Format Type Number in Control
                strSQL = "UPDATE dbo.rfrControls ";
                strSQL += "SET dbo.rfrControls.flngFormatIDFK = ft.IDrfrFormatTypes ";
                strSQL += "FROM rfrControls rc INNER JOIN rfrFormatTypes ft ON ";
                strSQL += "(rc.fstrFJSfuncName = ft.fstrFJSfuncName); ";
                gc.DoExecute(strSQL);

                // ReLink rfrControls from rfrControlHeaders

                strSQL = "UPDATE dbo.rfrControls ";
                strSQL += "SET dbo.rfrControls.flngControlHeadersIDFK = ch.idControlHeaders, ";
                strSQL += "dbo.rfrControls.fstrFormType = ch.fstrFormType ";
                strSQL += "FROM rfrControls rc INNER JOIN rfrControlHeaders ch ON ";
                strSQL += "(rc.fstrFileType = ch.fstrFileType ";
                strSQL += "AND rc.fstrTaxForm = ch.fstrTaxForm ";
                strSQL += "AND rc.flngBlock = ch.flngBlock); ";
                gc.DoExecute(strSQL);

                // ReLink tblAutoJavaComplete

                // Function Number

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngJavaFuncIDFK = rj.IDrfrJavaAutoFunctions ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrJavaAutoFunctions rj ON ";
                strSQL += "(tj.fstrFuncName = rj.fstrFuncName); ";
                gc.DoExecute(strSQL);

                // Out Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngControlOutIDFK = rc.IDrfrControls, ";
                strSQL += " dbo.tblAutoJavaComplete.flngControlHeadersIDFK = rc.flngControlHeadersIDFK ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.fstrFileType = rc.fstrFileType ";
                strSQL += "AND tj.fstrTaxForm = rc.fstrTaxForm ";
                strSQL += "AND tj.flngCtlBlock = rc.flngBlock ";
                strSQL += "AND tj.flngOutOrder = rc.flngOrder ";
                strSQL += "AND tj.flngOutOrder > 0); ";
                gc.DoExecute(strSQL);


                // Control 1 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngControl1IDFK = rc.IDrfrControls ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.fstrFileType = rc.fstrFileType ";
                strSQL += "AND tj.fstrTaxForm = rc.fstrTaxForm ";
                strSQL += "AND tj.flngCtlBlock = rc.flngBlock ";
                strSQL += "AND tj.flngC1Order = rc.flngOrder ";
                strSQL += "AND tj.flngC1Order > 0); ";
                gc.DoExecute(strSQL);

                // Control 2 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngControl2IDFK = rc.IDrfrControls ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.fstrFileType = rc.fstrFileType ";
                strSQL += "AND tj.fstrTaxForm = rc.fstrTaxForm ";
                strSQL += "AND tj.flngCtlBlock = rc.flngBlock ";
                strSQL += "AND tj.flngC2Order = rc.flngOrder ";
                strSQL += "AND tj.flngC2Order > 0); ";
                gc.DoExecute(strSQL);

                // Name 1 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngName1IDFK = rc.IDrfrControls ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.fstrFileType = rc.fstrFileType ";
                strSQL += "AND tj.fstrTaxForm = rc.fstrTaxForm ";
                strSQL += "AND tj.flngCtlBlock = rc.flngBlock ";
                strSQL += "AND tj.flngN1Order = rc.flngOrder ";
                strSQL += "AND tj.flngN1Order > 0); ";
                gc.DoExecute(strSQL);

                // Name 2 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngName2IDFK = rc.IDrfrControls ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.fstrFileType = rc.fstrFileType ";
                strSQL += "AND tj.fstrTaxForm = rc.fstrTaxForm ";
                strSQL += "AND tj.flngCtlBlock = rc.flngBlock ";
                strSQL += "AND tj.flngN2Order = rc.flngOrder ";
                strSQL += "AND tj.flngN2Order > 0); ";
                gc.DoExecute(strSQL);

                // Return Header ID

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngReturnHeadersIDFK = rh.idReturnHeaders ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrReturnHeaders rh ON ";
                strSQL += "(tj.fstrFileType = rh.fstrFileType); ";
                gc.DoExecute(strSQL);

                lblOpStatus.Text = "ReLink Complete";

                // End of Gk-ReLink



            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }

        }
        protected void OnClick_NameLink(object sender, EventArgs e)
        {
            string strSQL = "";
            GoodConn gc = new GoodConn();
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                // Name Link save Format Type Name in Control
                strSQL = "UPDATE dbo.rfrControls ";
                strSQL += "SET dbo.rfrControls.fstrFJSfuncName = ft.fstrFJSfuncName ";
                strSQL += "FROM rfrControls rc INNER JOIN rfrFormatTypes ft ON ";
                strSQL += "(rc.flngFormatIDFK = ft.IDrfrFormatTypes); ";
                gc.DoExecute(strSQL);


                // NameLink for tblAutoJavaComplete - Clear All

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET fstrFuncName = ' ', ";
                strSQL += "fstrFileType = ' ', ";
                strSQL += "fstrTaxForm = ' ', ";
                strSQL += "flngCtlBlock = 0, ";
                strSQL += "flngOutOrder = 0, ";
                strSQL += "flngC1Order = 0, ";
                strSQL += "flngC2Order = 0, ";
                strSQL += "flngN1Order = 0, ";
                strSQL += "flngN2Order = 0; ";

                gc.DoExecute(strSQL);

                // Function Name

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.fstrFuncName = rj.fstrFuncName ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrJavaAutoFunctions rj ON ";
                strSQL += "(tj.flngJavaFuncIDFK = rj.IDrfrJavaAutoFunctions); ";

                gc.DoExecute(strSQL);

                // FileType, TaxForm, CtlBlock, OutOrder, ControlHeadersIDFK

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.fstrFileType = rc.fstrFileType, ";
                strSQL += "    dbo.tblAutoJavaComplete.fstrTaxForm = rc.fstrTaxForm, ";
                strSQL += "    dbo.tblAutoJavaComplete.flngCtlBlock = rc.flngBlock, ";
                strSQL += "    dbo.tblAutoJavaComplete.flngOutOrder = rc.flngOrder, ";
                strSQL += "    dbo.tblAutoJavaComplete.flngControlHeadersIDFK = rc.flngControlHeadersIDFK ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.flngControlOutIDFK = rc.IDrfrControls); ";
                gc.DoExecute(strSQL);

                // Control 1 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngC1Order = rc.flngOrder ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.flngControl1IDFK = rc.IDrfrControls ";
                strSQL += "AND tj.flngControl1IDFK > 0); ";
                gc.DoExecute(strSQL);


                // Control 2 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngC2Order = rc.flngOrder ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.flngControl2IDFK = rc.IDrfrControls ";
                strSQL += "AND tj.flngControl2IDFK > 0); ";
                gc.DoExecute(strSQL);

                // Name 1 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngN1Order = rc.flngOrder ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.flngName1IDFK = rc.IDrfrControls ";
                strSQL += "AND tj.flngName1IDFK > 0); ";
                gc.DoExecute(strSQL);

                // Name 2 Order

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngN2Order = rc.flngOrder ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrControls rc ON ";
                strSQL += "(tj.flngName2IDFK = rc.IDrfrControls ";
                strSQL += "AND tj.flngName2IDFK > 0); ";
                gc.DoExecute(strSQL);

                // Return Header ID

                strSQL = "UPDATE dbo.tblAutoJavaComplete ";
                strSQL += "SET dbo.tblAutoJavaComplete.flngReturnHeadersIDFK = rh.idReturnHeaders ";
                strSQL += "FROM tblAutoJavaComplete tj INNER JOIN rfrReturnHeaders rh ON ";
                strSQL += "(tj.fstrFileType = rh.fstrFileType); ";
                gc.DoExecute(strSQL);

                lblOpStatus.Text = "NameLink Complete";

                // End of Gk-NameLink
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