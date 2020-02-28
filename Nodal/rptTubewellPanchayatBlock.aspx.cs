using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Nodal_rptTubewellPanchayatBlock : System.Web.UI.Page
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
            string distCode = Context.Items["DistCode"].ToString();
            string distName = Context.Items["DistName"].ToString();
            string blockCode = Context.Items["BlockCode"].ToString();
            string blockName = Context.Items["BlockName"].ToString();

            lblDistCode.Text = distCode;
            lblDist.Text = distName;
            lblBlockCode.Text = blockCode;
            lblBlock.Text = blockName;

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",distCode),
                    new SqlParameter("@BlockCode",blockCode)
                    };
            DataTable dt = gd.getDataTable("getTubewellPanchaytByBlock", prm);
            bc.bindGV(gvTubewell, dt);
        }
        catch (Exception ex)
        {
            Response.Redirect("rptTubewellHandover.aspx");
        }
    }
}