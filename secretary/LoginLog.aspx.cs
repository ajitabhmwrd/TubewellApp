using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_LoginLog : System.Web.UI.Page
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
            DataTable dt = gd.getDataTable("getLoginLog");
            bc.bindGV(gvTubewell, dt);            
        }
        catch (Exception ex)
        {
        }
    }
}