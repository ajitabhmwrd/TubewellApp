using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class SE_TwAddTecnician : System.Web.UI.Page
{
    bindControls bc = new bindControls();
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("", prm);
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
        txtMobile.Text = "";
        txtAltMobile.Text = "";
    }

    
}