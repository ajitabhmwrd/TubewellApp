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
                    bindDDLDist();
                    

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

    protected void btnCancel_Click(object sender, EventArgs e)
    {

    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

    }
}