﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JE_TubwellInpectionList : System.Web.UI.Page
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
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@JEEmpID",Session["LoginId"].ToString())
                    };
            DataTable dt = gd.getDataTable("getTubewellInspectByJE", prm);
            bc.bindGV(gvTubewell, dt);
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
        //try
        //{
        //    SqlParameter[] prm = new SqlParameter[]
        //            {
        //            new SqlParameter("@DistCode",Session["DistCode"].ToString()),
        //            new SqlParameter("@SearchKey",txtSearch.Text.Trim())
        //            };
        //    DataTable dt = gd.getDataTable("getTubewellByDistCodeSearchKey", prm);
        //    bc.bindGV(gvTubewell, dt);
        //}
        //catch (Exception ex)
        //{
        //}
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        Context.Items.Add("ID", ((Label)gvr.FindControl("lblID")).Text.ToString());
        Server.Transfer("UpdateTubewell.aspx");
    }


    protected void btnDetail_Click(object sender, EventArgs e)
    {
        Button btnDetail = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnDetail.NamingContainer;
        Context.Items.Add("ID", ((Label)gvr.FindControl("lblInpectionID")).Text.ToString());
        Server.Transfer("TubewellInspectionDetails.aspx");
    }
}