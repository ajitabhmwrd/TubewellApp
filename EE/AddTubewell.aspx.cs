using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AddTubewell : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindDDLStatus();
            bindDDLType();
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
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLVill()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@PanCode",ddlPanchayat.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllVillageByPanCode", prm);
            bc.bindDDL(ddlVillage, dt, "VILLNAME", "VILLCODE");
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLType()
    {
        try
        {
            DataTable dt = gd.getDataTable("getTubewellType");
            bc.bindDDL(ddlType, dt, "Type", "ID");
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

    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLPanchyat();
    }

    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLVill();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@Name",txtTubewellName.Text.Trim()),
                    new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockID",ddlBlock.SelectedValue),
                    new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue),
                    new SqlParameter("@VillageID",ddlVillage.SelectedValue),
                    new SqlParameter("@Status",ddlStatus.SelectedItem.Text),
                    new SqlParameter("@Type",ddlType.SelectedItem.Text),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("insCreateTubewell", prm);
            clear();
        }
        catch (Exception ex)
        {
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        clear();
    }
    public void clear()
    {
        
        txtTubewellName.Text = "";
        ddlBlock.ClearSelection();       
        ddlPanchayat.ClearSelection();
        ddlVillage.ClearSelection();
        ddlStatus.ClearSelection();
        ddlType.ClearSelection();
    }
}