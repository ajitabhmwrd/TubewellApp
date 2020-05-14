using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Nodal_RptTubewellNonFunctionalPanchayat : System.Web.UI.Page
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
            string blockCode = Context.Items["BlockCode"].ToString();
            string blockName = Context.Items["BlockName"].ToString();
            string panchayatName = Context.Items["PanchayatName"].ToString();

            lblDistCode.Text = distCode;
            lblBlockCode.Text = blockCode;
            lblBlock.Text = blockName;
            lbPanchayatName.Text = panchayatName;


            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",distCode),
                    new SqlParameter("@BlockCode",blockCode),
                    new SqlParameter("@PanchayatCode",Context.Items["PanchayatCode"].ToString())
                    };
            DataTable dt = gd.getDataTable("getTubewellNonFunctionalByBlock", prm);
            bc.bindGV(gvTubewell, dt);
        }
        catch (Exception ex)
        {
            //Response.Redirect("rptTubewellHandover.aspx");
        }
    }
}