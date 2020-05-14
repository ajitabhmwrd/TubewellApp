using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_TubewellAllotment : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindDDLFinYr();
            bindDDLAllotmentHead();
            bindgvTubewell();
            
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
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
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
            int fileSize = fuPDF.PostedFile.ContentLength;
            if (fileSize > (10240 * 1024))
            {
                lblMessage.Text = "Filesize of Allotment is too large. Maximum file size permitted is " + 10 + "MB";
                return;
            }
            string uploadFolder = Request.PhysicalApplicationPath + "PDFFiles\\";
            string str = fuPDF.FileName;
            string extension = Path.GetExtension(fuPDF.PostedFile.FileName);
            string fileName = "";
            int i = 0;
            fileName = "ALMT" + ddlTubewell.SelectedValue + ddlHead.SelectedValue + ddlFinYear.SelectedValue + extension;
            while (File.Exists(uploadFolder + fileName))
            {
                i++;
                fileName = "ALMT" + ddlTubewell.SelectedValue + ddlHead.SelectedValue + ddlFinYear.SelectedValue + i.ToString() + extension;
            }
            
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@AdmAprID",DBNull.Value),
                    new SqlParameter("@HeadType",ddlHead.SelectedValue),
                    new SqlParameter("@LetterNo",txtLtNO.Text.Trim()),
                    new SqlParameter("@LetterDate",DateTime.Parse(txtLtDate.Text.Trim()).ToString("yyyy-MM-dd")),
                    new SqlParameter("@AllotmentAmount",txtAllotment.Text.Trim()),
                    new SqlParameter("@pdfLocation", "~\\PDFFiles\\" + fileName),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("insCreateTubewellAllotment", prm);            
            fuPDF.SaveAs(uploadFolder + fileName);
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
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID",ddlHead.SelectedValue=="0"?(object)DBNull.Value:ddlHead.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllotmentBySearch", prm);
            bc.bindGV(gvTubewell, dt);
            foreach(GridViewRow gvr in gvTubewell.Rows)
            {
                LinkButton lnkDownload = gvr.FindControl("lnkDownload") as LinkButton;
                if(string.IsNullOrWhiteSpace(lnkDownload.CommandArgument))
                {
                    lnkDownload.Enabled = false;
                    lnkDownload.Text = "Not Uploaded";
                }
                else
                {
                    lnkDownload.Enabled = true;
                    lnkDownload.Text = "Download pdf";
                }

            }
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }
    protected void ddlHead_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
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
            lblMessage.Text = "";
            Button btnEdit = (Button)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            lblAllotmentID.Text = ((Label)gvr.FindControl("lblAllotmentID")).Text;
            lbDownload.CommandArgument = ((LinkButton)gvr.FindControl("lnkDownload")).CommandArgument;
            ddlFinYear.SelectedValue = ((Label)gvr.FindControl("lblFinancialYear")).Text;
            ddlBlock.SelectedValue = ((Label)gvr.FindControl("lblBlockID")).Text;
            bindDDLPanchyat();
            ddlPanchayat.SelectedValue = ((Label)gvr.FindControl("lblPanchyatID")).Text;
            bindDDLTubewell();
            ddlTubewell.SelectedValue = ((Label)gvr.FindControl("lblTubewellID")).Text;
            txtAllotment.Text = ((Label)gvr.FindControl("lblAllotmentAmount")).Text;
            txtLtNO.Text = ((Label)gvr.FindControl("lblLetterNo")).Text;
            txtLtDate.Text = DateTime.Parse(((Label)gvr.FindControl("lblLetterDate")).Text).ToString("yyyy-MM-dd");
            ddlHead.SelectedValue=ddlHead.Items.FindByText(((Label)gvr.FindControl("lblHeadType")).Text).Value;
            updateView();
            bindgvTubewell();
        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.ToString();
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
            string fileName = "";
            fileName = Path.GetFileName(lbDownload.CommandArgument);
            if (fuPDF.HasFile)
            {
                int fileSize = fuPDF.PostedFile.ContentLength;
                if (fileSize > (10240 * 1024))
                {
                    lblMessage.Text = "Filesize of Allotment is too large. Maximum file size permitted is " + 10 + "MB";
                    return;
                }
                string uploadFolder = Request.PhysicalApplicationPath + "PDFFiles\\";
                string str = fuPDF.FileName;
                string extension = Path.GetExtension(fuPDF.PostedFile.FileName);                
                if (string.IsNullOrWhiteSpace(lbDownload.CommandArgument))
                {
                    int i = 0;
                    fileName = "ALMT" + ddlTubewell.SelectedValue + ddlHead.SelectedValue + ddlFinYear.SelectedValue + extension;
                    while (File.Exists(uploadFolder + fileName))
                    {
                        i++;
                        fileName = "ALMT" + ddlTubewell.SelectedValue + ddlHead.SelectedValue + ddlFinYear.SelectedValue + i.ToString() + extension;
                    }                    
                }
                
                fuPDF.SaveAs(uploadFolder + fileName);
            }
            
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@AllotmentID",lblAllotmentID.Text),
                    new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@LetterNo",txtLtNO.Text.Trim()),
                    new SqlParameter("@HeadType",ddlHead.SelectedValue),
                    new SqlParameter("@LetterDate",DateTime.Parse(txtLtDate.Text.Trim()).ToString("yyyy-MM-dd")),
                    new SqlParameter("@AllotmentAmount",txtAllotment.Text.Trim()),
                    new SqlParameter("@pdfLocation", "~\\PDFFiles\\" + fileName),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            gd.insExecuteSP("updTubewellAllotment", prm);
            btnAdd.Visible = true;
            btnUpdateAllotment.Visible = false;
            btnCancel.Visible = false;
            btnClear.Visible = true;
            txtAllotment.Text = "";
            txtLtNO.Text = "";
            txtLtDate.Text = "";
            ddlBlock.Enabled = true;
            ddlPanchayat.Enabled = true;
            ddlTubewell.Enabled = true;
            lbDownload.Visible = false;
            rfvFU.Enabled = true;
            bindgvTubewell();
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
        ddlHead.ClearSelection();
        bindDDLBlock();
        txtAllotment.Text = "";
        lblMessage.Text = "";
        txtLtNO.Text = "";
        txtLtDate.Text = "";
        ddlBlock.Enabled = true;
        ddlPanchayat.Enabled = true;
        ddlTubewell.Enabled = true;
        lbDownload.Visible = false;
        rfvFU.Enabled = true;
        bindgvTubewell();
        
    }
    public void updateView()
    {
        btnAdd.Visible = false;
        btnClear.Visible = false;
        btnUpdateAllotment.Visible = true;
        btnCancel.Visible = true;
        ddlBlock.Enabled = false;
        ddlPanchayat.Enabled = false;
        ddlTubewell.Enabled = false;
        if(string.IsNullOrWhiteSpace(lbDownload.CommandArgument))
        {
            lbDownload.Visible = false;
            rfvFU.Enabled = true;
        }
        else
        {
            lbDownload.Visible = true;
            rfvFU.Enabled = false;
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

}