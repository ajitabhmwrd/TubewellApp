using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_rptTwDistwisePlanHead : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLFinYr();
        }
        if(ddlFinYear.SelectedValue=="0")
        {
            divGrid.Visible = false;
        }
        else
        {
            divGrid.Visible = true;
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
                    new SqlParameter("@FinaciyalYear",ddlFinYear.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTwPlanHeadDistwise", prm);
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
            int TwReqRepair = dt.AsEnumerable().Sum(row => row.Field<int>("TwReqRepair"));
            int TwGotFund = dt.AsEnumerable().Sum(row => row.Field<int>("TwGotFund"));            
            int PanchayatGotFund = dt.AsEnumerable().Sum(row => row.Field<int>("PanchayatGotFund"));
            decimal TESCost = dt.AsEnumerable().Sum(row => row.Field<decimal>("TESCost"));
            decimal TAA = dt.AsEnumerable().Sum(row => row.Field<decimal>("TAA"));
            decimal TAllotment = dt.AsEnumerable().Sum(row => row.Field<decimal>("TAllotment"));
            decimal TExpenditure = dt.AsEnumerable().Sum(row => row.Field<decimal>("TExpenditure"));
            int TRepairStarted = dt.AsEnumerable().Sum(row => row.Field<int>("TRepairStarted"));
            int TRepairCompleted = dt.AsEnumerable().Sum(row => row.Field<int>("TRepairCompleted"));
            gvTubewell.FooterRow.Cells[1].Text = "Total";
            gvTubewell.FooterRow.Cells[1].HorizontalAlign = HorizontalAlign.Right;
            gvTubewell.FooterRow.Cells[3].Text = TwReqRepair.ToString();
            gvTubewell.FooterRow.Cells[4].Text = TwGotFund.ToString();
            gvTubewell.FooterRow.Cells[5].Text = PanchayatGotFund.ToString();
            gvTubewell.FooterRow.Cells[6].Text = TESCost.ToString();
            gvTubewell.FooterRow.Cells[7].Text = TAA.ToString();
            gvTubewell.FooterRow.Cells[8].Text = TAllotment.ToString();
            gvTubewell.FooterRow.Cells[9].Text = TExpenditure.ToString();
            gvTubewell.FooterRow.Cells[10].Text = TRepairStarted.ToString();
            gvTubewell.FooterRow.Cells[11].Text = TRepairCompleted.ToString();
        }
        catch (Exception)
        {
            
        }
    }
    
    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {        
        bindgvTubewell();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlFinYear.ClearSelection();
        lblFinYr.Text = "";
        gvTubewell.DataBind();
    }

    protected void gvTubewell_Sorting(object sender, GridViewSortEventArgs e)
    {
        this.bindgvTubewell(e.SortExpression);
    }
}