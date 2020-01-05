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
            bindDDLScada();
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
            bc.bindDDL(ddlHandOverBlock, dt, "BlockName", "BlockCode");
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
    public void bindDDLScada()
    {
        try
        {
            DataTable dt = gd.getDataTable("getScadaStatus");
            bc.bindDDL(ddlScadaStatus, dt, "ScadaStatus", "ID");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindDDLHandedOverPanchyat()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@BlockCode",ddlHandOverBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllPanchaytByBlockCode", prm);
            bc.bindDDL(ddlHandOverPanchayat, dt, "PanchayatName", "PanchayatCode");
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
                    new SqlParameter("@BlockCode",ddlBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllVillageByBlockCode", prm);
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
            SqlParameter HandedOverDate = new SqlParameter("@HandedOverDate", DBNull.Value);
            SqlParameter HandedOverBlockID = new SqlParameter("@HandedOverBlockID", DBNull.Value);
            SqlParameter HandedOverPanchyatID = new SqlParameter("@HandedOverPanchyatID", DBNull.Value);
            if (ddlIsHandedOver.SelectedValue=="Y")
            { 
                HandedOverDate = new SqlParameter("@HandedOverDate", DateTime.Parse(txtHandedOverDate.Text.Trim()).ToString("yyyy-MM-dd"));
                HandedOverBlockID = new SqlParameter("@HandedOverBlockID", ddlHandOverBlock.SelectedValue);
                HandedOverPanchyatID = new SqlParameter("@HandedOverPanchyatID", ddlHandOverPanchayat.SelectedValue);
            }
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@Name",txtTubewellName.Text.Trim()),
                    new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockID",ddlBlock.SelectedValue),
                    new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue),
                    new SqlParameter("@VillageID",ddlVillage.SelectedValue),
                    new SqlParameter("@Status",ddlStatus.SelectedItem.Text),
                    new SqlParameter("@Type",ddlType.SelectedItem.Text),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@IsHandedOver",ddlIsHandedOver.SelectedValue),
                    HandedOverBlockID,
                    HandedOverPanchyatID,
                    new SqlParameter("@ScadaStatus",ddlScadaStatus.SelectedValue),
                    new SqlParameter("@Longitude",txtLongitude.Text),
                    new SqlParameter("@Latitude",txtLatitude.Text),
                    HandedOverDate,
                    new SqlParameter("@ConsumerID",txtCANo.Text),
                    new SqlParameter("@ConsernFarmer1",txtFarmer1Name.Text),
                    new SqlParameter("@ConsernFarmer1Mobile",txtFarmer1Mobile.Text),
                    new SqlParameter("@ConsernFarmer2",txtFarmer2Name.Text),
                    new SqlParameter("@ConsernFarmer2Mobile",txtFarmer2Mobile.Text)
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
        ddlScadaStatus.ClearSelection();
        ddlIsHandedOver.ClearSelection();
        ddlHandOverBlock.ClearSelection();
        ddlHandOverPanchayat.ClearSelection();
        txtLongitude.Text = "";
        txtLatitude.Text = "";
        txtCANo.Text = "";
        txtHandedOverDate.Text = "";
        txtFarmer1Mobile.Text = "";
        txtFarmer1Name.Text = "";
        txtFarmer2Mobile.Text = "";
        txtFarmer2Name.Text = "";
        ddlHandOverPanchayat.Enabled = true;
        ddlHandOverBlock.Enabled = true;
        txtHandedOverDate.Enabled = true;
        rfvHandedOverDate.Enabled = true;
        rfvHandOverPanchayat.Enabled = true;
        rfvHandOverBlock.Enabled = true;

    }

    protected void ddlHandOverBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLHandedOverPanchyat();
    }

    protected void ddlIsHandedOver_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlIsHandedOver.SelectedValue == "N")
        {
            ddlHandOverPanchayat.Enabled = false;
            ddlHandOverBlock.Enabled = false;
            txtHandedOverDate.Enabled = false;
            rfvHandedOverDate.Enabled = false;
            rfvHandOverPanchayat.Enabled = false;
            rfvHandOverBlock.Enabled = false;
        }
        else
        {
            ddlHandOverPanchayat.Enabled = true;
            ddlHandOverBlock.Enabled = true;
            txtHandedOverDate.Enabled = true;
            rfvHandedOverDate.Enabled = true;
            rfvHandOverPanchayat.Enabled = true;
            rfvHandOverBlock.Enabled = true;

        }
    }
}