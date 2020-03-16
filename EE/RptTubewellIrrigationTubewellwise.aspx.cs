using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_RptTubewellIrrigationTubewellwise : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindDDLFinYr();
            bindDDLBlock();
            bindgvIrrigation();
            
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
        bindgvIrrigation();
    }
    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
        bindgvIrrigation();
    }
    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvIrrigation();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlBlock.ClearSelection();
        bindDDLPanchyat();
        ddlFinYear.ClearSelection();
        bindgvIrrigation();
    }
    public void bindgvIrrigation()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@ID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellIrrigationByTubwellWise", prm);
            bc.bindGV(gvIrrigation, dt);
            decimal TAreaDecimal = dt.AsEnumerable().Sum(row => row.Field<decimal>("AreaDecimal"));
            decimal TRevenueDemandRs = dt.AsEnumerable().Sum(row => row.Field<decimal>("RevenueDemandRs"));
            decimal TRevenueCollectionRs = dt.AsEnumerable().Sum(row => row.Field<decimal>("RevenueCollectionRs"));
            decimal TDepositedAmountInBank = dt.AsEnumerable().Sum(row => row.Field<decimal>("DepositedAmountInBank"));
            gvIrrigation.FooterRow.Cells[5].Text = "Total";
            gvIrrigation.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            gvIrrigation.FooterRow.Cells[7].Text = TAreaDecimal.ToString();
            gvIrrigation.FooterRow.Cells[8].Text = TRevenueDemandRs.ToString();
            gvIrrigation.FooterRow.Cells[9].Text = TRevenueCollectionRs.ToString();
            gvIrrigation.FooterRow.Cells[10].Text = TDepositedAmountInBank.ToString();
        }
        catch (Exception ex)
        {
        }
    }
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvIrrigation();
    }
    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvIrrigation();
    }
       
    protected void gvIrrigation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvIrrigation.PageIndex = e.NewPageIndex;
        bindgvIrrigation();
    }
}