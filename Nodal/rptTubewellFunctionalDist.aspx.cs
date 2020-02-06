using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_rptTubewellFunctionalDist : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgvTubewell();
        }
    }
    public void bindgvTubewell()
    {
        try
        {
            string DistCode = Context.Items["DistCode"].ToString();
            string DistName = Context.Items["DistName"].ToString();
            lblDist.Text = DistName;
            lblDistCode.Text = DistCode;
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",DistCode)
                    };
            DataTable dt = gd.getDataTable("getTubewellFunctionalByDistCode", prm);
            bc.bindGV(gvTubewell, dt);
        }
        catch (Exception ex)
        {
            Response.Redirect("rptTubewellHandover.aspx");
        }
    }
}