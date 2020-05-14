using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_LoinDistrictwise : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }

    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@StartDate",  DateTime.Parse(txtStartDate.Text).ToString("yyyy-MM-dd")),
                        new SqlParameter("@EndDate",  DateTime.Parse(txtEndDate.Text).ToString("yyyy-MM-dd"))
                    };
            DataTable dt = gd.getDataTable("getLoginDetailDistWise", prm);
            bc.bindGV(gvTubewell, dt);
            lblDate.Text = "From Date " + txtStartDate.Text +" to " + txtEndDate.Text;
        }
        catch (Exception ex)
        {
        }
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
}