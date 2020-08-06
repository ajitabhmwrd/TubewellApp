using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class EE_UpdateEmployee : System.Web.UI.Page
{
    bindControls bc = new bindControls();
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string ID = Context.Items["ID"].ToString();
                lblEmployeeID.Text = ID.ToUpper();
                SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@ID",ID)
                    };
                DataTable dt = gd.getDataTable("getBlockEmpByID", prm);
                if (dt.Rows.Count == 1)
                {
                    bindddlDesig();
                    bindDDLDist();                    
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtMobile.Text= dt.Rows[0]["Mobile"].ToString();
                    txtAltMobile.Text= dt.Rows[0]["AltMob"].ToString();
                    ddlDesignation.SelectedValue= dt.Rows[0]["RoleID"].ToString();
                    ddlPostingDistrict.SelectedValue= dt.Rows[0]["PostingDistrictID"].ToString();
                    bindDDLBlock();
                    ddlPostingBlock.SelectedValue= dt.Rows[0]["PostingBlockID"].ToString();
                    txtFatherName.Text= dt.Rows[0]["FatherName"].ToString();
                    ddlGender.SelectedValue= dt.Rows[0]["Gender"].ToString();
                    ddlEmpType.SelectedValue= dt.Rows[0]["EmployeeType"].ToString();
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
                    new SqlParameter("@EmpID",lblEmployeeID.Text.Trim()),
                    new SqlParameter("@Name",txtName.Text.Trim()),
                    new SqlParameter("@FatherName",txtFatherName.Text.Trim()),
                    new SqlParameter("@Gender",ddlGender.SelectedValue),
                    new SqlParameter("@EmployeeType",ddlEmpType.SelectedValue),
                    new SqlParameter("@Mobile",txtMobile.Text.Trim()),
                    new SqlParameter("@AltMob",txtAltMobile.Text.Trim()),
                    new SqlParameter("@Designation",ddlDesignation.SelectedItem.Text),
                    new SqlParameter("@DistrictID",ddlPostingDistrict.SelectedValue),
                    new SqlParameter("@PostingDistrictID",ddlPostingDistrict.SelectedValue),
                    new SqlParameter("@PostingBlockID",ddlPostingBlock.SelectedValue),
                    new SqlParameter("@RoleID",ddlDesignation.SelectedValue),
                    new SqlParameter("@updByID",Session["LoginId"].ToString()),
                    new SqlParameter("@updByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("updBlockEmployee", prm);
        }
        catch (Exception ex)
        {
        }
    }
}