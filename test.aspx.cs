using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlParameter[] prm = new SqlParameter[]
        {
            new SqlParameter("@LoginId","ACPatna"),
            new SqlParameter("@Pass","yUnpOGz9lxI=")
        };
        DataTable dt = gd.getDataTable("getLoginDetails",prm);
        bc.bindGV(gv, dt);
    }
}