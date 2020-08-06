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

public partial class Nodal_rptCriticalZoneTubewellReport : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDdlZone();
            bindgvTubewellHandover();
        }
    }
    public void bindDdlZone()
    {
        DataTable dt = gd.getDataTable("getZone");
        bc.bindDDL(ddlZone, dt, "ZoneName", "ZoneCode");
    }
    public void bindDdlDivision()
    {
        SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@ZoneCode",ddlZone.SelectedValue=="0"?(object)DBNull.Value:ddlZone.SelectedValue)
                    };
        DataTable dt = gd.getDataTable("getDivision", prm);
        bc.bindDDL(ddlDivision, dt, "DivisionName", "DivisionCode");

    }
    public void bindgvTubewellHandover(string sortExpression = null)
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@ZoneCode",ddlZone.SelectedValue=="0"?(object)DBNull.Value:ddlZone.SelectedValue),
                        new SqlParameter("@DivisionCode",ddlDivision.SelectedValue=="0"?(object)DBNull.Value:ddlDivision.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getCriticalTubewell", prm);
            if (sortExpression != null)
            {
                DataView dv = dt.AsDataView();
                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";

                dv.Sort = sortExpression + " " + this.SortDirection;
                gvTubewell.DataSource = dv;
            }
            else
            {
                gvTubewell.DataSource = dt;
            }
            gvTubewell.DataBind();
            int blockInvolved = dt.AsEnumerable().Sum(row => row.Field<int>("blockInvolved"));
            int TotalTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewell"));
            int TotalCritSemiOverTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCritSemiOverTubewell"));
            int TotalCritSemiOverFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCritSemiOverFunTubewell"));
            int TotalCritSemiOverNonFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCritSemiOverNonFunTubewell"));
            int TotalCriticalTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCriticalTubewell"));
            int TotalSemiCriticalTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalSemiCriticalTubewell"));
            int TotalOverExploitedTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalOverExploitedTubewell"));
            int TotalCriticalFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCriticalFunTubewell"));
            int TotalSemiCriticalFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalSemiCriticalFunTubewell"));
            int TotalOverExploitedFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalOverExploitedFunTubewell"));
            int TotalCriticalNonFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalCriticalNonFunTubewell"));
            int TotalSemiCriticalNonFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalSemiCriticalNonFunTubewell"));
            int TotalOverExploitedNonFunTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalOverExploitedNonFunTubewell"));
            gvTubewell.FooterRow.Cells[4].Text = "Total";
            gvTubewell.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[5].Text = TotalTubewell.ToString();
            gvTubewell.FooterRow.Cells[6].Text = blockInvolved.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TotalCritSemiOverTubewell.ToString();
            gvTubewell.FooterRow.Cells[8].Text = TotalCritSemiOverFunTubewell.ToString();
            gvTubewell.FooterRow.Cells[9].Text = TotalCritSemiOverNonFunTubewell.ToString();
            gvTubewell.FooterRow.Cells[10].Text = TotalCriticalTubewell.ToString();
            gvTubewell.FooterRow.Cells[11].Text = TotalSemiCriticalTubewell.ToString();
            gvTubewell.FooterRow.Cells[12].Text = TotalOverExploitedTubewell.ToString();
            gvTubewell.FooterRow.Cells[13].Text = TotalCriticalFunTubewell.ToString();
            gvTubewell.FooterRow.Cells[14].Text = TotalSemiCriticalFunTubewell.ToString();
            gvTubewell.FooterRow.Cells[15].Text = TotalOverExploitedFunTubewell.ToString();
            gvTubewell.FooterRow.Cells[16].Text = TotalCriticalNonFunTubewell.ToString();
            gvTubewell.FooterRow.Cells[17].Text = TotalSemiCriticalNonFunTubewell.ToString();
            gvTubewell.FooterRow.Cells[18].Text = TotalOverExploitedNonFunTubewell.ToString();

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

    protected void ddlZone_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlDivision();
        bindgvTubewellHandover();
    }

    protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewellHandover();
    }

    private string SortDirection
    {
        get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
        set { ViewState["SortDirection"] = value; }
    }
    protected void gvTubewell_Sorting(object sender, GridViewSortEventArgs e)
    {
        this.bindgvTubewellHandover(e.SortExpression);
    }
    protected void gvTubewell_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    DataRowView dr = (DataRowView)e.Row.DataItem;
        //    if (int.Parse(dr["FunPercent"].ToString()) <= 30)
        //    {
        //        e.Row.Cells[9].BackColor = System.Drawing.ColorTranslator.FromHtml("#ff8080");
        //    }
        //    if (int.Parse(dr["FunPercent"].ToString()) > 30 && int.Parse(dr["FunPercent"].ToString()) < 60)
        //    {
        //        e.Row.Cells[9].BackColor = System.Drawing.ColorTranslator.FromHtml("#ffb833");
        //    }
        //    if (int.Parse(dr["FunPercent"].ToString()) >= 60)
        //    {
        //        e.Row.Cells[9].BackColor = System.Drawing.ColorTranslator.FromHtml("#4dff4d");
        //    }
        //}
    }

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ddlZone.ClearSelection();
        bindDdlDivision();
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
}