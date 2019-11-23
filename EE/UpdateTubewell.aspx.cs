using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_UpdateTubewell : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string ID = Context.Items["ID"].ToString();
                lblTubewellID.Text = ID.ToUpper();
                SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@ID",ID)
                    };
                DataTable dt = gd.getDataTable("getTubewellByID", prm);
                if (dt.Rows.Count == 1)
                {
                    txtTubewellName.Text = dt.Rows[0]["Name"].ToString();
                    bindDDLBlock();
                    bindDDLStatus();
                    bindDDLType();
                    ddlBlock.SelectedValue= dt.Rows[0]["BlockID"].ToString();
                    bindDDLPanchyat();
                    ddlPanchayat.SelectedValue= dt.Rows[0]["PanchyatID"].ToString();
                    bindDDLVill();
                    ddlVillage.SelectedValue = dt.Rows[0]["VillageID"].ToString();
                    ddlStatus.Items.FindByText(dt.Rows[0]["Status"].ToString()).Selected=true;
                    ddlType.Items.FindByText(dt.Rows[0]["Type"].ToString()).Selected = true;

                }
                else
                    Response.Redirect("TubewellDetail.aspx");
            }
            catch (Exception ex)
            {
                Response.Redirect("TubewellDetail.aspx");
            }
            
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

  
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@ID",lblTubewellID.Text.Trim()),
                    new SqlParameter("@Name",txtTubewellName.Text.Trim()),
                    new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockID",ddlBlock.SelectedValue),
                    new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue),
                    new SqlParameter("@VillageID",ddlVillage.SelectedValue),
                    new SqlParameter("@Status",ddlStatus.SelectedItem.Text),
                    new SqlParameter("@Type",ddlType.SelectedItem.Text),
                    new SqlParameter("@updByID",Session["LoginId"].ToString()),
                    new SqlParameter("@updByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("updTubewell", prm);
        }
        catch (Exception ex)
        {
        }
    }
}