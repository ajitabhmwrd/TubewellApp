using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AddEstimatedCost : System.Web.UI.Page
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
            if(ddlHead.SelectedValue=="1")
            {
                if(txtAA.Text.Trim()=="")
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
            
            int fileSize = fuPDF.PostedFile.ContentLength;
            if (fileSize > (10240 * 1024))
            {
                lblMessage.Text = "Filesize of Estimated Cost is too large. Maximum file size permitted is " + 10 + "MB";
                return;
            }
            string uploadFolder = Request.PhysicalApplicationPath + "PDFFiles\\";
            string str = fuPDF.FileName;
            string extension = Path.GetExtension(fuPDF.PostedFile.FileName);
            string fileName = "";
            int i = 0;
            fileName = "EC" + ddlTubewell.SelectedValue + ddlFinYear.SelectedValue + ddlWorkNature.SelectedValue + extension;
            while (File.Exists(uploadFolder + fileName))
            {
                i++;
                fileName = "EC" + ddlTubewell.SelectedValue + ddlFinYear.SelectedValue + ddlWorkNature.SelectedValue + i.ToString() + extension;
            }

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    new SqlParameter("@FinaciyalYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@WorkName",txtWorkName.Text.Trim()),
                    new SqlParameter("@WorkNature",ddlWorkNature.SelectedValue),
                    new SqlParameter("@ElectricalAmount",txtEstimatedElect.Text==""?(object)DBNull.Value:txtEstimatedElect.Text),
                    new SqlParameter("@MechenicalAmount",txtEstimatedMech.Text==""?(object)DBNull.Value:txtEstimatedMech.Text),
                    new SqlParameter("@CivilAmount",txtEstimatedCivil.Text==""?(object)DBNull.Value:txtEstimatedCivil.Text),
                    new SqlParameter("@pdfLocation", "~\\PDFFiles\\" + fileName),
                    new SqlParameter("@EntryByDesignation",Session["Designation"].ToString()),
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@HeadType",ddlHead.SelectedValue),
                    new SqlParameter("@RevisedEstimatedCost",txtRevisedEC.Text.Trim()==""?(object)DBNull.Value:txtRevisedEC.Text.Trim()),
                    new SqlParameter("@AAAmount",txtAA.Text.Trim()==""?(object)DBNull.Value:txtAA.Text.Trim())
                            };
            response r = gd.insExecuteSPReturnID("insAddEstimatedCost", prm);
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
        txtWorkName.Text = "";
        ddlFinYear.ClearSelection();
        ddlBlock.ClearSelection();
        ddlHead.ClearSelection();
        txtRevisedEC.Text = "";
        ddlWorkNature.ClearSelection();
        txtEstimatedCivil.Text = "";
        txtEstimatedElect.Text = "";
        txtEstimatedMech.Text = "";
        bindDDLPanchyat();
        bindDDLTubewell();

    }
}