using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_TubewellEstimatedCost : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindgvTubewell();
            bindDDLFinYr();
            bindDDLAllotmentHead();
        }        
    }
    public void bindDDLAllotmentHead()
    {
        try
        {

            DataTable dt = gd.getDataTable("getAllotmentHead");
            bc.bindDDL(ddlHead, dt, "HeadType", "HeadID");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindDDLFinYrMP()
    {
        try
        {

            DataTable dt = gd.getDataTable("getFinYear");
            bc.bindDDL(ddlFinYearMP, dt, "FinYear", "FinYear");
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
    public void bindDDLWorkNature()
    {
        try
        {

            DataTable dt = gd.getDataTable("getWorkNature");
            bc.bindDDL(ddlWorkNature, dt, "NatureOfWork", "ID");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@ID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@EstID",(object)DBNull.Value),
                        new SqlParameter("@FinaciyalYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID",(object)DBNull.Value)
                    };
            DataTable dt = gd.getDataTable("getTubewellEstimatedCost", prm);
            bc.bindGV(gvTubewell, dt);
            foreach(GridViewRow gvr in gvTubewell.Rows)
            {
                Label lblElectricalAmount = gvr.FindControl("lblElectricalAmount") as Label;
                Label lblMechenicalAmount = gvr.FindControl("lblMechenicalAmount") as Label;
                Label lblCivilAmount = gvr.FindControl("lblCivilAmount") as Label;
                Label lblRevisedEstimatedCost = gvr.FindControl("lblRevisedEstimatedCost") as Label;
                Label lblAAAmount = gvr.FindControl("lblAAAmount") as Label;
                if (string.IsNullOrWhiteSpace(lblElectricalAmount.Text))
                {
                    lblElectricalAmount.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblMechenicalAmount.Text))
                {
                    lblMechenicalAmount.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblCivilAmount.Text))
                {
                    lblCivilAmount.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblRevisedEstimatedCost.Text))
                {
                    lblRevisedEstimatedCost.Text = "N/A";
                }
                if (string.IsNullOrWhiteSpace(lblAAAmount.Text))
                {
                    lblAAAmount.Text = "N/A";
                }
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
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        bindDDLFinYrMP();
        bindDDLWorkNature();
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        getEC(((Label)gvr.FindControl("lblEstID")).Text.ToString());        
        mp1.Show();
    }
    public void bindDDLBlock()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByDistCode", prm);
            bc.bindDDL(ddlBlock, dt, "BlockName", "BlockCode");

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
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
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
        bindDDLTubewell();
        bindgvTubewell();
    }
    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlBlock.ClearSelection();
        bindDDLPanchyat();
        bindDDLTubewell();
        ddlFinYear.ClearSelection();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        mp1.Show();
        lblMessage.Text = "";
        if (ddlHead.SelectedValue == "1")
        {
            if (txtAA.Text.Trim() == "")
            {
                lblMessage.Text = "In case of Plan Head, Please enter Administrative Approval Amount!!!";
                return;
            }
        }
        else
        {
            txtAA.Text = "";
        }
        if (txtEstimatedMech.Text.Trim() == "" && txtEstimatedElect.Text.Trim() == "" && txtEstimatedCivil.Text.Trim() == "")
        {
            lblMessage.Text = "Please Enter Estimated cost as required!!!";
            return;
        }
        
        if (fuPDF.HasFile)
        {
            int fileSize = fuPDF.PostedFile.ContentLength;
            if (fileSize > (10240 * 1024))
            {
                lblMessage.Text = "Filesize of Estimated Cost is too large. Maximum file size permitted is " + 10 + "MB";
                return;
            }
            string uploadFolder = Request.PhysicalApplicationPath + "PDFFiles\\";
            string str = fuPDF.FileName;
            string extension = Path.GetExtension(fuPDF.PostedFile.FileName);
            string fileName = Path.GetFileName(lbDownloadMP.CommandArgument);
            fuPDF.SaveAs(uploadFolder + fileName);
        }
        SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@EstID",lblEstID.Text),
                    new SqlParameter("@FinaciyalYear",ddlFinYearMP.SelectedValue),
                    new SqlParameter("@WorkName",txtWorkName.Text.Trim()),
                    new SqlParameter("@WorkNature",ddlWorkNature.SelectedValue),
                    new SqlParameter("@ElectricalAmount",txtEstimatedElect.Text==""?(object)DBNull.Value:txtEstimatedElect.Text),
                    new SqlParameter("@MechenicalAmount",txtEstimatedMech.Text==""?(object)DBNull.Value:txtEstimatedMech.Text),
                    new SqlParameter("@CivilAmount",txtEstimatedCivil.Text==""?(object)DBNull.Value:txtEstimatedCivil.Text),
                    new SqlParameter("@EntryByDesignation",Session["Designation"].ToString()),
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@HeadType",ddlHead.SelectedValue),
                    new SqlParameter("@RevisedEstimatedCost",txtRevisedEC.Text.Trim()==""?(object)DBNull.Value:txtRevisedEC.Text.Trim()),
                    new SqlParameter("@AAAmount",txtAA.Text.Trim()==""?(object)DBNull.Value:txtAA.Text.Trim())
                            };
        lblMessage.Text = gd.insExecuteSP("updTubewellEstimatedCost", prm);
        bindgvTubewell();
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        mp1.Hide();
    }
    public void getEC(string EstimatedID)
    {
        lblMessage.Text = "";
        SqlParameter[] prm = new SqlParameter[]
                   {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@BlockID",(object)DBNull.Value),
                        new SqlParameter("@PanchyatID",(object)DBNull.Value),
                        new SqlParameter("@ID",(object)DBNull.Value),
                        new SqlParameter("@EstID",EstimatedID),
                        new SqlParameter("@FinaciyalYear",(object)DBNull.Value),
                        new SqlParameter("@HeadID",(object)DBNull.Value)

                   };
        DataTable dt = gd.getDataTable("getTubewellEstimatedCost", prm);
        lblEstID.Text = dt.Rows[0]["EstID"].ToString();
        lblTubewellID.Text= dt.Rows[0]["TubewellID"].ToString();
        txtWorkName.Text= dt.Rows[0]["WorkName"].ToString();
        txtEstimatedCivil.Text= dt.Rows[0]["CivilAmount"].ToString();
        txtEstimatedElect.Text= dt.Rows[0]["ElectricalAmount"].ToString();
        txtEstimatedMech.Text= dt.Rows[0]["MechenicalAmount"].ToString();
        txtRevisedEC.Text= dt.Rows[0]["RevisedEstimatedCost"].ToString();
        ddlFinYearMP.SelectedValue= dt.Rows[0]["FinaciyalYear"].ToString();
        ddlHead.SelectedValue= dt.Rows[0]["HeadID"].ToString();
        ddlWorkNature.SelectedValue= dt.Rows[0]["WorkNature"].ToString();
        lbDownloadMP.CommandArgument=  dt.Rows[0]["pdfLocation"].ToString();
        txtAA.Text= dt.Rows[0]["AAAmount"].ToString();
    }
    protected void lnkDownload_Click(object sender, EventArgs e)
    {
        string filePath = (sender as LinkButton).CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
    }
    protected void lbDownloadMP_Click(object sender, EventArgs e)
    {
        string filePath = lbDownloadMP.CommandArgument;
        Response.ContentType = ContentType;
        Response.AppendHeader("Content-Disposition", "attachment; filename=" + Path.GetFileName(filePath));
        Response.WriteFile(filePath);
        Response.End();
        lblMessage.Text = filePath;
        mp1.Show();
    }
    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
}