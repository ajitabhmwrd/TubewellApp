using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_eeMaster : System.Web.UI.MasterPage
{
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            menuBlockEmp.Visible = false;
            if (Session["RoleName"].ToString() == "HQ")
            {
                if (Session["LoginId"].ToString() == "Nodal")
                {
                    menuBlockEmp.Visible = true;
                    menuTw.Visible = true;
                }
                else if(Session["LoginId"].ToString() == "ashok")
                {
                    menuApprTw.Visible = false;
                    menuTw.Visible = true;
                }
                else
                {
                    menuTw.Visible = false;
                }
                lblDesignation.Text = "Welcome " + Session["Name"].ToString() + ", " + Session["RoleName"].ToString();
            }
            else if (Session["RoleName"].ToString() == "Consultant")
            {
                menuBlockEmp.Visible = true;
                menuApprTw.Visible = false;
                menuTw.Visible = true;
                lblDesignation.Text = "Welcome " + Session["Name"].ToString() + ", " + Session["RoleName"].ToString();
            }
            else if (Session["RoleName"].ToString() == "WAPCOS")
            {
                menuApprTw.Visible = false;
                menuTw.Visible = true;
                lblDesignation.Text = "Welcome " + Session["Name"].ToString() + ", " + Session["RoleName"].ToString();
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
