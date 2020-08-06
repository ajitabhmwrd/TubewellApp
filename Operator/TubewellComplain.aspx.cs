using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;
using System.IO;


public partial class TubewellComplain : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    clsImage clsImage = new clsImage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindddlRemarksType();
        }
    }
    public void bindddlRemarksType()
    {
        try
        {

            DataTable dt = gd.getDataTable("getRemarksType");
            bc.bindDDL(ddlRemarksType, dt, "RemarksType", "RemarksTypeID");
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
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
    }
    protected void ddlBlock_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLPanchyat();
    }
    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
    }
    public void reset()
    {
        ddlDist.ClearSelection();
        bindDDLBlock();
        bindDDLPanchyat();
        bindDDLTubewell();
        txtRemarks.Text = "";
        txtName.Text = "";
        txtAddress.Text = "";
        txtMobile.Text = "";
        txtEmail.Text = "";
        ddlRemarksType.ClearSelection();
    }
    protected void Button_Reset_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        reset();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";
            string uploadFolder = Request.PhysicalApplicationPath + "ComplainDocs\\";
            string PDFfileName = "";
            string Image1fileName = "";
            string Image2fileName = "";
            if (fuPDF.HasFile)
            {
                int fileSize = fuPDF.PostedFile.ContentLength;
                if (fileSize > (1024 * 1024))
                {
                    lblMessage.Text = "Filesize of PDF is too large. Maximum file size permitted is " + 1 + "MB";
                    return;
                }
                string str = fuPDF.FileName;
                string extension = Path.GetExtension(fuPDF.PostedFile.FileName);
                if(extension!=".pdf")
                {
                    lblMessage.Text = "Image1 (Only .pdf file allowed.)";
                    return;
                }
                int i = 1;
                PDFfileName = "TCPDF" + ddlTubewell.SelectedValue + extension;
                while (File.Exists(uploadFolder + PDFfileName))
                {
                    i++;
                    PDFfileName = "TCPDF" + ddlTubewell.SelectedValue + i.ToString() + extension;
                }
            }
            if (fuImage1.HasFile)
            {
                int fileSize = fuImage1.PostedFile.ContentLength;
                if (fileSize > (1024 * 200))
                {
                    lblMessage.Text = "Filesize of Image1 is too large. Maximum file size permitted is 200 KB";
                    return;
                }
                string str = fuImage1.FileName;
                string extension = Path.GetExtension(fuImage1.PostedFile.FileName);
                if (extension != ".jpg")
                {
                    lblMessage.Text = "Image1 (Only .jpg file allowed.)";
                    return;
                }
                int i = 1;
                Image1fileName = "TCImage1" + ddlTubewell.SelectedValue + extension;
                while (File.Exists(uploadFolder + Image1fileName))
                {
                    i++;
                    Image1fileName = "TCImage1" + ddlTubewell.SelectedValue + i.ToString() + extension;
                }
            }
            if (fuImage2.HasFile)
            {
                int fileSize = fuImage2.PostedFile.ContentLength;
                if (fileSize > (1024 * 200))
                {
                    lblMessage.Text = "Filesize of Image2 is too large. Maximum file size permitted is 200 KB";
                    return;
                }
                string str = fuImage2.FileName;
                string extension = Path.GetExtension(fuImage2.PostedFile.FileName);
                if (extension != ".jpg")
                {
                    lblMessage.Text = "Image2 (Only .jpg file allowed.)";
                    return;
                }
                int i = 1;
                Image2fileName = "TCImage2" + ddlTubewell.SelectedValue + extension;
                while (File.Exists(uploadFolder + Image2fileName))
                {
                    i++;
                    Image2fileName = "TCImage2" + ddlTubewell.SelectedValue + i.ToString() + extension;
                }
            }

            SqlParameter[] prm = new SqlParameter[]
                        {
                        new SqlParameter("@Name",txtName.Text.Trim()),
                        new SqlParameter("@Remarks",txtRemarks.Text.Trim()),
                        new SqlParameter("@Mobile",txtMobile.Text.Trim()),
                        new SqlParameter("@Address",txtAddress.Text.Trim()),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                        new SqlParameter("@PDF",fuPDF.HasFile==false?(object)DBNull.Value:"~\\ComplainDocs\\" + PDFfileName),
                        new SqlParameter("@Image1",fuImage1.HasFile==false?(object)DBNull.Value:"~\\ComplainDocs\\" + Image1fileName),
                        new SqlParameter("@Image2",fuImage2.HasFile==false?(object)DBNull.Value:"~\\ComplainDocs\\" + Image2fileName),
                        new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                        new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                        new SqlParameter("@LetterSentToCO",rbCOyes.Checked?'Y':'N'),
                        new SqlParameter("@LetterSentToDM",rbDMYes.Checked?'Y':'N'),
                        new SqlParameter("@EmailID",txtEmail.Text.Trim()==""?(object)DBNull.Value:txtEmail.Text.Trim()),
                        new SqlParameter("@RemarksTypeID",ddlRemarksType.SelectedValue),
                        };
            response r = gd.insExecuteSPReturnID("insCreateComplain", prm);
            lblMessage.Text = r.message;
            if (r.success == "1")
            {
                if (fuPDF.HasFile)
                {
                    fuPDF.SaveAs(uploadFolder + PDFfileName);
                }
                if (fuImage1.HasFile)
                {
                    fuImage1.SaveAs(uploadFolder + Image1fileName);
                }
                if (fuImage2.HasFile)
                {
                    fuImage2.SaveAs(uploadFolder + Image2fileName);
                }
            }
            reset();
        }
        catch (Exception ex)
        {
        }
    }
}