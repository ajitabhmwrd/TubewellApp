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
                    bindDDLScada();
                    ddlIsHandedOver.SelectedValue= dt.Rows[0]["IsHandedOver"].ToString();
                    ddlHandOverBlock.SelectedValue= dt.Rows[0]["HandedOverBlockID"].ToString();
                    bindDDLHandedOverPanchyat();
                    ddlHandOverPanchayat.SelectedValue = dt.Rows[0]["HandedOverPanchyatID"].ToString();
                    ddlScadaStatus.SelectedValue = dt.Rows[0]["ScadaStatus"].ToString();
                    txtLongitude.Text = dt.Rows[0]["Longitude"].ToString();
                    txtLatitude.Text = dt.Rows[0]["Latitude"].ToString();
                    string HandedOverDate = dt.Rows[0]["HandedOverDate"].ToString();
                    if (string.IsNullOrWhiteSpace(HandedOverDate) == false)
                    {
                        DateTime date1= DateTime.Parse(HandedOverDate);
                        txtHandedOverDate.Text = date1.ToString("dd-MM-yyyy"); 
                    }
                    txtCANo.Text = dt.Rows[0]["ConsumerID"].ToString();
                    txtFarmer1Name.Text = dt.Rows[0]["ConsernFarmer1"].ToString();
                    txtFarmer1Mobile.Text= dt.Rows[0]["ConsernFarmer1Mobile"].ToString();                    
                    txtFarmer2Name.Text = dt.Rows[0]["ConsernFarmer2"].ToString();
                    txtFarmer2Mobile.Text = dt.Rows[0]["ConsernFarmer2Mobile"].ToString();

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

    protected void btnUpdate_Click(object sender, EventArgs e)
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
            if (ddlIsHandedOver.SelectedValue == "Y")
            {
                HandedOverDate = new SqlParameter("@HandedOverDate",DateTime.Parse( txtHandedOverDate.Text.Trim()).ToString("yyyy-MM-dd"));
                HandedOverBlockID = new SqlParameter("@HandedOverBlockID", ddlHandOverBlock.SelectedValue);
                HandedOverPanchyatID = new SqlParameter("@HandedOverPanchyatID", ddlHandOverPanchayat.SelectedValue);
            }
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
                    new SqlParameter("@updByIP",customVariables.GetIPAddress()),
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
            lblMessage.Text = gd.insExecuteSP("updTubewell", prm);
        }
        catch (Exception ex)
        {
        }
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