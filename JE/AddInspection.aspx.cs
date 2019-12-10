using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JE_AddInspection : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        Calendar1.EndDate = DateTime.Now;
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindDDLCommentType();
        }
    }
    public void bindDDLBlock()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@JEEmpID",Session["LoginId"].ToString())
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByJEEmpID", prm);
            bc.bindDDL(ddlBlock, dt, "BlockName", "BlockCode");
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLCommentType()
    {
        try
        {
            DataTable dt = gd.getDataTable("getCommentType");
            bc.bindDDL(ddlCommentType1, dt, "CommentType", "ID");
            bc.bindDDL(ddlCommentType2, dt, "CommentType", "ID");
            bc.bindDDL(ddlCommentType3, dt, "CommentType", "ID");
            bc.bindDDL(ddlCommentType4, dt, "CommentType", "ID");
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

    public void bindDDLVill()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@PanCode",ddlPanchayat.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAllVillageByPanCode", prm);
            bc.bindDDL(ddlVillage, dt, "VILLNAME", "VILLCODE");
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
                    new SqlParameter("@VILLCODE",ddlVillage.SelectedValue),
                    new SqlParameter("@PanchayatCode",ddlPanchayat.SelectedValue),
                    new SqlParameter("@BlockCode",ddlBlock.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellByVillage", prm);
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
        bindDDLVill();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            response r = null;
            if (!Page.IsValid)
            {
                return;
            }
            lblMessage.Text = "";
            var prmImage1 = new SqlParameter("@Image", SqlDbType.VarBinary);
            var prmImage1Comment = new SqlParameter("@Comment", SqlDbType.NVarChar);
            var prmImage1CommentType = new SqlParameter("@CommentType", SqlDbType.NVarChar);
            var prmImage2 = new SqlParameter("@Image", SqlDbType.VarBinary);
            var prmImage2Comment = new SqlParameter("@Comment", SqlDbType.NVarChar);
            var prmImage2CommentType = new SqlParameter("@CommentType", SqlDbType.NVarChar);
            var prmImage3 = new SqlParameter("@Image", SqlDbType.VarBinary);
            var prmImage3Comment = new SqlParameter("@Comment", SqlDbType.NVarChar);
            var prmImage3CommentType = new SqlParameter("@CommentType", SqlDbType.NVarChar);
            var prmImage4 = new SqlParameter("@Image", SqlDbType.VarBinary);
            var prmImage4Comment = new SqlParameter("@Comment", SqlDbType.NVarChar);
            var prmImage4CommentType = new SqlParameter("@CommentType", SqlDbType.NVarChar);

            if (fuImage1.HasFile)
            {
                Byte[] image1 = null;
                decimal size = Math.Round(((decimal)fuImage1.PostedFile.ContentLength / (decimal)1024), 2);
                if (size < 50 || size > 200)
                {
                    lblMessage.Text = "Image 1 size must be greater than 50kb less than 200kb!!!";
                    return;
                }
                if (txtComment1.Text.Length > 500)
                {
                    lblMessage.Text = "Image 1 Comment should be less than 500 characters!!!";
                    return;
                }
                Stream fs = fuImage1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                image1 = br.ReadBytes((Int32)fs.Length);
                prmImage1.Value = image1;
                prmImage1Comment.Value = txtComment1.Text.Trim();
                prmImage1CommentType.Value = ddlCommentType1.SelectedValue;                                
            }
            if (fuImage2.HasFile)
            {
                Byte[] image2 = null;
                decimal size = Math.Round(((decimal)fuImage2.PostedFile.ContentLength / (decimal)1024), 2);
                if (size < 50 || size > 200)
                {
                    lblMessage.Text = "Image 2 size must be greater than 50kb and less than 200kb!!!";
                    return;
                }
                if (ddlCommentType2.SelectedValue == "0")
                {
                    lblMessage.Text = "Please select Image 2 comment type!!!";
                    return;
                }
                if (txtComment2.Text.Trim() == "")
                {
                    lblMessage.Text = "Please enter Image 2 comment!!!";
                    return;
                }
                else
                {
                    if (txtComment2.Text.Length > 500)
                    {
                        lblMessage.Text = "Image 2 Comment should be less than 500 characters!!!";
                        return;
                    }
                }
                Stream fs = fuImage2.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                image2 = br.ReadBytes((Int32)fs.Length);
                prmImage2.Value = image2;
                prmImage2Comment.Value = txtComment2.Text.Trim();
                prmImage2CommentType.Value = ddlCommentType2.SelectedValue;
            }
            if (fuImage3.HasFile)
            {
                Byte[] image3 = null;
                decimal size = Math.Round(((decimal)fuImage3.PostedFile.ContentLength / (decimal)1024), 2);
                if (size < 50 || size > 200)
                {
                    lblMessage.Text = "Image 3 size must be greater than 50kb less than 200kb!!!";
                    return;
                }
                if (ddlCommentType3.SelectedValue == "0")
                {
                    lblMessage.Text = "Please select Image 3 comment type!!!";
                    return;
                }
                if (txtComment3.Text.Trim() == "")
                {
                    lblMessage.Text = "Please enter Image 3 comment!!!";
                    return;
                }
                else
                {
                    if (txtComment3.Text.Length > 500)
                    {
                        lblMessage.Text = "Image 3 Comment should be less than 500 characters!!!";
                        return;
                    }
                }
                Stream fs = fuImage3.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                image3 = br.ReadBytes((Int32)fs.Length);
                prmImage3.Value = image3;
                prmImage3Comment.Value = txtComment3.Text.Trim();
                prmImage3CommentType.Value = ddlCommentType3.SelectedValue;
            }
            if (fuImage4.HasFile)
            {
                Byte[] image4 = null;
                decimal size = Math.Round(((decimal)fuImage4.PostedFile.ContentLength / (decimal)1024), 2);
                if (size < 50 || size > 200)
                {
                    lblMessage.Text = "Image 4 size must be greater than 50kb less than 200kb!!!";
                    return;
                }
                if (ddlCommentType4.SelectedValue == "0")
                {
                    lblMessage.Text = "Please select Image 4 comment type!!!";
                    return;
                }
                if (txtComment4.Text.Trim() == "")
                {
                    lblMessage.Text = "Please enter Image 4 comment!!!";
                    return;
                }
                else
                {
                    if (txtComment4.Text.Length > 500)
                    {
                        lblMessage.Text = "Image 4 Comment should be less than 500 characters!!!";
                        return;
                    }
                }
                Stream fs = fuImage4.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                image4 = br.ReadBytes((Int32)fs.Length);
                prmImage4.Value = image4;
                prmImage4Comment.Value = txtComment4.Text.Trim();
                prmImage4CommentType.Value = ddlCommentType4.SelectedValue;
            }
            SqlParameter[] prm1 = new SqlParameter[]{
                    new SqlParameter("@InspectionDate",DateTime.Parse(txtInspectionDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    prmImage1,
                    prmImage1Comment,
                    prmImage1CommentType,
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EntryByDesignation",Session["RoleName"].ToString())
                };
            r = gd.insExecuteSPReturnID("insTubewellInspection",prm1);
            if (r.success == "1" && !string.IsNullOrEmpty(r.ID))
            {
                if(fuImage2.HasFile)
                {
                    SqlParameter[] prm2 = new SqlParameter[]{
                    new SqlParameter("@InpectionID",r.ID),
                    new SqlParameter("@InspectionDate",DateTime.Parse(txtInspectionDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    prmImage2,
                    prmImage2Comment,
                    prmImage2CommentType,
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EntryByDesignation",Session["RoleName"].ToString())
                    };
                    gd.insExecuteSP("insTubewellInspectionImage", prm2);
                }
                if (fuImage3.HasFile)
                {
                    SqlParameter[] prm3 = new SqlParameter[]{
                    new SqlParameter("@InpectionID",r.ID),
                    new SqlParameter("@InspectionDate",DateTime.Parse(txtInspectionDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    prmImage3,
                    prmImage3Comment,
                    prmImage3CommentType,
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EntryByDesignation",Session["RoleName"].ToString())
                    };
                    gd.insExecuteSP("insTubewellInspectionImage", prm3);
                }
                if (fuImage4.HasFile)
                {
                    SqlParameter[] prm4 = new SqlParameter[]{
                    new SqlParameter("@InpectionID",r.ID),
                    new SqlParameter("@InspectionDate",DateTime.Parse(txtInspectionDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    prmImage4,
                    prmImage4Comment,
                    prmImage4CommentType,
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EntryByDesignation",Session["RoleName"].ToString())
                    };
                    gd.insExecuteSP("insTubewellInspectionImage", prm4);
                }
                lblMessage.Text = "Saved Successfully.";
            }
            else
            {
                lblMessage.Text = "Error occured!!!";
            }
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error occured!!!";
        }
    }


    protected void btnReset_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        clear();
    }
    public void clear()
    {
        ddlBlock.ClearSelection();
        ddlPanchayat.ClearSelection();
        ddlVillage.ClearSelection();
        ddlTubewell.ClearSelection();
    }

    protected void ddlVillage_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
    }
}