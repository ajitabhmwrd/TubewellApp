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
            Byte[] image1 = null;
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";

            if (fuImage1.HasFile)
            {
                Stream fs = fuImage1.PostedFile.InputStream;
                BinaryReader br = new BinaryReader(fs);
                image1 = br.ReadBytes((Int32)fs.Length);
            }
            /*
            @TubewellID nvarchar(50),
            @InspectionDate nvarchar(50),
            @EntryBy nvarchar(50),
            @EntryByIP nvarchar(50),
            @EntryByDesignation nvarchar(50),
            @Image varbinary(max),
            @Comment nvarchar(500),
            @CommentType nvarchar(50)*/
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@InspectionDate",DateTime.Parse(txtInspectionDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    new SqlParameter("@Image",image1),
                    new SqlParameter("@Comment",txtComment1.Text),
                    new SqlParameter("@CommentType",ddlCommentType1.SelectedValue),
                    new SqlParameter("@EntryBy",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EntryByDesignation",Session["RoleName"].ToString())
            };
            lblMessage.Text = gd.insExecuteSP("insTubewellInspection", prm);
            clear();
        }
        catch (Exception ex)
        {
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