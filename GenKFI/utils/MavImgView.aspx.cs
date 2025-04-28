using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace GenKFI.utils
{
    public partial class MavImgView : System.Web.UI.Page
    {
        string strCurrPage;
        string strSQL = "";
        string strBatchId = "";
        string[] info;
        string strProgCode = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            #region common load code

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            //@#@# common code on all pages
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

            DataTable dt = new DataTable();
            int numRows = 0;

            //strProgCode = Session[ "kstrProgCode" ].ToString().Trim();
            //strProgLang = Session[ "kstrProgLang" ].ToString().Trim();
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            // this is the only thing that changes across pages
            strCurrPage = "Mavro Img View";
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            Session["kstrcurrPage"] = strCurrPage;
            ((Literal)Master.FindControl("titleLIT")).Text = UtilClass.NormalizeUN(Context.User.Identity.Name) + " : GenKFI Tax Programs - " + Session["tpSelHID"].ToString().Replace("ALL;", "").Replace(";", ", ") + " : " + Roles.GetRolesForUser(MyUserRole.UserName())[0];
            ((Literal)Master.FindControl("headerLIT")).Text = Session["tpSelHID"].ToString().Replace("ALL;", "").Replace(";", ", ") + " : " + strCurrPage;
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

                // same connection for all the select below
                try
                {
#if DEBUG
                    gc.Connect(Resources.connString);
#else
					gc.Connect( Resources.prodConnString );
#endif

                    //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
                    // fill the header info
                    info = Request.QueryString["Batch"].ToString().Split(';');
                    strBatchId = UtilClass.Sanitize(info[0]);
                    strProgCode = info[3];

                    strSQL = "SELECT fstrBatchID AS fstrBatchID";
                    strSQL += ", CONVERT( VARCHAR(10), fdtmBatchDate, 101 ) AS fstrBatchDate";
                    strSQL += ", fstrImgSrc AS fstrImageSource";
                    strSQL += ", fstrTaxProgram AS fstrTaxProgram";
                    strSQL += ", fintHeaderCount AS fintHeaderCount";
                    strSQL += ", fintBatchCount AS fintBatchCount";
                    strSQL += ", CONVERT( VARCHAR(15), fcurBatchAmount ) AS fcurBatchAmount";
                    strSQL += ", CONVERT( VARCHAR(15), fcurPaymentAmount ) AS fcurPaymentAmount";
                    strSQL += " FROM tblNM_BatchInfo a";
                    strSQL += " WHERE a.fstrTaxProgram = '" + strProgCode + "' ";
                    strSQL += " AND a.fstrBatchID = '" + strBatchId + "' ";

                    gc.DoSelect(strSQL);
                    dt = new DataTable();
                    numRows = gc.ReadSelect(out dt);
                    if (numRows > 0)
                    {
                        BatchId.Text = dt.Rows[0]["fstrBatchId"].ToString();
                        BatchDate.Text = dt.Rows[0]["fstrBatchDate"].ToString();
                        ImageSource.Text = dt.Rows[0]["fstrImageSource"].ToString();
                        TaxPgm.Text = dt.Rows[0]["fstrTaxProgram"].ToString();
                        HdrCount.Text = dt.Rows[0]["fintHeaderCount"].ToString();
                        ItemCount.Text = dt.Rows[0]["fintBatchCount"].ToString();
                        ItemAmount.Text = dt.Rows[0]["fcurBatchAmount"].ToString();
                        PymAmount.Text = dt.Rows[0]["fcurPaymentAmount"].ToString();
                    }
                    RtnModify.Text = "<a href=BatchModify.aspx?Batch=" + BatchId.Text + ";" + BatchDate.Text + ";" + ImageSource.Text + ";" + TaxPgm.Text + "> Batch Modify </a>";
                    ToEntry.Visible = false;
                    SeqTop.Text = "1";
                    if (Int16.Parse(HdrCount.Text) < 4)
                    {
                        SeqBot.Text = HdrCount.Text;
                    }
                    else
                    {
                        SeqBot.Text = "4";
                    }
                    // need the main table, the one used for the first form on the first page in the batch
                    strSQL = "SELECT DISTINCT ";
                    strSQL += "ch.fstrTable ";
                    strSQL += "FROM ";
                    strSQL += "rfrControlHeaders ch, ";
                    strSQL += "rfrReturnHeaders rh,";
                    strSQL += "tblNM_BatchImage i, ";
                    strSQL += "tblNM_BatchInfo b ";
                    strSQL += "WHERE ";
                    strSQL += "i.fstrBatchID = '" + BatchId.Text + "' AND ";
                    strSQL += "i.fstrTaxProgram = '" + TaxPgm.Text + "' AND ";
                    strSQL += "i.fstrFormName IS NOT NULL AND ";
                    strSQL += "ISNULL( i.fblnImageBlankSizeCheck, 0 ) = 0 AND ";
                    strSQL += "i.fstrBatchID = b.fstrBatchID AND ";
                    strSQL += "i.fstrTaxProgram = b.fstrTaxProgram AND ";
                    strSQL += "CONVERT( VARCHAR(10), i.fdtmScanDate, 101 ) = CONVERT( VARCHAR(10), b.fdtmBatchDate, 101 ) AND ";
                    strSQL += "RIGHT( i.fstrDLN, 2 ) = '01' AND ";
                    strSQL += "b.fstrDLN = i.fstrDLN AND ";
                    strSQL += "i.fstrFormName = ch.fstrTaxForm AND ";
                    strSQL += "i.fstrTaxProgram = rh.fstrTaxProgram AND ";
                    strSQL += "b.fstrForm = CONVERT( VARCHAR(50), rh.flngTaxYear ) AND ";
                    strSQL += "ch.flngBlock = 0 AND ";
                    strSQL += "rh.idReturnHeaders = ch.flngReturnHeadersIDFK;";

                    PymTbl.Text = (string)gc.DoScalar(strSQL);

                    Load_Stub(SeqTop.Text, SeqBot.Text);

                    gc.Disconnect();
                }
                catch ( Exception ex )
                {
                    UtilClass.RecordError(gc, ex);
                    gc.Disconnect();

                }   // End Try

            }     // !postback

        }    // Page Load

        protected void Load_Stub(string strStartSeq, string strEndSeq)
        {
            string strSQL = "";
            GoodConn gc = new GoodConn();
            DataTable dt;
            int numRows;
            string strMavPath = "";
            string strOffset = "";
            string strSize = "";
            string strGetSeq = "";


            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
    			gc.Connect( Resources.prodConnString );
#endif

                strSQL = "SELECT ";
                strSQL += "i.fstrImagePath, ";
                strSQL += "i.flngSequence, ";
                strSQL += "mo.fstrFormType, ";
                strSQL += "mo.flngFrontOffSet, ";
                strSQL += "mo.flngFrontSize, ";
                strSQL += " CONVERT( VARCHAR(10), r.fcurPayment ) AS PaymentAmount ";
                strSQL += "FROM ";
                strSQL += "tblNM_BatchImage i, ";
                strSQL += "tblNM_MavroOffset mo, ";
                strSQL += PymTbl.Text + " r ";
                strSQL += "WHERE ";
                strSQL += "i.fstrTaxProgram = '" + TaxPgm.Text + "' ";
                strSQL += "AND i.fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND i.flngSequence >= '" + strStartSeq + "' ";
                strSQL += "AND i.flngSequence <= '" + strEndSeq + "' ";
                strSQL += "AND i.fblnImageBlankSizeCheck = 0 ";
                strSQL += "AND i.fstrTaxProgram = mo.fstrTaxProgram ";
                strSQL += "AND i.fstrBatchId = mo.fstrBatchId ";
                strSQL += "AND i.flngSequence = mo.flngSequence ";
                strSQL += "AND mo.flngDocNumber = 1 ";
                strSQL += "AND i.fstrBatchId = r.fstrBatchId ";
                strSQL += "AND i.flngSequence = r.flngSequence ";

                gc.DoSelect(strSQL);
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    Label lbl1 = new Label();
                    Label lbl2 = new Label();
                    Label lblStart = new Label();
                    int CurSeq = 1;
                    lbl1.Text = "&nbsp;";
                    lbl2.Text = "</par>";
                    lblStart.Text = "<br>";
                    MavImgAmt.Controls.Add(lblStart);
                    MavImgStub.Controls.Add(lblStart);
                    
                    foreach (DataRow row in dt.Rows)
                    {
                        Image ImgM1 = new Image();
                        strGetSeq = dt.Rows[CurSeq-1]["flngSequence"].ToString();
                        Label lblType = new Label();
                        lblType.Style.Add("Left", "32px");
                        lblType.Height = 199;
                        lblType.Width = 499;
                        lblType.Text = "Seq: " + dt.Rows[CurSeq - 1]["flngSequence"].ToString() + " Pym: " + dt.Rows[CurSeq - 1]["PaymentAmount"].ToString() + lbl2.Text;

                        strMavPath = dt.Rows[CurSeq-1]["fstrImagePath"].ToString();
                        strOffset = dt.Rows[CurSeq-1]["flngFrontOffset"].ToString();
                        strSize = dt.Rows[CurSeq-1]["flngFrontSize"].ToString();
                            ImgM1.Style.Add("Left", "100px");
                        ImgM1.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Solid");
                        ImgM1.BorderWidth = Unit.Parse("1");
                        ImgM1.Attributes.Add("onclick", "Load_It(" + strGetSeq.ToString() + ");");
                        ImgM1.Height = 199;
                        ImgM1.Width = 499;
                        ImgM1.ImageUrl = "ViewMavImg.aspx?MavPath=" + strMavPath + "&MavOff=" + strOffset + "&MavSiz=" + strSize;
                        MavImgAmt.Controls.Add(lblStart);
                        MavImgStub.Controls.Add(lblStart);
                        MavImgAmt.Controls.Add(lblType);
                        MavImgStub.Controls.Add(ImgM1);
                        MavImgAmt.Controls.Add(lbl2);
                        MavImgStub.Controls.Add(lbl2);
                        CurSeq++;
                    }

                }

                Load_Disp();
                gc.Disconnect();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();

            }   // End Try

            
        }
        protected void Load_Disp()
        {
            lblInfo.Text = "  " + SeqTop.Text + " - " + SeqBot.Text + " of " + HdrCount.Text + "  ";
            
        }
        protected void Load_Prev(object sender, EventArgs e)
        {
            Int32 iTop, iBot;
            iTop = Int32.Parse(SeqTop.Text);
            if (iTop > 4)
            {
                iTop -= 4;
                iBot = iTop + 3;
                SeqTop.Text = iTop.ToString();
                SeqBot.Text = iBot.ToString();
            }
            Load_Stub(SeqTop.Text, SeqBot.Text);
        }
        protected void Load_Next(object sender, EventArgs e)
        {
            Int32 iTop, iBot, iMax;
            iTop = Int32.Parse(SeqTop.Text);
            iMax = Int32.Parse(HdrCount.Text);
            iTop += 4;
            if (iTop <= iMax)
            {
                iBot = iTop + 3;
                if (iBot > iMax)
                {
                    iBot = iMax;
                }
                SeqTop.Text = iTop.ToString();
                SeqBot.Text = iBot.ToString();
            }
            Load_Stub(SeqTop.Text, SeqBot.Text);

        }
        protected void Load_Detail(object sender, EventArgs e)
            //(string strGetSeq)
        {
            string strSQL = "";
            GoodConn gc = new GoodConn();
            DataTable dt;
            int numRows;
            int CurDoc;
            string strMavPath = "";
            string strOffset = "";
            string strSize = "";
            string SeqKey = ((HiddenField)Master.FindControl("hidSeqKey")).Value;
            SeqHld.Text = "Seq: " + SeqKey;
            ToEntry.Text = "<a href=entry/KeyEntry.aspx?Batch=" + BatchId.Text + "&BatchDate=" + BatchDate.Text + "&ImageSource=" + ImageSource.Text + "&TP=" + TaxPgm.Text + "&Sequence=" + SeqKey.ToString() + "> " + SeqKey.ToString() + " </a>";
            ToEntry.Visible = true;

            // same connection for all the select below
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
    			gc.Connect( Resources.prodConnString );
#endif

                strSQL = "SELECT ";
                strSQL += "i.fstrImagePath, ";
                strSQL += "mo.flngDocNumber, ";
                strSQL += "mo.fstrFormType, ";
                strSQL += "mo.flngFrontOffSet, ";
                strSQL += "mo.flngFrontSize, ";
                strSQL += "mo.flngRearOffset, ";
                strSQL += "mo.flngRearSize ";
                strSQL += "FROM ";
                strSQL += "tblNM_BatchImage i, ";
                strSQL += "tblNM_MavroOffset mo ";
                strSQL += "WHERE ";
                strSQL += "i.fstrTaxProgram = '" + TaxPgm.Text + "' ";
                strSQL += "AND i.fstrBatchId = '" + BatchId.Text + "' ";
                strSQL += "AND i.flngSequence = '" + SeqKey + "' ";
                strSQL += "AND i.fblnImageBlankSizeCheck = 0 ";
                strSQL += "AND i.fstrTaxProgram = mo.fstrTaxProgram ";
                strSQL += "AND i.fstrBatchId = mo.fstrBatchId ";
                strSQL += "AND i.flngSequence = mo.flngSequence ";
                strSQL += "Order by mo.flngDocNumber";


                gc.DoSelect( strSQL );
                dt = new DataTable();
                numRows = gc.ReadSelect(out dt);
                if (numRows > 0)
                {
                    Label lbl1 = new Label();
                    Label lbl2 = new Label();
                    Label lblStart = new Label();
                    lbl1.Text = "&nbsp;";
                    lbl2.Text = "&nbsp;<br />";
                    lblStart.Text = "<br> ";
                    CurDoc = 1;
                    foreach (DataRow row in dt.Rows)
                    {
                        Image ImgM1 = new Image();
                        strMavPath = dt.Rows[CurDoc - 1]["fstrImagePath"].ToString();
                        strOffset = dt.Rows[CurDoc - 1]["flngFrontOffset"].ToString();
                        strSize = dt.Rows[CurDoc - 1]["flngFrontSize"].ToString();
                        ImgM1.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Solid");
                        ImgM1.BorderWidth = Unit.Parse("1");
                        ImgM1.Height = 199;
                        ImgM1.Width = 399;
                        ImgM1.ImageUrl = "ViewMavImg.aspx?MavPath=" + strMavPath + "&MavOff=" + strOffset + "&MavSiz=" + strSize;
                        MavImgDetail.Controls.Add(ImgM1);
                        MavImgDetail.Controls.Add(lbl1);
                         Image ImgM2 = new Image();
                        strMavPath = dt.Rows[CurDoc - 1]["fstrImagePath"].ToString();
                        strOffset = dt.Rows[CurDoc - 1]["flngRearOffset"].ToString();
                        strSize = dt.Rows[CurDoc - 1]["flngRearSize"].ToString();
                        ImgM2.BorderStyle = (BorderStyle)Enum.Parse(typeof(BorderStyle), "Solid");
                        ImgM2.BorderWidth = Unit.Parse("1");
                        ImgM2.Height = 199;
                        ImgM2.Width = 399;
                        ImgM2.ImageUrl = "ViewMavImg.aspx?MavPath=" + strMavPath + "&MavOff=" + strOffset + "&MavSiz=" + strSize;
                        if (int.Parse(strSize) > 0) 
                        {
                            MavImgDetail.Controls.Add(ImgM2);
                            MavImgDetail.Controls.Add(lbl2);
                        }
                        CurDoc++;
                    }

                }

                gc.Disconnect();

            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();

            }   // End Try

            Load_Stub(SeqTop.Text, SeqBot.Text);

        }
    }
}