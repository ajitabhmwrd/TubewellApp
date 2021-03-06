﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_AddAllotmentPlan : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Calendar1.EndDate = DateTime.Now;
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindgvTubewell();
        }
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
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAdmAprBySearch", prm);
            bc.bindGV(gvTubewell, dt);
        }
        catch (Exception ex)
        {
            ex.ToString();
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
                    new SqlParameter("@EstimatedCost",txtEstimated.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("insCreateTubewellAdmAprv", prm);
            bindgvTubewell();
            txtEstimated.Text = "";
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

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnAddAllotment_Click(object sender, EventArgs e)
    {
        try
        {
            Button btnEdit = (Button)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            lblAdmAprID.Text = ((Label)gvr.FindControl("lblID")).Text;
            lblTWID.Text = ((Label)gvr.FindControl("lblTubewellID")).Text;
            lblTWName.Text = ((Label)gvr.FindControl("lblName")).Text;
            bindDDLFinYr();
            txtAllotment.Text = "";
            lblMessageMP.Text = "";
            txtLtNO.Text = "";
            txtLtDate.Text = "";
            btnUpdateAllotment.Visible = false;
            btnCancel.Visible = false;
            btnInsertAllotment.Visible = true;
            bindgvAllotment();
            mp1.Show();
        }
        catch (Exception ex)
        {
            ex.ToString();
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
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlDist.ClearSelection();
        bindDDLBlock();
        //ddlBlock.ClearSelection();
        //ddlPanchayat.ClearSelection();
        //ddlTubewell.ClearSelection();
        bindgvTubewell();
    }

    protected void btnInsertAllotment_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessageMP.Text = "";

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",lblTWID.Text),
                    new SqlParameter("@AdmAprID",lblAdmAprID.Text),
                    new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@LetterNo",txtLtNO.Text.Trim()),
                    new SqlParameter("@LetterDate",DateTime.ParseExact(txtLtDate.Text,"yyyy-MM-dd",CultureInfo.InvariantCulture)),
                    new SqlParameter("@HeadType","1"),
                    new SqlParameter("@AllotmentAmount",txtAllotment.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessageMP.Text = gd.insExecuteSP("insCreateTubewellAllotment", prm);
            txtAllotment.Text = "";
            bindgvAllotment();
        }
        catch (Exception ex)
        {
            //lblMessageMP.Text = ex.ToString(); ;
        }
    }

    public void bindgvAllotment()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",lblTWID.Text),
                        new SqlParameter("@AdmAprID",lblAdmAprID.Text)

                    };
            DataTable dt = gd.getDataTable("getAllotmentbyTubewell", prm);
            bc.bindGV(gvAllotment, dt);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        mp1.Hide();
    }

    protected void btnAllotmentEdit_Click(object sender, EventArgs e)
    {
        try
        {
            Button btnEdit = (Button)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            lblAllotmentID.Text = ((Label)gvr.FindControl("lblAllotmentID")).Text;
            ddlFinYear.SelectedValue = ((Label)gvr.FindControl("lblFinancialYear")).Text;
            txtAllotment.Text = ((Label)gvr.FindControl("lblAllotmentAmount")).Text;
            txtLtNO.Text = ((Label)gvr.FindControl("lblLetterNo")).Text;
            txtLtDate.Text = DateTime.Parse(((Label)gvr.FindControl("lblLetterDate")).Text).ToString("yyyy-MM-dd");
            btnInsertAllotment.Visible = false;
            btnCancel.Visible = true;
            btnUpdateAllotment.Visible = true;
        }
        catch (Exception ex)
        {
            lblMessageMP.Text = ex.ToString();
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
            lblMessageMP.Text = "";

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@AllotmentID",lblAllotmentID.Text),
                    new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@LetterNo",txtLtNO.Text.Trim()),
                    new SqlParameter("@LetterDate",DateTime.Parse(txtLtDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@AllotmentAmount",txtAllotment.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessageMP.Text = gd.insExecuteSP("updTubewellAllotment", prm);
            ddlFinYear.SelectedValue = "0";
            txtAllotment.Text = "";
            txtLtDate.Text = "";
            txtLtNO.Text = "";
            btnUpdateAllotment.Visible = false;
            btnAllotmentEdit.Visible = false;
            btnCancel.Visible = false;
            btnInsertAllotment.Visible = true;
            bindgvAllotment();
        }
        catch (Exception ex)
        {

        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        btnInsertAllotment.Visible = true;
        btnCancel.Visible = false;
        btnUpdateAllotment.Visible = false;
        ddlFinYear.ClearSelection();
        txtAllotment.Text = "";
        txtLtNO.Text = "";
        txtLtDate.Text = "";
    }

    protected void gvTubewell_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvTubewell.EditIndex = e.NewEditIndex;
        bindgvTubewell();
    }

    protected void gvTubewell_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvTubewell.EditIndex = -1;
        bindgvTubewell();
    }

    protected void gvTubewell_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            GridViewRow gvr = gvTubewell.Rows[e.RowIndex];
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@ID",((Label)gvr.FindControl("lblID")).Text),
                    new SqlParameter("@EstimatedCost",decimal.Parse( ((TextBox)gvr.FindControl("txtEstimatedCost")).Text)),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            gd.insExecuteSP("updTubewellAdmAprv", prm);
            
        }
        catch (Exception ex)
        {
        }
        gvTubewell.EditIndex = -1;
        bindgvTubewell();
    }
}