using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_RptTwEstimatedCost : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindDDLFinYr();
            bindDDLAllotmentHead();
            bindgvTubewell();
            
        }
    }
    public void bindDDLAllotmentHead()
    {
        try
        {

            DataTable dt = gd.getDataTable("getAllotmentHead");
            bc.bindDDL(ddlHead, dt, "HeadType", "HeadID");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@ID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@EstID",(object)DBNull.Value),
                        new SqlParameter("@FinaciyalYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID",ddlHead.SelectedValue=="0"?(object)DBNull.Value:ddlHead.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellEstimatedCost", prm);
            bc.bindGV(gvTubewell, dt);
            foreach (GridViewRow gvr in gvTubewell.Rows)
            {
                Label lblElectricalAmount = gvr.FindControl("lblElectricalAmount") as Label;
                Label lblMechenicalAmount = gvr.FindControl("lblMechenicalAmount") as Label;
                Label lblCivilAmount = gvr.FindControl("lblCivilAmount") as Label;
                Label lblRevisedEstimatedCost = gvr.FindControl("lblRevisedEstimatedCost") as Label;
                Label lblTEstimatedCost = gvr.FindControl("lblTEstimatedCost") as Label;
                Label lblAAAmount = gvr.FindControl("lblAAAmount") as Label;

                if (string.IsNullOrWhiteSpace(lblElectricalAmount.Text))
                {
                    lblElectricalAmount.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblMechenicalAmount.Text))
                {
                    lblMechenicalAmount.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblCivilAmount.Text))
                {
                    lblCivilAmount.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblRevisedEstimatedCost.Text))
                {
                    lblRevisedEstimatedCost.Text = "N/A";
                }
                else
                {
                    lblTEstimatedCost.Text = lblRevisedEstimatedCost.Text;
                    lblRevisedEstimatedCost.Text = "Revised";                    
                }
                if (string.IsNullOrWhiteSpace(lblAAAmount.Text))
                {
                    lblAAAmount.Text = "N/A";
                }
            }
            decimal ElectricalAmount = 0, MechenicalAmount = 0, CivilAmount = 0, TEstimatedCost = 0,// RevisedEstimatedCost= 0,
                AAAmount=0;
            foreach(DataRow dr in dt.Rows)
            {
                ElectricalAmount = ElectricalAmount + getDecimal(dr["ElectricalAmount"]);
                MechenicalAmount = MechenicalAmount + getDecimal(dr["MechenicalAmount"]);
                CivilAmount = CivilAmount + getDecimal(dr["CivilAmount"]);
                if (getDecimal(dr["RevisedEstimatedCost"].ToString())<=0)
                {
                    TEstimatedCost = TEstimatedCost + getDecimal(dr["TEstimatedCost"]);
                }
                else
                {
                    TEstimatedCost = TEstimatedCost + getDecimal(dr["RevisedEstimatedCost"]);
                }
                //RevisedEstimatedCost = TEstimatedCost + getDecimal(dr["RevisedEstimatedCost"]);
                AAAmount = AAAmount + getDecimal(dr["AAAmount"]);
            }
            gvTubewell.FooterRow.Cells[10].Text = "Total";
            gvTubewell.FooterRow.Cells[10].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[11].Text = AAAmount.ToString();
            gvTubewell.FooterRow.Cells[12].Text = ElectricalAmount.ToString();
            gvTubewell.FooterRow.Cells[13].Text = MechenicalAmount.ToString();
            gvTubewell.FooterRow.Cells[14].Text = CivilAmount.ToString();
            gvTubewell.FooterRow.Cells[15].Text = TEstimatedCost.ToString();
            //gvTubewell.FooterRow.Cells[16].Text = RevisedEstimatedCost.ToString();

        }
        catch (Exception ex)
        {
        }
    }
    public decimal getDecimal(object value)
    {
        string val = value.ToString();
        try
        {
            return decimal.Parse(val);
        }
        catch (Exception)
        {
            
        }
        return 0.0m;
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
    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlDist.ClearSelection();
        bindDDLBlock();
        bindDDLPanchyat();
        bindDDLTubewell();
        ddlFinYear.ClearSelection();
        bindgvTubewell();
    }
    protected void lnkDownload_Click(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        bindgvTubewell();
        gvTubewell.PageIndex = e.NewPageIndex;
        gvTubewell.DataBind();
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

    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvTubewell();
    }

    protected void ddlHead_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
}