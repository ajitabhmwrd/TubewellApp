﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_CreateAllotment : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Calendar1.EndDate = DateTime.Now;
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindDDLFinYr();
            bindgvTubewell();
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
    public void bindDDLDistrict()
    {
        try
        {

            DataTable dt = gd.getDataTable("getAllDistrict");
            bc.bindDDL(ddlDist, dt, "DistName", "DistCode");
            bindDDLBlock();
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLBlock()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByDistCode", prm);
            bc.bindDDL(ddlBlock, dt, "BlockName", "BlockCode");
            bindDDLPanchyat();
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLPanchyat()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@BlockCode",ddlBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllPanchaytByBlockCode", prm);
            bc.bindDDL(ddlPanchayat, dt, "PanchayatName", "PanchayatCode");
            bindDDLTubewell();
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue),
                        //new SqlParameter("@VILLCODE",ddlVillage.SelectedValue),
                        new SqlParameter("@PanchayatCode",ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockCode",ddlBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellByPanchayat", prm);
            bc.bindDDL(ddlTubewell, dt, "Name", "ID");
        }
        catch (Exception ex)
        {
        }
    }

    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLPanchyat();
        bindgvTubewell();
    }

    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        //bindDDLVill();
        bindDDLTubewell();
        bindgvTubewell();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@AdmAprID",DBNull.Value),
                    new SqlParameter("@HeadType","2"),
                    new SqlParameter("@LetterNo",txtLtNO.Text.Trim()),
                    new SqlParameter("@LetterDate",DateTime.Parse(txtLtDate.Text.Trim()).ToString("yyyy-MM-dd")),
                    new SqlParameter("@AllotmentAmount",txtAllotment.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("insCreateTubewellAllotment", prm);
            bindgvTubewell();
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {

    }

    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvTubewell();
    }
    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID","2")
                    };
            DataTable dt = gd.getDataTable("getAllotmentBySearch", prm);
            bc.bindGV(gvTubewell, dt);
            
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        reset();
    }

    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnAllotmentEdit_Click(object sender, EventArgs e)
    {
        try
        {
            Button btnEdit = (Button)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            lblAllotmentID.Text = ((Label)gvr.FindControl("lblAllotmentID")).Text;
            ddlFinYear.SelectedValue = ((Label)gvr.FindControl("lblFinancialYear")).Text;
            ddlDist.SelectedValue = ((Label)gvr.FindControl("lblDistrictID")).Text;
            bindDDLBlock();
            ddlBlock.SelectedValue = ((Label)gvr.FindControl("lblBlockID")).Text;
            bindDDLPanchyat();
            ddlPanchayat.SelectedValue = ((Label)gvr.FindControl("lblPanchyatID")).Text;
            bindDDLTubewell();
            ddlTubewell.SelectedValue = ((Label)gvr.FindControl("lblTubewellID")).Text;
            txtAllotment.Text = ((Label)gvr.FindControl("lblAllotmentAmount")).Text;
            txtLtNO.Text = ((Label)gvr.FindControl("lblLetterNo")).Text;
            txtLtDate.Text = DateTime.Parse(((Label)gvr.FindControl("lblLetterDate")).Text).ToString("yyyy-MM-dd");
            updateView();
        }
        catch (Exception ex)
        {
            lblMessage.Text= ex.ToString();
        }
    }

    protected void btnUpdateAllotment_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@AllotmentID",lblAllotmentID.Text),
                    new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@LetterNo",txtLtNO.Text.Trim()),
                    new SqlParameter("@LetterDate",DateTime.Parse(txtLtDate.Text.Trim()).ToString("yyyy-MM-dd")),
                    new SqlParameter("@AllotmentAmount",txtAllotment.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            gd.insExecuteSP("updTubewellAllotment", prm);
            reset();
            lblMessage.Text = "updated Successfully";
        }
        catch (Exception ex)
        {
            lblMessage.Text = ex.ToString();
        }
        
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        reset();
    }
    public void reset()
    {
        btnAdd.Visible = true;
        btnUpdateAllotment.Visible = false;
        btnCancel.Visible = false;
        btnClear.Visible = true;
        ddlFinYear.ClearSelection();
        ddlDist.ClearSelection();
        bindDDLBlock();
        ddlBlock.ClearSelection();
        ddlPanchayat.ClearSelection();
        ddlTubewell.ClearSelection();
        txtAllotment.Text = "";
        lblMessage.Text = "";
        txtLtNO.Text = "";
        txtLtDate.Text = "";  
        ddlDist.Enabled = true;
        ddlBlock.Enabled = true;
        ddlPanchayat.Enabled = true;
        ddlTubewell.Enabled = true;
        bindgvTubewell();
    }
    public void updateView()
    {
        btnAdd.Visible = false;
        btnClear.Visible = false;
        btnUpdateAllotment.Visible = true;
        btnCancel.Visible = true;
        ddlDist.Enabled = false;
        ddlBlock.Enabled = false;
        ddlPanchayat.Enabled = false;
        ddlTubewell.Enabled = false;
    }
}