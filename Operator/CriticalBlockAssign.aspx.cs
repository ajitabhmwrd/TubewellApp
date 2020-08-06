using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Operator_CriticalBlockAssign : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindDDLCriticalStatus();
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
        DataTable dt = gd.getDataTable("getCriticalBlock", prm);
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
    public void bindDDLCriticalStatus()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getCriticalStatusType", prm);
            bc.bindDDL(ddlCriticalStatus, dt, "CriticalType", "CriticalID");
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
                    new SqlParameter("@CriticalID",ddlCriticalStatus.SelectedValue=="4"?(object)DBNull.Value:ddlCriticalStatus.SelectedValue),
                    new SqlParameter("@UpdatedByID",Session["LoginId"].ToString()),
                    new SqlParameter("@UpdatedByIP",customVariables.GetIPAddress())
                            };
        lblMessage.Text= gd.insExecuteSP("updAssignCriticalBlock", prm);
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
        Label lblCriticalID = gvr.FindControl("lblCriticalID") as Label;
        ddlDist.SelectedValue = lblDistCode.Text;
        bindDDLBlock();
        ddlBlock.SelectedValue = lblBlockCode.Text;
        ddlCriticalStatus.SelectedValue = lblCriticalID.Text;
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
        ddlCriticalStatus.ClearSelection();
        bindgvCriticalStatus();
        btnsave.Text = "Save";
    }

    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvCriticalStatus();
    }
}