﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class JE_TubewellIrrigation : System.Web.UI.Page
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
                TubewellIrrigationSearch();
            }
            else
            {
                SqlParameter[] prm = new SqlParameter[]
                        {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                        };
                DataTable dt = gd.getDataTable("getTubewellIrrigationByDist", prm);
                dt.Columns.Add("Duration");
                foreach (DataRow dr in dt.Rows)
                {
                    dr["Duration"] = dr["DurationHour"].ToString() + "h " + dr["DurationMinute"].ToString() + "min";
                }
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
        TubewellIrrigationSearch();
    }
    public void TubewellIrrigationSearch()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@SearchKey",txtSearch.Text.Trim())
                    };
            DataTable dt = gd.getDataTable("getTubewellIrrigationByDistSearch", prm);
            dt.Columns.Add("Duration");
            foreach (DataRow dr in dt.Rows)
            {
                dr["Duration"] = dr["DurationHour"].ToString() + "h " + dr["DurationMinute"].ToString() + "min";
            }
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
        Server.Transfer("UpdateTubewellIrrigation.aspx");
    }
}