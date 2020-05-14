using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_rptTubewellHandOverByDist : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgvTubewellHandover();
        }
    }

    public void bindgvTubewellHandover()
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
            DataTable dt = gd.getDataTable("getTubewellHandOverByDist", prm);
            bc.bindGV(gvTubewell, dt);
            int TotalTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewell"));
            int TotalCA = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCA"));
            int TotalTubewellPanchayat = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellPanchayat"));
            int TotalTubewellFunctional = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellFunctional"));
            int TotalTubewellNonFunctional = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellNonFunctional"));
            gvTubewell.FooterRow.Cells[2].Text = "Total";
            gvTubewell.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[3].Text = TotalTubewell.ToString();
            gvTubewell.FooterRow.Cells[4].Text = TotalCA.ToString();
            gvTubewell.FooterRow.Cells[5].Text = TotalTubewellPanchayat.ToString();
            gvTubewell.FooterRow.Cells[6].Text = TotalTubewellFunctional.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TotalTubewellNonFunctional.ToString();

        }
        catch (Exception ex)
        {
            Response.Redirect("rptTubewellHandover.aspx");
        }
    }



    protected void lbBlockName_Click(object sender, EventArgs e)
    {
        LinkButton btnEdit = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("DistCode", lblDistCode.Text);
        Context.Items.Add("DistName", lblDist.Text);
        Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
        Context.Items.Add("BlockName", ((LinkButton)gvr.FindControl("lbBlockName")).Text.ToString());
        Server.Transfer("rptTubewellHandOverByBlock.aspx");
    }

    protected void lbTotalTubewell_Click(object sender, EventArgs e)
    {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("DistName", lblDist.Text);
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Context.Items.Add("BlockName", ((LinkButton)gvr.FindControl("lbBlockName")).Text.ToString());
            Server.Transfer("rptTotalTubewellBlock.aspx");
           
    }

    protected void lbTotalCA_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("DistName", lblDist.Text);
            Context.Items.Add("BlockName", ((LinkButton)gvr.FindControl("lbBlockName")).Text.ToString());
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Server.Transfer("rptTotalTubewellCABlock.aspx");
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
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("DistName", lblDist.Text);
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Context.Items.Add("BlockName", ((LinkButton)gvr.FindControl("lbBlockName")).Text.ToString());
            Server.Transfer("rptTubewellPanchayatBlock.aspx");
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
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("DistName", lblDist.Text);
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Context.Items.Add("BlockName", ((LinkButton)gvr.FindControl("lbBlockName")).Text.ToString());
            Server.Transfer("rptTubewellFunctionalBlock.aspx");
        }
        catch (Exception ex)
        {
        }
    }

    protected void lTubewellNonFunctional_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("DistName", lblDist.Text);
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Context.Items.Add("BlockName", ((LinkButton)gvr.FindControl("lbBlockName")).Text.ToString());
            Server.Transfer("rptTubewellNonFunctionalBlock.aspx");
        }
        catch (Exception ex)
        {
        }
    }


}