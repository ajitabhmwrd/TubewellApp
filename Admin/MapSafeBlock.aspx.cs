using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Operator_MapSafeBlock : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindgvCriticalStatus();
        }
    }

    public void bindgvCriticalStatus()
    {
        SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@BlockCode",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue)
                    };
        DataTable dt = gd.getDataTable("getSafeBlock", prm);
        bc.bindGV(gvTubewell, dt);
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
    
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvCriticalStatus();
    }



    protected void btnsave_Click(object sender, EventArgs e)
    {
        SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",ddlDist.SelectedValue),
                    new SqlParameter("@BlockCode",ddlBlock.SelectedValue),
                    new SqlParameter("@IsSafeBlockPMKSY",ddlIsSafeBlock.SelectedValue),
                    new SqlParameter("@SOD",txtSOD.Text),
                    new SqlParameter("@AvgRainfall",txtAvgRainfall.Text),
                    new SqlParameter("@UpdatedByID",Session["LoginId"].ToString()),
                    new SqlParameter("@UpdatedByIP",customVariables.GetIPAddress())
                            };
        lblMessage.Text = gd.insExecuteSP("updAssignSafeBlock", prm);
        bindgvCriticalStatus();
        reset();
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        reset();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)btn.NamingContainer;
        Label lblBlockCode = gvr.FindControl("lblBlockCode") as Label;
        Label lblDistCode = gvr.FindControl("lblDistCode") as Label;
        Label lblIsSafeBlockPMKSY = gvr.FindControl("lblIsSafeBlockPMKSY") as Label;
        Label lblsod = gvr.FindControl("lblsod") as Label;
        Label lblAvgRainfall = gvr.FindControl("lblAvgRainfall") as Label;
        ddlDist.SelectedValue = lblDistCode.Text;
        ddlIsSafeBlock.SelectedValue = lblIsSafeBlockPMKSY.Text;
        txtSOD.Text = lblsod.Text;
        txtAvgRainfall.Text = lblAvgRainfall.Text;
        bindDDLBlock();
        ddlBlock.SelectedValue = lblBlockCode.Text;
        editView();
    }

    public void editView()
    {
        ddlDist.Enabled = false;
        ddlBlock.Enabled = false;
        btnsave.Text = "Update";
    }
    public void reset()
    {
        ddlDist.Enabled = true;
        ddlBlock.Enabled = true;
        ddlDist.ClearSelection();
        bindDDLBlock();
        bindgvCriticalStatus();
        txtAvgRainfall.Text = "";
        txtSOD.Text = "";
        btnsave.Text = "Save";
    }

    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvCriticalStatus();
    }
}