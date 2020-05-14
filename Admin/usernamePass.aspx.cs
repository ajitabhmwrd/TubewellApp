using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_usernamePass : System.Web.UI.Page
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionStringTubewellApp"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        bindgv();
    }
    public void bindgv()
    {
        string qry = @"SELECT  LoginId, Pass, RoleName, Name, Mobile, ContractorID, EntryDt, IsPassReset, d.ZoneCode, d.ZoneName, d.DistCode,d.DistName
                        FROM  Login 
                        left join Role on Role.RoleId=Login.RoleId
                        left join Districts as d on d.DistCode=Login.DistCode
                        order by RoleName,DistName";
        DataTable dt = new DataTable();
        try
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                SqlDataAdapter da = new SqlDataAdapter(qry, conn);
                da.Fill(dt);
                Encryptor enc = new Encryptor(Encryptor.PrivateKey);
                if(dt.Rows.Count>0)
                {
                    foreach (DataRow dr in dt.Rows)
                        dr["Pass"] = enc.Decrypt(dr["Pass"].ToString());
                }
                gvup.DataSource = dt;
                gvup.DataBind();
            }
        }
        catch (Exception ex)
        {
        }
    }
}