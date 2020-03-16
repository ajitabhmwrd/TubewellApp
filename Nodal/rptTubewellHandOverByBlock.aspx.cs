using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_rptTubewellHandOverByBlock : System.Web.UI.Page
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
            string BlockCode = Context.Items["BlockCode"].ToString();
            string BlockName = Context.Items["BlockName"].ToString();
            lblDistCode.Text = DistCode;
            lblBlockCode.Text = BlockCode;
            lblDist.Text = DistName;
            lblBlock.Text = BlockName;
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@BlockCode",BlockCode)
                    };
            DataTable dt = gd.getDataTable("getTubewellHandOverByPanchayat", prm);
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

    protected void btnBack_Click(object sender, EventArgs e)
    {  
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("DistName", lblDist.Text);
            Server.Transfer("rptTubewellHandOverByDist.aspx");        
    }

    protected void lbTotalTubewellPanchayat_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("BlockCode", lblBlockCode.Text);
            Context.Items.Add("BlockName", lblBlock.Text);
            Context.Items.Add("PanchayatCode", ((Label)gvr.FindControl("lblPanchayatCode")).Text.ToString());
            Context.Items.Add("PanchayatName", ((Label)gvr.FindControl("lblPanchayatName")).Text.ToString());

            Server.Transfer("RptTotalTubewellPanchayat.aspx");
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
            Context.Items.Add("DistCode", lblDistCode.Text);
            Context.Items.Add("BlockCode", lblBlockCode.Text);
            Context.Items.Add("BlockName", lblBlock.Text);
            Context.Items.Add("PanchayatCode", ((Label)gvr.FindControl("lblPanchayatCode")).Text.ToString());
            Context.Items.Add("PanchayatName", ((Label)gvr.FindControl("lblPanchayatName")).Text.ToString());
            Server.Transfer("RptTotalTubewellCAPanchayat.aspx");
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
            Context.Items.Add("BlockCode", lblBlockCode.Text);
            Context.Items.Add("BlockName", lblBlock.Text);
            Context.Items.Add("PanchayatCode", ((Label)gvr.FindControl("lblPanchayatCode")).Text.ToString());
            Context.Items.Add("PanchayatName", ((Label)gvr.FindControl("lblPanchayatName")).Text.ToString());
            Server.Transfer("RptTubewellFunctionalPanchayat.aspx");
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
            Context.Items.Add("BlockCode", lblBlockCode.Text);
            Context.Items.Add("BlockName", lblBlock.Text);
            Context.Items.Add("PanchayatCode", ((Label)gvr.FindControl("lblPanchayatCode")).Text.ToString());
            Context.Items.Add("PanchayatName", ((Label)gvr.FindControl("lblPanchayatName")).Text.ToString());
            Server.Transfer("RptTubewellNonFunctionalPanchayat.aspx");
        }
        catch (Exception ex)
        {
        }
    }

}