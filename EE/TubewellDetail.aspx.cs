using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_TubewellDetail : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgvTubewell();
            bindDDLBlock();
            bindDDLType();
            bindDDLStatus();
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
            bc.bindDDL(ddlStStatus, dt, "Status", "ID");
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
                    new SqlParameter("@Status",ddlStatus.SelectedValue=="0"?(object)DBNull.Value:ddlStatus.SelectedItem.Text),
                    new SqlParameter("@Type",ddlType.SelectedValue=="0"?(object)DBNull.Value:ddlType.SelectedItem.Text)
                };
            DataTable dt = gd.getDataTable("getTubewellByDistCode", prm);
            bc.bindGV(gvTubewell, dt);

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
    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        bindgvTubewell();
        gvTubewell.PageIndex = e.NewPageIndex;
        gvTubewell.DataBind();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("ID", ((Label)gvr.FindControl("lblID")).Text.ToString());
        lblTubewellID.Text = ((Label)gvr.FindControl("lblID")).Text.ToString();
        //Server.Transfer("UpdateTubewell.aspx");
        bindDDLTypeMP();
        bindDDLScada();
        getEdit();
        
        mp1.Show();
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("ID", ((Label)gvr.FindControl("lblID")).Text.ToString());
        Server.Transfer("ViewTubewell.aspx");
    }

    protected void gvTubewell_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                Button btnEdit = (Button)e.Row.FindControl("btnEdit");
                Button btnView = (Button)e.Row.FindControl("btnView");
                if (dr["IsLock"].ToString() == "Y")
                {
                    //btnEdit.Enabled = false;
                    //btnEdit.Text = "Locked";
                    btnView.Text = "View";
                }
                else
                {
                    //btnEdit.Enabled = true;
                    //btnEdit.Text = "Edit";
                    btnView.Text = "View / Lock";
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlBlock.ClearSelection();
        ddlPanchayat.ClearSelection();
        ddlTubewell.ClearSelection();
        ddlStatus.ClearSelection();
        ddlType.ClearSelection();
        bindgvTubewell();
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    public void getEdit()
    {
        try
        {
            lblMessage.Text = "";
            string ID = lblTubewellID.Text;
            lblTubewellID.Text = ID.ToUpper();
            SqlParameter[] prm = new SqlParameter[]
                {
                        new SqlParameter("@ID",ID)
                };
            DataTable dt = gd.getDataTable("getTubewellByID", prm);
            if (dt.Rows.Count == 1)
            {
                if (dt.Rows[0]["IsLock"].ToString() == "Y")
                {
                    ddlBlockMP.Enabled = false;
                    ddlPanchayatMP.Enabled = false;
                    ddlVillage.Enabled = false;
                    RequiredFieldValidator2.Enabled = false;
                    txtTubewellName.Enabled = false;                    
                }
                else
                {
                    ddlBlockMP.Enabled = true; ;
                    ddlPanchayatMP.Enabled = true;
                    ddlVillage.Enabled = true;
                    RequiredFieldValidator2.Enabled = true;
                    txtTubewellName.Enabled = true;
                }
                txtTubewellName.Text = dt.Rows[0]["Name"].ToString();
                bindDDLBlockMP();
                bindDDLTypeMP();
                ddlBlockMP.SelectedValue = dt.Rows[0]["BlockID"].ToString();
                bindDDLPanchyatMP();
                ddlPanchayatMP.SelectedValue = dt.Rows[0]["PanchyatID"].ToString();
                bindDDLVill();
                try
                {
                    ddlVillage.SelectedValue = dt.Rows[0]["VillageID"].ToString();
                }
                catch (Exception)
                {
                }                
                //ddlStatus.Items.FindByText(dt.Rows[0]["Status"].ToString()).Selected=true;
                ddlTypeMP.Items.FindByText(dt.Rows[0]["Type"].ToString()).Selected = true;
                bindDDLScada();
                ddlIsHandedOver.SelectedValue = dt.Rows[0]["IsHandedOver"].ToString();
                ddlHandOverBlock.SelectedValue = dt.Rows[0]["HandedOverBlockID"].ToString();
                bindDDLHandedOverPanchyat();
                ddlHandOverPanchayat.SelectedValue = dt.Rows[0]["HandedOverPanchyatID"].ToString();
                try
                {
                    ddlScadaStatus.SelectedValue = dt.Rows[0]["ScadaStatus"].ToString();
                }
                catch (Exception)
                {
                }
                txtLongitude.Text = dt.Rows[0]["Longitude"].ToString();
                txtLatitude.Text = dt.Rows[0]["Latitude"].ToString();
                string HandedOverDate = dt.Rows[0]["HandedOverDate"].ToString();
                if (string.IsNullOrWhiteSpace(HandedOverDate) == false)
                {
                    DateTime date1 = DateTime.Parse(HandedOverDate);
                    txtHandedOverDate.Text = date1.ToString("yyyy-MM-dd");
                }
                txtCANo.Text = dt.Rows[0]["ConsumerID"].ToString();
                txtFarmer1Name.Text = dt.Rows[0]["ConsernFarmer1"].ToString();
                txtFarmer1Mobile.Text = dt.Rows[0]["ConsernFarmer1Mobile"].ToString();
                txtFarmer2Name.Text = dt.Rows[0]["ConsernFarmer2"].ToString();
                txtFarmer2Mobile.Text = dt.Rows[0]["ConsernFarmer2Mobile"].ToString();
                HandoverEnableDisable();

                
            }
            
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
    public void bindDDLBlockMP()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByDistCode", prm);
            bc.bindDDL(ddlBlockMP, dt, "BlockName", "BlockCode");
            bc.bindDDL(ddlHandOverBlock, dt, "BlockName", "BlockCode");
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLPanchyatMP()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@BlockCode",ddlBlockMP.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllPanchaytByBlockCode", prm);
            bc.bindDDL(ddlPanchayatMP, dt, "PanchayatName", "PanchayatCode");
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
                    new SqlParameter("@BlockCode",ddlBlockMP.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllVillageByBlockCode", prm);
            bc.bindDDL(ddlVillage, dt, "VILLNAME", "VILLCODE");
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLTypeMP()
    {
        try
        {
            DataTable dt = gd.getDataTable("getTubewellType");
            bc.bindDDL(ddlTypeMP, dt, "Type", "ID");
        }
        catch (Exception ex)
        {
        }
    }

    protected void ddlBlock_SelectedIndexChangedMP(object sender, EventArgs e)
    {
        bindDDLPanchyatMP();
    }

    protected void ddlPanchayat_SelectedIndexChangedMP(object sender, EventArgs e)
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
            SqlParameter VillageID = new SqlParameter("@VillageID", ddlVillage.SelectedValue);
            if (ddlVillage.SelectedValue=="0") 
            {
                VillageID = new SqlParameter("@VillageID", DBNull.Value);
            }
            if (ddlIsHandedOver.SelectedValue == "Y")
            {
                HandedOverDate = new SqlParameter("@HandedOverDate", DateTime.Parse(txtHandedOverDate.Text.Trim()).ToString("yyyy-MM-dd"));
                HandedOverBlockID = new SqlParameter("@HandedOverBlockID", ddlHandOverBlock.SelectedValue);
                HandedOverPanchyatID = new SqlParameter("@HandedOverPanchyatID", ddlHandOverPanchayat.SelectedValue);
            }
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@ID",lblTubewellID.Text.Trim()),
                    new SqlParameter("@Name",txtTubewellName.Text.Trim()),
                    new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockID",ddlBlockMP.SelectedValue),
                    new SqlParameter("@PanchyatID",ddlPanchayatMP.SelectedValue),
                    VillageID,
                    //new SqlParameter("@Status",ddlStatus.SelectedItem.Text),
                    new SqlParameter("@Type",ddlTypeMP.SelectedItem.Text),
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
            bindgvTubewell();
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
        HandoverEnableDisable();
    }
    public void HandoverEnableDisable()
    {
        try
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
        catch (Exception ex)
        {
        }
    }

    protected void btnStUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@ID",lblTwStID.Text.Trim()),
                    new SqlParameter("@Status",ddlStStatus.SelectedItem.Text),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EntryByRole",Session["RoleName"].ToString())
                            };
            lblStMessage.Text = gd.insExecuteSP("updTubewellStatus", prm);
            lblTwStStatus.Text = ddlStStatus.SelectedItem.Text;
            bindgvTubewell();
        }
        catch (Exception ex)
        {
        }
    }

    protected void btnStEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        lblTwStID.Text = ((Label)gvr.FindControl("lblID")).Text.ToString();
        lblTwStName.Text = ((Label)gvr.FindControl("lblName")).Text.ToString();
        lblTwStStatus.Text = ((Label)gvr.FindControl("lblStatus")).Text.ToString();
        ddlStStatus.ClearSelection();
        mpSt.Show();
    }
}