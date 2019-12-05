using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JE_AddInspection : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
        }
    }
    public void bindDDLBlock()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@JEEmpID",Session["LoginId"].ToString())
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByJEEmpID", prm);
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

    public void bindDDLTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@VILLCODE",ddlVillage.SelectedValue),
                    new SqlParameter("@PanchayatCode",ddlPanchayat.SelectedValue),
                    new SqlParameter("@BlockCode",ddlBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellByVillage",prm);
            bc.bindDDL(ddlTubewell, dt, "Name", "ID");
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
                    //new SqlParameter("@Name",txtTubewellName.Text.Trim()),
                    //new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    //new SqlParameter("@BlockID",ddlBlock.SelectedValue),
                    //new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue),
                    //new SqlParameter("@VillageID",ddlVillage.SelectedValue),
                    //new SqlParameter("@Status",ddlStatus.SelectedItem.Text),
                    //new SqlParameter("@Type",ddlType.SelectedItem.Text),
                    //new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    //new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
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
        ddlBlock.ClearSelection();
        ddlPanchayat.ClearSelection();
        ddlVillage.ClearSelection();
    }

    protected void ddlVillage_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
    }
}