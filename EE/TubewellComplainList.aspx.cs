using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_TubewellComplainList : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindgvTubewell();
            bindDDLddlResolvedType();
        }
    }

    public void bindDDLddlResolvedType()
    {
        try
        {
            DataTable dt = gd.getDataTable("getresolvedStatus");
            bc.bindDDL(ddlResolvedType, dt, "ResolvedStatus", "ID");

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
    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvTubewell();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {

    }

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTubewell.PageIndex = e.NewPageIndex;
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
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellComplain", prm);
            bc.bindGV(gvTubewell, dt);
            foreach (GridViewRow gvr in gvTubewell.Rows)
            {
                LinkButton lnkPDF = gvr.FindControl("lnkPDF") as LinkButton;
                LinkButton lnkImage1 = gvr.FindControl("lnkImage1") as LinkButton;
                LinkButton lnkImage2 = gvr.FindControl("lnkImage2") as LinkButton;
                LinkButton lnkResolvedPdf = gvr.FindControl("lnkResolvedPdf") as LinkButton;
                LinkButton lnkResolvedImage1 = gvr.FindControl("lnkResolvedImage1") as LinkButton;
                if (string.IsNullOrWhiteSpace(lnkPDF.CommandArgument))
                {
                    lnkPDF.Enabled = false;
                    lnkPDF.Text = "";
                    //lnkPDF.ForeColor = System.Drawing.Color.Black;
                }
                if (string.IsNullOrWhiteSpace(lnkImage1.CommandArgument))
                {
                    lnkImage1.Enabled = false;
                    lnkImage1.Text = "";
                }
                if (string.IsNullOrWhiteSpace(lnkImage2.CommandArgument))
                {
                    lnkImage2.Enabled = false;
                    lnkImage2.Text = "";
                }
                if (string.IsNullOrWhiteSpace(lnkResolvedImage1.CommandArgument))
                {
                    lnkResolvedImage1.Enabled = false;
                    lnkResolvedImage1.Text = "";
                }
                if (string.IsNullOrWhiteSpace(lnkResolvedPdf.CommandArgument))
                {
                    lnkResolvedPdf.Enabled = false;
                    lnkResolvedPdf.Text = "";
                }
                //else
                //{
                //    lnkPDF.Enabled = true;
                //    lnkPDF.Text = "Download";
                //}

            }
        }
        catch (Exception ex)
        {
            ex.ToString();
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

    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvTubewell();
    }


    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        LinkButton btnEdit = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
        lblTwStID.Text = ((Label)gvr.FindControl("lblID")).Text.ToString();
        lblTwStName.Text = ((Label)gvr.FindControl("lblName")).Text.ToString();
        //lblTwStStatus.Text = ((Label)gvr.FindControl("lblStatus")).Text.ToString();
        lblStComplainID.Text = ((Label)gvr.FindControl("lblComplainID")).Text.ToString();
        ddlResolvedType.ClearSelection();
        mpSt.Show();

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        mpSt.Show();
        string uploadFolder = Request.PhysicalApplicationPath + "ComplainDocs\\";
        string PDFfileName = "";
        string Image1fileName = "";
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
            if (extension != ".pdf")
            {
                lblMessage.Text = "Image1 (Only .pdf file allowed.)";
                return;
            }
            int i = 1;
            PDFfileName = "TCPDFEE" + ddlTubewell.SelectedValue + extension;
            while (File.Exists(uploadFolder + PDFfileName))
            {
                i++;
                PDFfileName = "TCPDFEE" + ddlTubewell.SelectedValue + i.ToString() + extension;
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
            Image1fileName = "TCImage1EE" + ddlTubewell.SelectedValue + extension;
            while (File.Exists(uploadFolder + Image1fileName))
            {
                i++;
                Image1fileName = "TCImage1EE" + ddlTubewell.SelectedValue + i.ToString() + extension;
            }
        }
        SqlParameter[] prm = new SqlParameter[]
                        {
                        new SqlParameter("@ComplainID",lblStComplainID.Text),
                        new SqlParameter("@ResolvedStatus",ddlResolvedType.SelectedValue),
                        new SqlParameter("@Remarks",txtRemarks.Text.Trim()),
                        new SqlParameter("@TubewellID",lblTwStID.Text),
                        new SqlParameter("@PDF",fuPDF.HasFile==false?(object)DBNull.Value:"~\\ComplainDocs\\" + PDFfileName),
                        new SqlParameter("@Image1",fuImage1.HasFile==false?(object)DBNull.Value:"~\\ComplainDocs\\" + Image1fileName),
                        new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                        new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                        };
        response r = gd.insExecuteSPReturnID("updTubwellComplainEE", prm);
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
        }
        bindgvTubewell();
       
    }
}