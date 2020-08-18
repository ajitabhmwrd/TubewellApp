using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_rptBlockwiseWithJE : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindgvTubewellHandover();
        }
    }
    public void bindDDLDistrict()
    {
        try
        {

            DataTable dt = gd.getDataTable("getAllDistrict");
            bc.bindDDL(ddlDist, dt, "DistName", "DistCode");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindgvTubewellHandover()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",ddlDist.SelectedValue == "0" ? (object)DBNull.Value : ddlDist.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getBlocksWithJE", prm);
            bc.bindGV(gvTubewell, dt);
            int TotalTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewell"));
            //int TotalCA = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCA"));
            //int TotalTubewellPanchayat = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellPanchayat"));
            int TotalTubewellFunctional = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellFunctional"));
            int TotalTubewellNonFunctional = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellNonFunctional"));
            gvTubewell.FooterRow.Cells[5].Text = "Total";
            gvTubewell.FooterRow.Cells[5].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[6].Text = TotalTubewell.ToString();
            //gvTubewell.FooterRow.Cells[4].Text = TotalCA.ToString();
            //gvTubewell.FooterRow.Cells[5].Text = TotalTubewellPanchayat.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TotalTubewellFunctional.ToString();
            gvTubewell.FooterRow.Cells[8].Text = TotalTubewellNonFunctional.ToString();

        }
        catch (Exception ex)
        {
            Response.Redirect("rptTubewellHandover.aspx");
        }
    }



    //protected void lbBlockName_Click(object sender, EventArgs e)
    //{
    //    LinkButton btnEdit = (LinkButton)sender;
    //    GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
    //    Context.Items.Add("DistCode", lblDistCode.Text);
    //    Context.Items.Add("DistName", lblDist.Text);
    //    Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
    //    Context.Items.Add("BlockName", ((LinkButton)gvr.FindControl("lbBlockName")).Text.ToString());
    //    Server.Transfer("rptTubewellHandOverByBlock.aspx");
    //}

    protected void lbTotalTubewell_Click(object sender, EventArgs e)
    {
        LinkButton btnEdit = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
        Context.Items.Add("DistName", ((Label)gvr.FindControl("lbDistName")).Text.ToString());
        Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
        Context.Items.Add("BlockName", ((Label)gvr.FindControl("lbBlockName")).Text.ToString());
        Server.Transfer("rptTotalTubewellBlock.aspx");

    }

    protected void lbTotalCA_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton btnEdit = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((Label)gvr.FindControl("lbDistName")).Text.ToString());
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
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((Label)gvr.FindControl("lbDistName")).Text.ToString());
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Context.Items.Add("BlockName", ((Label)gvr.FindControl("lbBlockName")).Text.ToString());
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
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((Label)gvr.FindControl("lbDistName")).Text.ToString());
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Context.Items.Add("BlockName", ((Label)gvr.FindControl("lbBlockName")).Text.ToString());
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
            Context.Items.Add("DistCode", ((Label)gvr.FindControl("lblDistCode")).Text.ToString());
            Context.Items.Add("DistName", ((Label)gvr.FindControl("lbDistName")).Text.ToString());
            Context.Items.Add("BlockCode", ((Label)gvr.FindControl("lblBlockCode")).Text.ToString());
            Context.Items.Add("BlockName", ((Label)gvr.FindControl("lbBlockName")).Text.ToString());
            Server.Transfer("rptTubewellNonFunctionalBlock.aspx");
        }
        catch (Exception ex)
        {
        }
    }
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewellHandover();
    }
    private void ExportGridToExcel(GridView gv, string filename)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = filename + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        gv.AllowPaging = false;
        this.bindgvTubewellHandover();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        gv.GridLines = GridLines.Both;
        gv.HeaderStyle.Font.Bold = true;
        gv.RenderControl(htmltextwrtter);
        Response.Write(Regex.Replace(strwritter.ToString(), "</?(a|A).*?>", ""));
        Response.End();

    }


    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel(gvTubewell, "FunctionalRpt");
    }


    protected void gvTubewell_DataBound(object sender, EventArgs e)
    {
        setRowspan(1, "lbDistName");
        setRowspan(2, "lbName");
        setRowspan(3, "lbName");
    }
    public void setRowspan(int mergeRow,string cntrlID)
    {
        for (int i = gvTubewell.Rows.Count - 1; i > 0; i--)
        {
            GridViewRow row = gvTubewell.Rows[i];
            GridViewRow previousRow = gvTubewell.Rows[i - 1];
            for (int j = 0; j < row.Cells.Count; j++)
            {
                string chk= (row.Cells[j].FindControl(cntrlID) as Label).Text;
                if(string.IsNullOrEmpty(chk))
                {
                    break;
                }
                if ((row.Cells[j].FindControl(cntrlID) as Label).Text == (previousRow.Cells[j].FindControl(cntrlID) as Label).Text)
                {
                    if (previousRow.Cells[mergeRow].RowSpan == 0)
                    {
                        if (row.Cells[mergeRow].RowSpan == 0)
                        {
                            previousRow.Cells[mergeRow].RowSpan += 2;
                        }
                        else
                        {
                            previousRow.Cells[mergeRow].RowSpan = row.Cells[mergeRow].RowSpan + 1;
                        }
                        row.Cells[mergeRow].Visible = false;
                    }
                }
            }
        }
    }
}