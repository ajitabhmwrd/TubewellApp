using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_rptTwStatusChangeListBetDate : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindDDLDistrict();
            bindDDLStatus();
            try
            {
                string distCode = Context.Items["DistCode"].ToString();
                string TubewellStatus = Context.Items["TubewellStatus"].ToString();
                string FromDate = Context.Items["FromDate"].ToString();
                string ToDate = Context.Items["ToDate"].ToString();

                ddlDist.SelectedValue = distCode;
                ddlStatus.Items.FindByText(TubewellStatus).Selected = true;
                txtStartDate.Text = FromDate;
                txtEndDate.Text = ToDate;
                bindGridview();
            }
            catch { }
        }
    }
    public void bindDDLDistrict()
    {
        try
        {

            DataTable dt = gd.getDataTable("getAllDistrict");
            bc.bindDDL(ddlDist, dt, "DistName", "DistCode");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindDDLStatus()
    {
        try
        {
            DataTable dt = gd.getDataTable("getTubewellStatus");
            bc.bindDDL(ddlStatus, dt, "Status", "ID");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindGridview()
    {
        try
        {
            lblHeading.Text = "Status Change between " + DateTime.Parse(txtStartDate.Text).ToString("dd MMM yy") + " and " + DateTime.Parse(txtEndDate.Text).ToString("dd MMM yy") + "";
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@TubewellStatus",ddlStatus.SelectedValue=="0"?(object)DBNull.Value:ddlStatus.SelectedItem.Text),
                        new SqlParameter("@FromDate",  DateTime.Parse(txtStartDate.Text).ToString("yyyy-MM-dd")),
                        new SqlParameter("@ToDate",  DateTime.Parse(txtEndDate.Text).ToString("yyyy-MM-dd"))
                    };
            DataTable dt = gd.getDataTable("getTubewellFunctionalChangeList", prm);
            bc.bindGV(gvTubewell,dt);
        }
        catch(Exception ex) {
            //lblHeading.Text = ex.Message.ToString();

        }
    }
    protected void btnView_Click(object sender, EventArgs e)
    {
        bindGridview();
    }

    private void ExportGridToExcel(GridView gv, string filename)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = filename + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        gv.AllowPaging = false;
        this.bindGridview();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        gv.GridLines = GridLines.Both;
        gv.HeaderStyle.Font.Bold = true;
        gv.RenderControl(htmltextwrtter);
        Response.Write(Regex.Replace(strwritter.ToString(), "</?(a|A).*?>", ""));
        Response.End();

    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel(gvTubewell, "FunctionalChangeRpt");
    }


    protected void btnClear_Click(object sender, EventArgs e)
    {

    }

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTubewell.PageIndex = e.NewPageIndex;
        bindGridview();
    }
}