﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SE_seMaster : System.Web.UI.MasterPage
{
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Session["RoleName"].ToString() == "SE")
            {
                SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@DivisionCode",Session["DivisionCode"].ToString())
                };
                DataTable dt = gd.getDataTable("getDivision", prm);
                lblDesignation.Text = "Welcome " + Session["Designation"].ToString() + ", " + dt.Rows[0]["DivisionName"].ToString();
            }
            else
            {
                Logout();
            }
        }
        catch (Exception ex)
        {
            Logout();
        }
    }

    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Logout();
    }
    public void Logout()
    {
        Session.Clear();
        Session.Abandon();
        
        try
        {
            Response.Redirect("~/Login.aspx");
        }
        catch (Exception)
        {
            
        }
        
    }
}
