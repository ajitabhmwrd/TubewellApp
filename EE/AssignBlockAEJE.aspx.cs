using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AssignBlockAEJE : System.Web.UI.Page
{
    bindControls bc = new bindControls();
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindDDLBlock();
        }
    }
    public void bindDDLBlock()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByDistCode", prm);
            bc.bindGV(gvBlock, dt);
        }
        catch (Exception ex)
        {
        }
    }
}