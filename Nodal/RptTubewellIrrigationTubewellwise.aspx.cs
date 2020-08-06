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

public partial class Nodal_RptTubewellIrrigationTubewellwise : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindDDLCropType();
            bindDDLFinYr();
            bindDDLDistrict();
            bindgvIrrigation();
            
        }
    }
    public void bindDDLCropType()
    {
        try
        {

            DataTable dt = gd.getDataTable("getCropType");
            bc.bindDDL(ddlCropType, dt, "CropType", "CropTypeID");
        }
        catch (Exception ex)
        {
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
    public void bindDDLDistrict()
    {
        try
        {

            DataTable dt = gd.getDataTable("getAllDistrict");
            bc.bindDDL(ddlDist, dt, "DistName", "DistCode");
            bindDDLBlock();
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
                        new SqlParameter("@DistCode",ddlDist.SelectedValue)
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
                        new SqlParameter("@DistCode",ddlDist.SelectedValue),
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
        ddlCropType.ClearSelection();
        bindgvIrrigation();
        
    }
    public void bindgvIrrigation()
    {
        try
        {
            lblFinYr.Text = "All";
            lblCropType.Text = "All";
            if (ddlFinYear.SelectedValue!="0")
            {
                lblFinYr.Text = ddlFinYear.SelectedValue;
            }
            if (ddlCropType.SelectedValue != "0")
            {
                lblCropType.Text = ddlCropType.SelectedItem.Text;
            }
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@ID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@CropTypeID",ddlCropType.SelectedValue=="0"?(object)DBNull.Value:ddlCropType.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellIrrigationByTubwellWise", prm);
            bc.bindGV(gvIrrigation, dt);
            decimal TAreaDecimal = dt.AsEnumerable().Sum(row => row.Field<decimal>("AreaDecimal"));
            decimal TRevenueDemandRs = dt.AsEnumerable().Sum(row => row.Field<decimal>("RevenueDemandRs"));
            decimal TRevenueCollectionRs = dt.AsEnumerable().Sum(row => row.Field<decimal>("RevenueCollectionRs"));
            decimal TDepositedAmountInBank = dt.AsEnumerable().Sum(row => row.Field<decimal>("DepositedAmountInBank"));
            gvIrrigation.FooterRow.Cells[6].Text = "Total";
            gvIrrigation.FooterRow.Cells[6].HorizontalAlign = HorizontalAlign.Right;
            gvIrrigation.FooterRow.Cells[8].Text = TAreaDecimal.ToString();
            gvIrrigation.FooterRow.Cells[9].Text = TRevenueDemandRs.ToString();
            gvIrrigation.FooterRow.Cells[10].Text = TRevenueCollectionRs.ToString();
            gvIrrigation.FooterRow.Cells[11].Text = TDepositedAmountInBank.ToString();
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
        this.bindgvIrrigation();
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
        ExportGridToExcel(gvIrrigation, "FunctionalRpt");
    }
}