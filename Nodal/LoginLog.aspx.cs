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
            bindDDLRole();
            bindgvTubewell();
        }
    }

    public void bindDDLRole()
    {
        DataTable dt = gd.getDataTable("getLoginRole");
        bc.bindDDL(ddlRole,dt, "RoleName", "RoleId");
    }

    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@RoleId",  ddlRole.SelectedValue=="0"?(object)DBNull.Value:ddlRole.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getLoginLog",prm);
            bc.bindGV(gvTubewell, dt);            
        }
        catch (Exception ex)
        {
        }
    }

    protected void ddlRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
}