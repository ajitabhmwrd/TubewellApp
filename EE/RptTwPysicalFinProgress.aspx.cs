using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_RptTwPysicalFinProgress : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindDDLAllotmentHead();          
            bindDDLFinYr();
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
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@ID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@PFID",(object)DBNull.Value),
                        new SqlParameter("@FinYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID",ddlHead.SelectedValue=="0"?(object)DBNull.Value:ddlHead.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTwPhysFinProgress", prm);
            bc.bindGV(gvTubewell, dt);
            foreach(GridViewRow gvr in gvTubewell.Rows)
            {
                Label lblElectProgress = gvr.FindControl("lblElectProgress") as Label;
                Label lblMechProgress = gvr.FindControl("lblMechProgress") as Label;
                Label lblCivilProgress = gvr.FindControl("lblCivilProgress") as Label;
                if(string.IsNullOrWhiteSpace(lblElectProgress.Text))
                {
                    lblElectProgress.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblMechProgress.Text))
                {
                    lblMechProgress.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblCivilProgress.Text))
                {
                    lblCivilProgress.Text = "N/A";
                }

            }
            decimal AgreementAmount = dt.AsEnumerable().Sum(row => row.Field<decimal>("AgreementAmount"));
            decimal ExpenditureAmount = dt.AsEnumerable().Sum(row => row.Field<decimal>("ExpenditureAmount"));
            gvTubewell.FooterRow.Cells[16].Text = "Total";
            gvTubewell.FooterRow.Cells[16].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[17].Text = AgreementAmount.ToString();
            gvTubewell.FooterRow.Cells[18].Text = ExpenditureAmount.ToString();
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