using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using System.Data;

public partial class Nodal_Default : System.Web.UI.Page
{
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fun();
            last24HrFun();
        }
    }

    public void fun()
    {
        DataTable dt = gd.getDataTable("getTubewellPieChart");
        lblFun.Text = dt.Rows[0]["Functional"].ToString();
        lblNonFun.Text = dt.Rows[0]["NonFunctional"].ToString();
        //decimal percent = decimal.Parse(lblFun.Text) * 100 / (decimal.Parse(lblFun.Text) + decimal.Parse(lblNonFun.Text));
        //lblPercent.Text = percent.ToString("F") + "%";
    }
    public void last24HrFun()
    {
        DataTable dt = gd.getDataTable("getTubewellPieChart");
        DataTable dtFunLastDay = gd.getDataTable("getTubewellLasttwentyFourHour");
        lblTTubewell.Text = dt.Rows[0]["TotalTubewell"].ToString();
        lblFunLastDay.Text = dtFunLastDay.Rows[0]["Functional"].ToString();
        lblNonFunLastDay.Text = dtFunLastDay.Rows[0]["NonFunctional"].ToString();
    }

    public double[] getFunctional()
    {
        try
        {
            DataTable dt = gd.getDataTable("getTubewellPieChart");
            double[] data = new double[]
            {
            double.Parse(dt.Rows[0]["NonFunctional"].ToString()),
            double.Parse(dt.Rows[0]["Functional"].ToString())
            };
            return data;
        }
        catch (Exception) { }
        return null;
    }


}