﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_BlockEmpList : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgvEmployee();
        }
    }
    public void bindgvEmployee()
    {
        try
        {
            DataTable dt = gd.getDataTable("getBlockEmpByDist");
            bc.bindGV(gvBlockEmployee, dt);
        }
        catch (Exception ex)
        {
        }
    }

    protected void gvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        bindgvEmployee();
        gvBlockEmployee.PageIndex = e.NewPageIndex;
        gvBlockEmployee.DataBind();
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    
                    new SqlParameter("@SearchKey",txtSearch.Text.Trim())
                    };
            DataTable dt = gd.getDataTable("getBlockEmpByDistSearch", prm);
            bc.bindGV(gvBlockEmployee, dt);
        }
        catch (Exception ex)
        {
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("ID", ((Label)gvr.FindControl("lblID")).Text.ToString());
        Server.Transfer("UpdateEmployee.aspx");
    }

}