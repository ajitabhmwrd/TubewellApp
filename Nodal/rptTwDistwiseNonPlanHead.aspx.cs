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


public partial class Nodal_rptTwDistwiseNonPlanHead : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLFinYr();
            bindDdlZone();
        }
        if (ddlFinYear.SelectedValue == "0")
        {
            divGrid.Visible = false;
        }
        else
        {
            divGrid.Visible = true;
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
    public void bindDDLFinYr()
    {
        try
        {

            DataTable dt = gd.getDataTable("getFinYear");
            bc.bindDDL(ddlFinYear, dt, "FinYear", "FinYear");
        }
        catch (Exception ex)
        {
        }
    }
    private string SortDirection
    {
        get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
        set { ViewState["SortDirection"] = value; }
    }
    public void bindgvTubewell(string sortExpression = null)
    {
        try
        {
            lblFinYr.Text = ddlFinYear.SelectedItem.Text;
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@FinaciyalYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@ZoneCode",ddlZone.SelectedValue=="0"?(object)DBNull.Value:ddlZone.SelectedValue),
                    new SqlParameter("@DivisionCode",ddlDivision.SelectedValue=="0"?(object)DBNull.Value:ddlDivision.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTwNonPlanHeadDistwise", prm);
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
            //bc.bindGV(gvTubewell, dt);
            //int TwReqRepair = dt.AsEnumerable().Sum(row => row.Field<int>("TwReqRepair"));
            int TwGotFund = dt.AsEnumerable().Sum(row => row.Field<int>("TwGotFund"));
            int PanchayatGotFund = dt.AsEnumerable().Sum(row => row.Field<int>("PanchayatGotFund"));
            //decimal TESCost = dt.AsEnumerable().Sum(row => row.Field<decimal>("TESCost"));
            //decimal TAA = dt.AsEnumerable().Sum(row => row.Field<decimal>("TAA"));
            decimal TAllotment = dt.AsEnumerable().Sum(row => row.Field<decimal>("TAllotment"));
            decimal TExpenditure = dt.AsEnumerable().Sum(row => row.Field<decimal>("TExpenditure"));
            int TRepairStarted = dt.AsEnumerable().Sum(row => row.Field<int>("TRepairStarted"));
            int TRepairCompleted = dt.AsEnumerable().Sum(row => row.Field<int>("TRepairCompleted"));
            gvTubewell.FooterRow.Cells[1].Text = "Total";
            gvTubewell.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[3].Text = TwGotFund.ToString();
            gvTubewell.FooterRow.Cells[4].Text = PanchayatGotFund.ToString();
            gvTubewell.FooterRow.Cells[5].Text = TAllotment.ToString();
            gvTubewell.FooterRow.Cells[6].Text = TExpenditure.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TRepairStarted.ToString();
            gvTubewell.FooterRow.Cells[8].Text = TRepairCompleted.ToString();
        }
        catch (Exception ex)
        {

        }
    }

    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlZone.ClearSelection();
        bindDdlDivision();
        ddlFinYear.ClearSelection();
        lblFinYr.Text = "";
        divGrid.Visible = false;
        bindgvTubewell();
    }

    protected void gvTubewell_Sorting(object sender, GridViewSortEventArgs e)
    {
        this.bindgvTubewell(e.SortExpression);
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
        this.bindgvTubewell();
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
        ExportGridToExcel(gvTubewell, "PlanHead");
    }

    protected void ddlZone_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlDivision();
        bindgvTubewell();
    }

    protected void ddlDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
}