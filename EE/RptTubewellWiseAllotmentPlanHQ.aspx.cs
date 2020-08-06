using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_TubewellWiseAllotmentPlanHQ : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Calendar1.EndDate = DateTime.Now;
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindDDLFinYr();
            bindgvTubewell();
        }
    }
    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAdmAprBySearch", prm);
            bc.bindGV(gvTubewell, dt);
            int AlotmentCount = dt.AsEnumerable().Sum(row => row.Field<int>("AlotmentCount"));
            decimal EstimatedCost = dt.AsEnumerable().Sum(row => row.Field<decimal>("EstimatedCost"));
            decimal TAllotmentAmount = dt.AsEnumerable().Sum(row => row.Field<decimal>("TAllotmentAmount"));
            gvTubewell.FooterRow.Cells[5].Text = "Total";
            gvTubewell.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[6].Text = EstimatedCost.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TAllotmentAmount.ToString();
            gvTubewell.FooterRow.Cells[8].Text = AlotmentCount.ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    
    public void bindDDLBlock()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByDistCode", prm);
            bc.bindDDL(ddlBlock, dt, "BlockName", "BlockCode");
            bindDDLPanchyat();
        }
        catch (Exception ex)
        {
        }
    }
    public void bindDDLPanchyat()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@BlockCode",ddlBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllPanchaytByBlockCode", prm);
            bc.bindDDL(ddlPanchayat, dt, "PanchayatName", "PanchayatCode");
            bindDDLTubewell();
        }
        catch (Exception ex)
        {
        }
    }
    public void bindDDLTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        //new SqlParameter("@VILLCODE",ddlVillage.SelectedValue),
                        new SqlParameter("@PanchayatCode",ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockCode",ddlBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellByPanchayat", prm);
            bc.bindDDL(ddlTubewell, dt, "Name", "ID");
        }
        catch (Exception ex)
        {
        }
    }
    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLPanchyat();
        bindgvTubewell();
    }
    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        //bindDDLVill();
        bindDDLTubewell();
        bindgvTubewell();
    }    
    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvTubewell();
    }
    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
    public void bindDDLFinYr()
    {
        try
        {

            DataTable dt = gd.getDataTable("getFinYear");
            bc.bindDDL(ddlFinYear, dt, "FinYear", "FinYear");
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlFinYear.ClearSelection();
        bindDDLBlock();
        //ddlBlock.ClearSelection();
        //ddlPanchayat.ClearSelection();
        //ddlTubewell.ClearSelection();
        bindgvTubewell();
    }
    public void bindgvAllotment()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",lblTWID.Text),
                        new SqlParameter("@AdmAprID",lblAdmAprID.Text),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllotmentbyTubewellHQ", prm);
            bc.bindGV(gvAllotment, dt);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        mp1.Hide();
    }       
    protected void lblAlotmentCount_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            lblAdmAprID.Text = ((Label)gvr.FindControl("lblID")).Text;
            lblTWID.Text = ((Label)gvr.FindControl("lblTubewellID")).Text;
            lblTWName.Text = ((Label)gvr.FindControl("lblName")).Text;
            lblMessageMP.Text = "";
            bindgvAllotment();
            mp1.Show();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel(gvTubewell, "PlanHead");
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
        this.bindgvTubewell();
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
}