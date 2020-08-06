using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_TwPhysFinProgress : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLAllotmentHead();
            bindDDLBlock();
            bindgvTubewell();
            bindDDLFinYr();
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
    public void bindDDLWorkStatus()
    {
        try
        {

            DataTable dt = gd.getDataTable("getPhysicalWorkStatus");
            bc.bindDDL(ddlWorkStatus, dt, "WorkStatus", "WorkStatusID");
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
                        new SqlParameter("@PFID",(object)DBNull.Value),
                        new SqlParameter("@FinYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID",(object)DBNull.Value)
                    };
            DataTable dt = gd.getDataTable("getTwPhysFinProgress", prm);
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
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        bindDDLFinYrMP();
        bindDDLWorkNature();
        bindDDLWorkStatus();
        Button btnEdit = (Button)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        getPF(((Label)gvr.FindControl("lblPFID")).Text.ToString());
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
        bindgvTubewell();
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if(!IsValid)
        {
            return;
        }
        mp1.Show();
        lblMessage.Text = "";
        if (txtMechPro.Text.Trim() == "" && txtElectPro.Text.Trim() == "" && txtCivilPro.Text.Trim() == "")
        {
            lblMessage.Text = "Please Enter work progress(%) as required!!!";
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
                    new SqlParameter("@PFID",lblPFID.Text),
                    new SqlParameter("@FinYear",ddlFinYearMP.SelectedValue),
                    new SqlParameter("@WorkName",txtWorkName.Text.Trim()),
                    new SqlParameter("@WorkNatureID",ddlWorkNature.SelectedValue),
                    new SqlParameter("@WorkStatusID",ddlWorkStatus.SelectedValue),
                    new SqlParameter("@MBDate",DateTime.Parse(txtDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@ElectProgress", string.IsNullOrWhiteSpace(txtElectPro.Text)?(object)DBNull.Value:txtElectPro.Text),
                    new SqlParameter("@MechProgress",string.IsNullOrWhiteSpace(txtMechPro.Text)?(object)DBNull.Value:txtMechPro.Text),
                    new SqlParameter("@CivilProgress",string.IsNullOrWhiteSpace(txtCivilPro.Text)?(object)DBNull.Value:txtCivilPro.Text),
                    new SqlParameter("@OverAllProgress",txtOverAllPro.Text),
                    new SqlParameter("@AgreementAmount",txtAgreementAmount.Text),
                    new SqlParameter("@ExpenditureAmount",txtEpenditure.Text),
                    new SqlParameter("@EntryByDesignation",Session["Designation"].ToString()),
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@MBNumber",txtMBNo.Text.Trim()),
                    new SqlParameter("@HeadID",ddlHead.SelectedValue),
                    new SqlParameter("@EstimatedCostID",ddlHead.SelectedValue=="1"?ddlEC.SelectedValue:(object)DBNull.Value)
                            };
        lblMessage.Text = gd.insExecuteSP("updTwPhysFinProgress", prm);
        bindgvTubewell();
    }
    protected void btnClose_Click(object sender, EventArgs e)
    {
        mp1.Hide();
    }
    public void getPF(string PFID)
    {
        lblMessage.Text = "";
        SqlParameter[] prm = new SqlParameter[]
                   {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@BlockID",(object)DBNull.Value),
                        new SqlParameter("@PanchyatID",(object)DBNull.Value),
                        new SqlParameter("@ID",(object)DBNull.Value),
                        new SqlParameter("@PFID",PFID),
                        new SqlParameter("@FinYear",(object)DBNull.Value),
                        new SqlParameter("@HeadID",(object)DBNull.Value)
                   };
        DataTable dt = gd.getDataTable("getTwPhysFinProgress", prm);
        lblPFID.Text = dt.Rows[0]["PFID"].ToString();
        lblTubewellID.Text = dt.Rows[0]["TubewellID"].ToString();
        txtMBNo.Text= dt.Rows[0]["MBNumber"].ToString();
        txtWorkName.Text = dt.Rows[0]["WorkName"].ToString();
        txtDate.Text = DateTime.Parse(dt.Rows[0]["MBDate"].ToString()).ToString("yyyy-MM-dd");
        txtMechPro.Text = dt.Rows[0]["MechProgress"].ToString();
        txtElectPro.Text = dt.Rows[0]["ElectProgress"].ToString();
        txtCivilPro.Text = dt.Rows[0]["CivilProgress"].ToString();
        txtAgreementAmount.Text = dt.Rows[0]["AgreementAmount"].ToString();
        txtEpenditure.Text = dt.Rows[0]["ExpenditureAmount"].ToString();
        txtOverAllPro.Text = dt.Rows[0]["OverAllProgress"].ToString();
        ddlWorkStatus.SelectedValue = dt.Rows[0]["WorkStatusID"].ToString();
        ddlFinYearMP.SelectedValue = dt.Rows[0]["FinYear"].ToString();
        ddlWorkNature.SelectedValue = dt.Rows[0]["WorkNatureID"].ToString();
        lbDownloadMP.CommandArgument = dt.Rows[0]["PdfPath"].ToString();
        ddlHead.SelectedValue= dt.Rows[0]["HeadID"].ToString();        
        HideShowEC();
        if (ddlHead.SelectedValue == "1")
        {
            bindddlEC();
            try
            {
                ddlEC.SelectedValue = dt.Rows[0]["EstimatedCostID"].ToString();
            }
            catch (Exception ex) { }
        }
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
    public void bindddlEC()
    {
        lblMessage.Text = "";
        
        if (ddlHead.SelectedValue == "1") // For Plan
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@ID",lblTubewellID.Text),
                        new SqlParameter("@HeadID","1")
                    };
            DataTable dt = gd.getDataTable("getTubewellEstimatedCost", prm);
            if (dt == null || dt.Rows.Count == 0)
            {
                lblMessage.Text = "Add Estimated Cost on selected tubewell!!!";
            }
            dt.Columns.Add("ddlText", typeof(System.String));
            foreach (DataRow dr in dt.Rows)
            {
                if (string.IsNullOrWhiteSpace(dr["RevisedEstimatedCost"].ToString()))
                {
                    dr["ddlText"] = "EC-" + dr["TEstimatedCost"].ToString() + ",FY-" + dr["FinaciyalYear"].ToString();
                }
                else
                {
                    dr["ddlText"] = "Revised EC-" + dr["RevisedEstimatedCost"].ToString() + ",FY-" + dr["FinaciyalYear"].ToString();
                }
            }
            bc.bindDDL(ddlEC, dt, "ddlText", "EstID");
        }
    }

    protected void ddlHead_SelectedIndexChanged(object sender, EventArgs e)
    {
        HideShowEC();
        if (ddlHead.SelectedValue != "0")
        {
            bindddlEC();
        }
    }
    public void HideShowEC()
    {
        lblMessage.Text = "";
        if (ddlHead.SelectedValue == "1") //For Plan
        {
            divEC.Visible = true;
            rvEC.Enabled = true;
        }
        else
        {
            divEC.Visible = false;
            rvEC.Enabled = false;
        }
    }
}