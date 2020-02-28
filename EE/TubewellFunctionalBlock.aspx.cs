using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class EE_TubewellFunctionalBlock : System.Web.UI.Page
{

    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindgvTubewell();
        }
    }

    public void bindgvTubewell()
    {
        try
        {
            string distCode = Context.Items["DistCode"].ToString();
            string blockCode = Context.Items["BlockCode"].ToString();
            string blockName = Context.Items["BlockName"].ToString();

            lblBlock.Text = blockName;

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",distCode),
                    new SqlParameter("@BlockCode",blockCode),
                     new SqlParameter("@PanchayatCode",DBNull.Value)
                    };
            DataTable dt = gd.getDataTable("getTubewellFunctionalByBlock", prm);
            bc.bindGV(gvTubewell, dt);
        }
        catch (Exception ex)
        {
           //Response.Redirect("rptTubewellHandover.aspx");
        }
    }
}