using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_ChangePassword : System.Web.UI.Page
{
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
		try
		{
            lblMessage.Text = "";
            if(txtNewPassword.Text!=txtReEnterPassword.Text)
            {
                lblMessage.Text = "New Password and Re-enter Password not matched!!!";
                return;
            }
            Encryptor enc = new Encryptor(Encryptor.PrivateKey);
            SqlParameter[] prm = new SqlParameter[]{                    
                    new SqlParameter("@LoginID",Session["LoginId"].ToString()),
                    new SqlParameter("@OldPassword",enc.Encrypt(txtOldPassword.Text.Trim())),
                    new SqlParameter("@Role",Session["RoleName"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@Pass",enc.Encrypt(txtNewPassword.Text.Trim()))
                            };
            lblMessage.Text = gd.insExecuteSP("updPassword", prm);
        }
		catch (Exception ex)
		{
		}
    }
}