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
    Encryptor enc = new Encryptor(Encryptor.PrivateKey);
    string conn = ConfigurationManager.ConnectionStrings["ConnectionStringTubewellApp"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        string qry = @"SELECT *  FROM Login order by loginid";
        SqlConnection con = new SqlConnection(conn);
        SqlDataAdapter da = new SqlDataAdapter(qry, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        foreach(DataRow dr in dt.Rows)
        {
            dr["Pass"] = enc.Decrypt(dr["pass"].ToString());
        }
        GridView1.DataBind();
    }
}