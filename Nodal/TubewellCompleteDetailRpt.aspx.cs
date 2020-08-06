using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_TubewellCompleteDetailRpt : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    clsImage clsImage = new clsImage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindDDLFinYr();
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
    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindTubewellDetail();
        bindGVInspection();
        bindgvAllotment();
        bindgvIrrigation();
    }
    public void bindTubewellDetail()
    {
        
        //lblTubewellID.Text = ddlTubewell.SelectedValue;
        SqlParameter[] prm = new SqlParameter[]
            {
                    new SqlParameter("@ID",ddlTubewell.SelectedValue)
            };
        DataTable dt = gd.getDataTable("getTubewellByID", prm);
        bc.bindGV(gvDetail, dt);
        divDetail.Visible = true;
        //if (dt.Rows.Count == 1)
        //{
        //    lblName.Text = dt.Rows[0]["Name"].ToString();
        //    lblblock.Text = dt.Rows[0]["BlockName"].ToString();
        //    lblPanchayat.Text = dt.Rows[0]["PanchayatName"].ToString();
        //    lblVillage.Text = dt.Rows[0]["VILLNAME"].ToString();
        //    lblStatus.Text = dt.Rows[0]["Status"].ToString();
        //    lblType.Text = dt.Rows[0]["Type"].ToString();
        //    if (dt.Rows[0]["IsHandedOver"].ToString() == "Y")
        //    {
        //        lblIsHandOverPanchayat.Text = "Yes";
        //    }
        //    else
        //    {
        //        lblIsHandOverPanchayat.Text = "No";
        //    }
        //    lblHandOverBlock.Text = dt.Rows[0]["HandedOverBlock"].ToString();
        //    lblHandOverPanchayat.Text = dt.Rows[0]["HandedOverPanchyat"].ToString();
        //    lblScadaStatus.Text = dt.Rows[0]["ScadaDetail"].ToString();
        //    lblLong.Text = dt.Rows[0]["Longitude"].ToString();
        //    lblLat.Text = dt.Rows[0]["Latitude"].ToString();
        //    string HandedOverDate = dt.Rows[0]["HandedOverDate"].ToString();
        //    if (string.IsNullOrWhiteSpace(HandedOverDate) == false)
        //    {
        //        DateTime date1 = DateTime.Parse(HandedOverDate);
        //        lblHandOverDate.Text = date1.ToString("dd-MM-yyyy");
        //    }
        //    lblCANo.Text = dt.Rows[0]["ConsumerID"].ToString();
        //    lblFarName.Text = dt.Rows[0]["ConsernFarmer1"].ToString();
        //    lblFarMobile.Text = dt.Rows[0]["ConsernFarmer1Mobile"].ToString();
        //    lblFar2Name.Text = dt.Rows[0]["ConsernFarmer2"].ToString();
        //    lblFar2Mob.Text = dt.Rows[0]["ConsernFarmer2Mobile"].ToString();
        //    lblJEName.Text = dt.Rows[0]["JEName"].ToString();
        //    lblJEMobile.Text = dt.Rows[0]["JEMobile"].ToString();
        //    lblAEName.Text = dt.Rows[0]["AEName"].ToString();
        //    lblAEMobile.Text = dt.Rows[0]["AEMobile"].ToString();

        //}
    }
    public void bindGVInspection()
    {
        try
        {

            SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@ID",ddlTubewell.SelectedValue)
                };
            DataTable dt0 = gd.getDataTable("getTubewellInspectionByID", prm);
            if (dt0.Rows.Count > 0)
            {
                gvInspection.DataSource = dt0;
                gvInspection.DataBind();
            }
        }
        catch (Exception ex)
        {
            //Response.Redirect("TubwellInpectionList.aspx");
        }
    }
    protected void gvInspection_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string InpectionID = gvInspection.DataKeys[e.Row.RowIndex].Value.ToString();
            //GridView gvInspectionImage = e.Row.FindControl("gvInspectionImage") as GridView;
            Repeater rtImage = e.Row.FindControl("rtImage") as Repeater;
            SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@InpectionID",InpectionID)
                };
            DataTable dt = gd.getDataTable("getTubewellInspectionImage", prm);
            //bc.bindGV(gvInspectionImage,dt);
            foreach (DataRow dr in dt.Rows)
            {
                System.Drawing.Image image = clsImage.byteArrayToImage((byte[])(dr["Image"]));
                byte[] bin = clsImage.scaleImage(image, 200, 200, false);
                dr["Image"] = bin;
            }
            rtImage.DataSource = dt;
            rtImage.DataBind();
        }
    }
    public string GetImage(object img)
    {
        return "data:image/jpg;base64," + Convert.ToBase64String((byte[])img);
    }
    protected void ibImage_Click(object sender, ImageClickEventArgs e)
    {
        RepeaterItem item = (sender as ImageButton).NamingContainer as RepeaterItem;
        string ImageID = (item.FindControl("lblImageID") as Label).Text;
        SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@ImageID",ImageID)
                };
        DataTable dt = gd.getDataTable("getTubewellInspectionImageByID", prm);
        string imageUrl = "data:image/jpg;base64," + Convert.ToBase64String((byte[])dt.Rows[0]["Image"]);
        imgMP.ImageUrl = imageUrl;
        mp1.Show();
    }
    public void bindgvAllotment()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue),
                        new SqlParameter("@HeadID",(object)DBNull.Value)
                    };
            DataTable dt = gd.getDataTable("getAllotmentBySearch", prm);
            bc.bindGV(gvAllot, dt);
            decimal TAllotmentAmount = dt.AsEnumerable().Sum(row => row.Field<decimal>("AllotmentAmount"));
            decimal TEstimatedCost = dt.AsEnumerable().Sum(row => row.Field<decimal>("EstimatedCost"));
            gvAllot.FooterRow.Cells[4].Text = "Total";
            gvAllot.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            gvAllot.FooterRow.Cells[6].Text = TAllotmentAmount.ToString();
            gvAllot.FooterRow.Cells[5].Text = TEstimatedCost.ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    public void bindgvIrrigation()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@ID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue=="0"?(object)DBNull.Value:ddlFinYear.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getTubewellIrrigationByTubwellWise", prm);
            bc.bindGV(gvIrrigation, dt);
            //decimal TAllotmentAmount = dt.AsEnumerable().Sum(row => row.Field<decimal>("AllotmentAmount"));
            //decimal TEstimatedCost = dt.AsEnumerable().Sum(row => row.Field<decimal>("EstimatedCost"));
            //gvTubewell.FooterRow.Cells[4].Text = "Total";
            //gvTubewell.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Right;
            //gvTubewell.FooterRow.Cells[6].Text = TAllotmentAmount.ToString();
            //gvTubewell.FooterRow.Cells[5].Text = TEstimatedCost.ToString();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    protected void ddlFinYear_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(ddlTubewell.SelectedValue=="0")
        { return; }
        bindTubewellDetail();
        bindGVInspection();
        bindgvAllotment();
        bindgvIrrigation();
    }
}