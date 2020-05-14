using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_rptTubewellHandover : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindgvTubewellHandover();
        }
    }

    public void bindgvTubewellHandover()
    {
        try
        {
            DataTable dt = gd.getDataTable("getTubewellHandOver");            
            bc.bindGV(gvTubewell, dt);
            int TotalTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewell"));
            int TotalCA = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCA"));
            int TotalTubewellPanchayat = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellPanchayat"));
            int TotalTubewellFunctional = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellFunctional"));
            int TotalTubewellNonFunctional = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellNonFunctional"));
            gvTubewell.FooterRow.Cells[3].Text = "Total";
            gvTubewell.FooterRow.Cells[3].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[4].Text = TotalTubewell.ToString();
            gvTubewell.FooterRow.Cells[5].Text = TotalCA.ToString();
            gvTubewell.FooterRow.Cells[6].Text = TotalTubewellPanchayat.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TotalTubewellFunctional.ToString();
            gvTubewell.FooterRow.Cells[8].Text = TotalTubewellNonFunctional.ToString();

        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
        }
    }

    protected void lbDistName_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((LinkButton)gvr.FindControl("lbDistName")).Text.ToString());
            Server.Transfer("rptTubewellHandOverByDist.aspx");
        }
        catch (Exception ex)
        {

        }
    }

    protected void lbTotalTubewell_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((LinkButton)gvr.FindControl("lbDistName")).Text.ToString());
            Server.Transfer("rptTotalTubewell.aspx");
        }
        catch (Exception ex)
        {
        }
    }

    protected void lbTotalCA_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((LinkButton)gvr.FindControl("lbDistName")).Text.ToString());
            Server.Transfer("rptTotalTubewellCADist.aspx");
        }
        catch (Exception ex)
        {

        }
    }

    protected void lbTotalTubewellPanchayat_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((LinkButton)gvr.FindControl("lbDistName")).Text.ToString());
            Server.Transfer("rptTubewellPanchayatDist.aspx");
        }
        catch (Exception ex)
        {
        }
    }

    protected void lbTotalTubewellFunctional_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((LinkButton)gvr.FindControl("lbDistName")).Text.ToString());
            Server.Transfer("rptTubewellFunctionalDist.aspx");
        }
        catch (Exception ex)
        {
        }
    }

    protected void lbNonFunctional_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((LinkButton)gvr.FindControl("lbDistName")).Text.ToString());
            Server.Transfer("rptTubewellNonFunctionalDist.aspx");
        }
        catch (Exception ex)
        {
        }
    }
}