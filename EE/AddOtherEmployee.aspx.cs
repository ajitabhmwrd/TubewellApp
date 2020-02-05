using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AddOtherEmployee : System.Web.UI.Page
{
    bindControls bc = new bindControls();
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindddlDesig();
            bindDDLBlock();
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
    public void bindddlDesig()
    {
        try
        {
            DataTable dt = gd.getDataTable("getDdlOtherEmp");
            bc.bindDDL(ddlDesignation, dt, "RoleName", "RoleId");

        }
        catch (Exception ex)
        {
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            Encryptor enc = new Encryptor(Encryptor.PrivateKey);
            lblMessage.Text = "";
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@Designation",ddlDesignation.SelectedItem.Text),
                    new SqlParameter("@RoleID",ddlDesignation.SelectedValue),
                    new SqlParameter("@Password",enc.Encrypt(txtMobile.Text.Trim())),
                    new SqlParameter("@Name",txtName.Text.Trim()),
                    new SqlParameter("@FatherName",txtFatherName.Text.Trim()),
                    new SqlParameter("@Gender",ddlGender.SelectedValue),
                    new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    new SqlParameter("@Mobile",txtMobile.Text.Trim()),
                    new SqlParameter("@AltMob",txtAltMobile.Text.Trim()),
                    new SqlParameter("@BlockID",ddlBlock.SelectedValue),
                    new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue),
                    new SqlParameter("@VillageID",DBNull.Value),
                    new SqlParameter("@Status","N"),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EmployeeType",DBNull.Value),                    
                    new SqlParameter("@PostingDistrictID",DBNull.Value),
                    new SqlParameter("@PostingBlockID",DBNull.Value)
                            };
            lblMessage.Text = gd.insExecuteSP("insCreateOtherEmployee", prm);
            clear();
        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.ToString();
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        clear();
    }

    public void clear()
    {
        ddlDesignation.ClearSelection();
        ddlBlock.ClearSelection();
        txtName.Text = "";
        txtMobile.Text = "";
        txtAltMobile.Text = "";
    }

    protected void ddlPostingDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
    }

    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLPanchyat();
    }
}