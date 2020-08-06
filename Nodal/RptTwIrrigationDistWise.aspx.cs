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
public partial class Nodal_RptTwIrrigationDistWise : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDdlZone();
            bindDDLFinYr();
            bindDDLCropType();
        }
    }
    public void bindDDLCropType()
    {
        try
        {

            DataTable dt = gd.getDataTable("getCropType");
            bc.bindDDL(ddlCropType, dt, "CropType", "CropTypeID");
        }
        catch (Exception ex)
        {
        }
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
            if(ddlFinYear.SelectedValue=="0")
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "Message Box", "<script language = 'javascript'>alert('Please select Financial Year!!!')</script>");
                return;
            }
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@ZoneCode",ddlZone.SelectedValue=="0"?(object)DBNull.Value:ddlZone.SelectedValue),
                        new SqlParameter("@DivisionCode",ddlDivision.SelectedValue=="0"?(object)DBNull.Value:ddlDivision.SelectedValue),
                        new SqlParameter("@FinYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@CropTypeID",ddlCropType.SelectedValue=="0"?(object)DBNull.Value:ddlCropType.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellIrrigationDistrictWise", prm);
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
            divHead.Visible = true;
            string cropType = ddlCropType.SelectedValue == "0" ? "ALL" : ddlCropType.SelectedItem.Text;
            lblDetail.Text = ", Financial Year = "+ddlFinYear.SelectedValue+", Season Type = "+cropType;
            //bc.bindGV(gvTubewell, dt);
            int TotalTubewell = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewell"));
            int TotalTubewellFunctional = dt.AsEnumerable().Sum(row => row.Field<int>("TotalTubewellFunctional"));
            decimal TAreaDecimal = dt.AsEnumerable().Sum(row => row.Field<decimal>("AreaDecimal"));
            decimal TRevenueDemandRs = dt.AsEnumerable().Sum(row => row.Field<decimal>("RevenueDemandRs"));
            decimal TRevenueCollectionRs = dt.AsEnumerable().Sum(row => row.Field<decimal>("RevenueCollectionRs"));
            decimal TDepositedAmountInBank = dt.AsEnumerable().Sum(row => row.Field<decimal>("DepositedAmountInBank"));
            gvTubewell.FooterRow.Cells[4].Text = "Total";
            gvTubewell.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[6].Text = TAreaDecimal.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TRevenueDemandRs.ToString();
            gvTubewell.FooterRow.Cells[8].Text = TRevenueCollectionRs.ToString();
            gvTubewell.FooterRow.Cells[9].Text = TDepositedAmountInBank.ToString();

        }
        catch (Exception ex)
        {
            //Response.Write(ex.ToString());
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
        ddlCropType.ClearSelection();
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


    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewellHandover();
    }

    protected void ddlCropType_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewellHandover();
    }
}