using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_TwAddPhysFinProgress : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLAllotmentHead();
            bindDDLBlock();
            bindDDLFinYr();
            bindDDLWorkNature();
            bindDDLWorkStatus();
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
    }
    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Text = "";
            if (Page.IsValid == false)
            {
                return;
            }
            if (txtMechPro.Text.Trim() == "" && txtElectPro.Text.Trim() == "" && txtCivilPro.Text.Trim() == "")
            {
                lblMessage.Text = "Please Enter work progress(%) as required!!!";
                return;
            }

            int fileSize = fuPDF.PostedFile.ContentLength;
            if (fileSize > (10240 * 1024))
            {
                lblMessage.Text = "Filesize of MB Document is too large. Maximum file size permitted is " + 10 + "MB";
                return;
            }
            string uploadFolder = Request.PhysicalApplicationPath + "PDFFiles\\";
            string str = fuPDF.FileName;
            string extension = Path.GetExtension(fuPDF.PostedFile.FileName);
            string fileName = "";
            int i = 0;
            fileName = "PF" + ddlTubewell.SelectedValue + ddlFinYear.SelectedValue + ddlWorkNature.SelectedValue + extension;
            while (File.Exists(uploadFolder + fileName))
            {
                i++;
                fileName = "PF" + ddlTubewell.SelectedValue + ddlFinYear.SelectedValue + ddlWorkNature.SelectedValue + i.ToString() + extension;
            }

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    new SqlParameter("@FinYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@WorkName",txtWorkName.Text.Trim()),
                    new SqlParameter("@WorkNatureID",ddlWorkNature.SelectedValue),
                    new SqlParameter("@WorkStatusID",ddlWorkStatus.SelectedValue),
                    new SqlParameter("@MBDate",DateTime.Parse(txtDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@ElectProgress",txtElectPro.Text==""?(object)DBNull.Value:txtElectPro.Text),
                    new SqlParameter("@MechProgress",txtMechPro.Text==""?(object)DBNull.Value:txtMechPro.Text),
                    new SqlParameter("@CivilProgress",txtCivilPro.Text==""?(object)DBNull.Value:txtCivilPro.Text),
                    new SqlParameter("@OverAllProgress",txtOverAllPro.Text),
                    new SqlParameter("@AgreementAmount",txtAgreementAmount.Text),
                    new SqlParameter("@ExpenditureAmount",txtEpenditure.Text),
                    new SqlParameter("@PdfPath", "~\\PDFFiles\\" + fileName),
                    new SqlParameter("@EntryByDesignation",Session["Designation"].ToString()),
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@MBNumber",txtMBNo.Text.Trim()),
                    new SqlParameter("@HeadType",ddlHead.SelectedValue),
                    new SqlParameter("@EstimatedCostID",ddlHead.SelectedValue=="1"?ddlEC.SelectedValue:(object)DBNull.Value)
                            };
            response r = gd.insExecuteSPReturnID("insAddPhysFinProgress", prm);
            if (r.success == "1")
            {
                fuPDF.SaveAs(uploadFolder + fileName);
            }
            lblMessage.Text = r.message;
            clear();
        }
        catch (Exception ex)
        {
        }
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        //Page.Response.Redirect(Page.Request.Url.ToString(), true);
        clear();
        lblMessage.Text = "";

    }
    public void clear()
    {
        ddlEC.Items.Clear();
        ddlEC.Items.Insert(0, new ListItem("Select", "0"));
        txtWorkName.Text = "";
        ddlFinYear.ClearSelection();
        txtMBNo.Text = "";
        ddlBlock.ClearSelection();
        ddlWorkNature.ClearSelection();
        txtDate.Text = "";
        txtCivilPro.Text = "";
        txtMechPro.Text = "";
        txtElectPro.Text = "";
        txtOverAllPro.Text = "";
        txtAgreementAmount.Text = "";
        txtEpenditure.Text = "";
        bindDDLPanchyat();
        bindDDLTubewell();
        ddlWorkStatus.ClearSelection();
        ddlHead.ClearSelection();

    }
    public void bindddlEC()
    {
        lblMessage.Text = "";
        if (ddlHead.SelectedValue == "0")
        {
            lblMessage.Text = "Please select Head type!!!";
            ddlTubewell.SelectedValue = "0";
            return;
        }
        if (ddlHead.SelectedValue == "1") // For Plan
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@ID",ddlTubewell.SelectedValue),
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
        if (ddlTubewell.SelectedValue != "0" && ddlHead.SelectedValue != "0")
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

    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTubewell.SelectedValue != "0" && ddlHead.SelectedValue != "0")
        {
            bindddlEC();
        }
    }
}