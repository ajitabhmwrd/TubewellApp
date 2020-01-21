using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_updateOtherEmployee : System.Web.UI.Page
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
                DataTable dt = gd.getDataTable("getOtherEmpByID", prm);
                if (dt.Rows.Count == 1)
                {
                    bindddlDesig();
                    txtName.Text = dt.Rows[0]["Name"].ToString();
                    txtMobile.Text = dt.Rows[0]["Mobile"].ToString();
                    txtAltMobile.Text = dt.Rows[0]["AltMob"].ToString();
                    ddlDesignation.SelectedValue = dt.Rows[0]["RoleID"].ToString();
                    bindDDLBlock();
                    ddlBlock.SelectedValue = dt.Rows[0]["BlockID"].ToString();
                    bindDDLPanchyat();
                    ddlPanchayat.SelectedValue = dt.Rows[0]["PanchyatID"].ToString();
                    txtFatherName.Text = dt.Rows[0]["FatherName"].ToString();
                    ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
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
    
    
    public void clear()
    {
        ddlDesignation.ClearSelection();
        txtName.Text = "";
        txtMobile.Text = "";
        txtAltMobile.Text = "";
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
                    new SqlParameter("@FatherName",txtName.Text.Trim()),
                    new SqlParameter("@Gender",ddlGender.SelectedValue),
                    new SqlParameter("@Mobile",txtMobile.Text.Trim()),
                    new SqlParameter("@AltMob",txtAltMobile.Text.Trim()),
                    new SqlParameter("@Designation",ddlDesignation.SelectedItem.Text),
                    new SqlParameter("@DistrictID",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockID",ddlBlock.SelectedValue),
                    new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue),
                    new SqlParameter("@VillageID",DBNull.Value),
                    new SqlParameter("@RoleID",ddlDesignation.SelectedValue),
                    new SqlParameter("@updByID",Session["LoginId"].ToString()),
                    new SqlParameter("@updByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("updOtherEmployee", prm);
        }
        catch (Exception ex)
        {
        }
    }

    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLPanchyat();
    }
}