using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_gwlAverageDistrictWise : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDate.Attributes.Add("ReadOnly", "True");        
    }


    protected void btnView_Click(object sender, EventArgs e)
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@GWLDate",DateTime.Parse(txtDate.Text).ToString("yyyy-MM-dd"))
                    };
            DataTable dt = gd.getDataTable("getGWLDistAverageByDate", prm);
            bc.bindGV(GridView1, dt);
        }
        catch (Exception ex)
        {
        }
    }
}