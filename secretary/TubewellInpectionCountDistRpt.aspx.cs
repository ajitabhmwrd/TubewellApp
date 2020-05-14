using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_TubewellInpectionCountDistRpt : System.Web.UI.Page
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
            
            DataTable dt = gd.getDataTable("getTubewellInspectByDistCountRpt");
            bc.bindGV(gvTubewell, dt);
            int TInspectionCount = dt.AsEnumerable().Sum(row => row.Field<int>("InspectionCount"));
            gvTubewell.FooterRow.Cells[2].Text = "Total";
            gvTubewell.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[3].Text = TInspectionCount.ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
}