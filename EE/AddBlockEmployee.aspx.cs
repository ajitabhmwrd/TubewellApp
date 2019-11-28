using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AddDistrictEmployee : System.Web.UI.Page
{
    bindControls bc = new bindControls();
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindddlDesig();
            bindDDLDist();
        }
    }

    public void bindDDLDist()
    {
        try
        {
           
            DataTable dt = gd.getDataTable("getAllDistrict");
            bc.bindDDL(ddlPostingDistrict, dt, "DistName", "DistCode");
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
                    new SqlParameter("@DistCode",ddlPostingDistrict.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByDistCode", prm);
            bc.bindDDL(ddlPostingBlock, dt, "BlockName", "BlockCode");
        }
        catch (Exception ex)
        {
        }
    }

    public void bindddlDesig()
    {
        try
        {
            DataTable dt = gd.getDataTable("getDdlBlockEmp");
            bc.bindDDL(ddlDesignation, dt, "RoleName", "RoleId");
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        //insCreateEmployee
        //@Name nvarchar(50),
        //@Mobile nvarchar(50),
        //@AltMob nvarchar(50),
        //@Designation nvarchar(50),
        //@RoleID nvarchar(50),
        //@DistrictID nvarchar(10),
        //@BlockID nvarchar(10),
        //@PanchyatID nvarchar(50),
        //@VillageID nvarchar(50),
        //@Status nvarchar(50),
        //@EntryByID nvarchar(50),
        //@EntryByIP nvarchar(50)
        //@PostingDistrictID nvarchar(50),
        //@PostingBlockID nvarchar(50),
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@Name",txtName.Text.Trim()),
                    new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockID",DBNull.Value),
                    new SqlParameter("@PostingDistrictID",ddlPostingDistrict.SelectedValue),
                    new SqlParameter("@PostingBlockID",ddlPostingBlock.SelectedValue),
                    new SqlParameter("@PanchyatID",DBNull.Value),
                    new SqlParameter("@VillageID",DBNull.Value),
                    new SqlParameter("@Status","N"),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("insCreateEmployee", prm);
            clear();
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.ToString();
        }
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {

    }

    public void clear()
    {
        ddlDesignation.ClearSelection();
        ddlPostingDistrict.ClearSelection();
        ddlPostingBlock.ClearSelection();
        txtName.Text = "";
        txtMobile.Text = "";
        txtAltMobile.Text = "";
    }

    protected void ddlPostingDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
    }
}