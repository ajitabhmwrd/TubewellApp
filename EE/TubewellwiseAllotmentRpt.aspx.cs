using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_TubewellwiseRpt : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindDDLFinYr();
            bindgvTubewell();
        }
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
        bindDDLTubewell();
        bindgvTubewell();
    }
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvTubewell();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {

    }

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTubewell.PageIndex = e.NewPageIndex;
        bindgvTubewell();
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
            DataTable dt = gd.getDataTable("getAllotmenTubewellWise", prm);
            bc.bindGV(gvTubewell, dt);
            decimal TEstimatedCost = dt.AsEnumerable().Sum(row => row.Field<decimal>("EstimatedCost"));
            decimal TAllotmentPlan = dt.AsEnumerable().Sum(row => row.Field<decimal>("AllotmentPlan"));
            int TAllotmentPlanCount = dt.AsEnumerable().Sum(row => row.Field<int>("AllotmentPlanCount"));
            decimal TAllotmentNonPlan = dt.AsEnumerable().Sum(row => row.Field<decimal>("AllotmentNonPlan"));
            int TAllotmentNonPlanCount = dt.AsEnumerable().Sum(row => row.Field<int>("AllotmentNonPlanCount"));
            gvTubewell.FooterRow.Cells[6].Text = "Total";
            gvTubewell.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[7].Text = TEstimatedCost.ToString();
            gvTubewell.FooterRow.Cells[8].Text = TAllotmentPlan.ToString();
            gvTubewell.FooterRow.Cells[9].Text = TAllotmentPlanCount.ToString();
            gvTubewell.FooterRow.Cells[10].Text = TAllotmentNonPlan.ToString();
            gvTubewell.FooterRow.Cells[11].Text = TAllotmentNonPlanCount.ToString();
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

    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        //ddlDist.ClearSelection();
        bindDDLBlock();
        //ddlBlock.ClearSelection();
        //ddlPanchayat.ClearSelection();
        //ddlTubewell.ClearSelection();
        ddlFinYear.ClearSelection();
        bindgvTubewell();
    }
}