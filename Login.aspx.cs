using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        imgCaptcha.ImageUrl = "~/CreateCaptcha.aspx?New="+DateTime.Now.ToString();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {

        if (txtUserName.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Credentials, Please try again!!!');", true);
            return;
        }
        if (txtPassword.Text.Trim() == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Credentials, Please try again!!!');", true);
            return;
        }
        //if (!(Session["CaptchaCode"] != null && txtCaptcha.Text == Session["CaptchaCode"].ToString()))
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Captcha not matched, Please try again!!!');", true);
        //    txtCaptcha.Text = "";
        //    return;
        //}
        VerifyLogin(txtUserName.Text, txtPassword.Text);

    }

    public void VerifyLogin(string UserName, string Dept)
    {
        try
        {
            Encryptor enc = new Encryptor(Encryptor.PrivateKey);
            SqlParameter[] prm = new SqlParameter[]
            {
                new SqlParameter("@LoginId",txtUserName.Text),
                new SqlParameter("@Pass",enc.Encrypt(txtPassword.Text))
            };
            DataTable dt = gd.getDataTable("getLoginDetails", prm);
            if (dt.Rows.Count == 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Credentials, Please try again!!!');", true);
                return;
            }
            string userrole = dt.Rows[0]["RoleName"].ToString();
            Session["LoginId"] = dt.Rows[0]["LoginId"].ToString();
            Session["RoleName"] = userrole;
            Session["Designation"] = dt.Rows[0]["Designation"].ToString();
            if (dt.Rows.Count == 1)
            {
                string returnUrl = "";

                FormsAuthentication.Initialize();
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, UserName, DateTime.Now, DateTime.Now.AddMinutes(30), false, userrole, FormsAuthentication.FormsCookiePath);

                // Encrypt the cookie using the machine key for secure transport
                string hash = FormsAuthentication.Encrypt(ticket);
                HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, hash); // Hashed ticket

                // Set the cookie's expiration time to the tickets expiration time
                if (ticket.IsPersistent)
                    cookie.Expires = ticket.Expiration;

                // Add the cookie to the list for outgoing response
                Response.Cookies.Add(cookie);

                if (userrole == "EE")
                {
                    Session["DistCode"] = dt.Rows[0]["DistCode"].ToString();
                    returnUrl = "~/EE/default.aspx";
                }
                else if (userrole == "Nodal")
                {
                    returnUrl = "~/Nodal/default.aspx";
                }
                else if (userrole == "Contractor")
                {
                    Session["ContractorID"] = dt.Rows[0]["ContractorID"].ToString();
                    returnUrl = "~/Contractor/default.aspx";
                }
                else if (userrole == "JE")
                {
                    Session["DistCode"] = dt.Rows[0]["DistCode"].ToString();
                    returnUrl = "~/JE/default.aspx";
                }
                else if (userrole == "AE")
                {
                    Session["DistCode"] = dt.Rows[0]["DistCode"].ToString();
                    returnUrl = "~/AE/default.aspx";
                }
                else if (userrole == "SE")
                {
                    Session["DivisionCode"] = dt.Rows[0]["DivisionCode"].ToString();
                    returnUrl = "~/SE/default.aspx";
                }
                else if (userrole == "CE")
                {
                    Session["ZoneCode"] = dt.Rows[0]["ZoneCode"].ToString();
                    returnUrl = "~/CE/default.aspx";
                }
                else if (userrole == "AC")
                {
                    Session["DistCode"] = dt.Rows[0]["DistCode"].ToString();
                    returnUrl = "~/AC/default.aspx";
                }
                else if (userrole == "DAO")
                {
                    Session["DistCode"] = dt.Rows[0]["DistCode"].ToString();
                    returnUrl = "~/DAO/default.aspx";
                }
                else if (userrole == "TASE")
                {
                    Session["ZoneCode"] = dt.Rows[0]["ZoneCode"].ToString();
                    returnUrl = "~/TASE/default.aspx";
                }
                else if (userrole == "TACE")
                {
                    Session["DivisionCode"] = dt.Rows[0]["DivisionCode"].ToString();
                    returnUrl = "~/TACE/default.aspx";
                }
                else if (userrole == "SEM")
                {
                    returnUrl = "~/SEM/default.aspx";
                }
                else if (userrole == "TAM")
                {
                    returnUrl = "~/TAM/default.aspx";
                }
                else if (userrole == "Admin")
                {
                    returnUrl = "~/Admin/default.aspx";
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Credentials, Please try again!!!');", true);
                }
                Response.Redirect(returnUrl, false);
            }
        }
        catch (Exception ex)
        {

        }
    }


    protected void imgBtnCapchaRefresh_Click(object sender, ImageClickEventArgs e)
    {
        txtCaptcha.Text = "";
    }
}