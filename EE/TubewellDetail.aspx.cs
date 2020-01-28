using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_TubewellDetail : System.Web.UI.Page
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
            if (txtSearch.Text.Trim() != "")
            {
                TubewellSearch();
            }
            else
            {
                SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
                DataTable dt = gd.getDataTable("getTubewellByDistCode", prm);
                bc.bindGV(gvTubewell, dt);
            }
        }
        catch (Exception ex)
        {
        }
    }

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        bindgvTubewell();
        gvTubewell.PageIndex = e.NewPageIndex;
        gvTubewell.DataBind();
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        TubewellSearch();
    }
    public void TubewellSearch()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@SearchKey",txtSearch.Text.Trim())
                    };
            DataTable dt = gd.getDataTable("getTubewellByDistCodeSearchKey", prm);
            bc.bindGV(gvTubewell, dt);
        }
        catch (Exception ex)
        {
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("ID", ((Label)gvr.FindControl("lblID")).Text.ToString());
        Server.Transfer("UpdateTubewell.aspx");
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("ID", ((Label)gvr.FindControl("lblID")).Text.ToString());
        Server.Transfer("ViewTubewell.aspx");
    }

    protected void gvTubewell_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView dr = (DataRowView)e.Row.DataItem;
                Button btnEdit = (Button)e.Row.FindControl("btnEdit");
                Button btnView = (Button)e.Row.FindControl("btnView");
                if (dr["IsLock"].ToString()=="Y")
                {
                    btnEdit.Enabled = false;
                    btnEdit.Text = "Locked";
                    btnView.Text = "View";
                }
                else
                {
                    btnEdit.Enabled = true;
                    btnEdit.Text = "Edit";
                    btnView.Text = "View / Lock";
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
}