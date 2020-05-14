using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_TubewellAllotmentRpt : System.Web.UI.Page
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
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID",ddlHead.SelectedValue=="0"?(object)DBNull.Value:ddlHead.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllotmentBySearch", prm);
            bc.bindGV(gvTubewell, dt);
            decimal TAllotmentAmount = dt.AsEnumerable().Sum(row => row.Field<decimal>("AllotmentAmount"));
            gvTubewell.FooterRow.Cells[10].Text = "Total";
            gvTubewell.FooterRow.Cells[10].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[11].Text = TAllotmentAmount.ToString();
            foreach (GridViewRow gvr in gvTubewell.Rows)
            {
                LinkButton lnkDownload = gvr.FindControl("lnkDownload") as LinkButton;
                if (string.IsNullOrWhiteSpace(lnkDownload.CommandArgument))
                {
                    lnkDownload.Enabled = false;
                    lnkDownload.Text = "Not Uploaded";
                }
                else
                {
                    lnkDownload.Enabled = true;
                    lnkDownload.Text = "Download pdf";
                }

            }
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

    protected void ddlHead_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlDist.ClearSelection();
        bindDDLBlock();
        //ddlBlock.ClearSelection();
        //ddlPanchayat.ClearSelection();
        //ddlTubewell.ClearSelection();
        ddlFinYear.ClearSelection();
        ddlHead.ClearSelection();
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
}