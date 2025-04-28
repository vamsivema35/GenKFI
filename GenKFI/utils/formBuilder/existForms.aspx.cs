using GenKFI.Properties;
using System;
using System.Data;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace GenKFI.utils.formBuilder
{
    public partial class existForms : System.Web.UI.Page
    {
        //string strProgCode;
        //string strProgLang;
        string strCurrPage;

        protected void Page_Load(object sender, EventArgs e)
        {
            #region common load code

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            //@#@# common code on all pages
            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#

            //@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#@#
            // this is the only thing that changes across pages
            strCurrPage = "Existing Forms";
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
                LoadLists();
            }
        }

        private void LoadLists()
        {
            GoodConn gc = new GoodConn();
            string statement = "";
            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                // load all the headers for the forms
                // no more GROUP BY
                statement = "SELECT idReturnHeaders, fstrFileType, ";
                statement += "flngTaxYear, fstrTaxProgram ";
                statement += "FROM rfrReturnHeaders ";
                statement += "WHERE fstrTaxProgram = '" + Session["tpSelHID"].ToString() + "' ";
                statement += "ORDER BY fstrTaxProgram, flngTaxYear, fstrFileType;";
                gc.DoSelect(statement);
                DataTable dt = new DataTable();
                int numRows = gc.ReadSelect(out dt);
                existFormsRPT.DataSource = null;
                existFormsRPT.DataBind();
                if (numRows > 0)
                {
                    existFormsRPT.DataSource = dt;
                    existFormsRPT.DataBind();
                }

                // load some years
                int thisYear = DateTime.Now.Year;
                taxYearDDL.Items.Clear();
                taxYearDDL.Items.Add(new ListItem("Select A Year", "-1"));
                for (int i = thisYear + 3; i > thisYear - 15; i--)
                    taxYearDDL.Items.Add(new ListItem(i.ToString(), i.ToString()));

                taxCodeLIT.Text = Session["tpSelHID"].ToString();

                gc.Disconnect();
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnClick_newBTN(object sender, EventArgs e)
        {
            GoodConn gc = new GoodConn();

            try
            {
#if DEBUG
                gc.Connect(Resources.connString);
#else
				gc.Connect( Resources.prodConnString );
#endif
                // make a new return header with default values
                string statement = "INSERT INTO rfrReturnHeaders ";
                statement += "( fstrFileType, fstrTaxProgram, flngTaxYear ) ";
                statement += "VALUES ( '" + Session["tpSelHID"].ToString() + "R--', '" + Session["tpSelHID"].ToString() + "', -1 );";
                gc.DoExecute(statement);

                // make sure to get the new ID
                string newID = gc.DoScalar("SELECT SCOPE_IDENTITY();").ToString();

                gc.Disconnect();
                // and redirect them to the block page to start adding blocks and controls
                Response.Redirect("blockBatch.aspx?nn=1&rhID=" + newID, false);
            }
            catch (Exception ex)
            {
                UtilClass.RecordError(gc, ex);
                gc.Disconnect();
            }
        }

        protected void OnItemDataBound_existFormsRPT(object sender, RepeaterItemEventArgs e)
        {
            // filter to just the items
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // build the link for the blockBatch.aspx edit
                ((HyperLink)e.Item.FindControl("editLNK")).NavigateUrl = "blockBatch.aspx?rhID=" + ((DataRowView)e.Item.DataItem).Row["idReturnHeaders"].ToString();

            }
        }
    }
}
