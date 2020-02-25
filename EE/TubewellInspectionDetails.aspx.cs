using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JE_TubewellInspectionDetails : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    clsImage clsImage = new clsImage();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string ID = Context.Items["ID"].ToString();
                lblTubewellID.Text = ID.ToUpper();
                bindGVInspection();

            }
            catch (Exception ex)
            {
                Response.Redirect("TubwellInpectionList.aspx");
            }
        }

    }
        
    public void bindGVInspection()
    {
        try
        {

            SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@ID",lblTubewellID.Text)
                };
            DataTable dt0 = gd.getDataTable("getTubewellInspectionByID", prm);
            if (dt0.Rows.Count > 0)
            {
                lblCANumber.Text = dt0.Rows[0]["ConsumerID"].ToString();
                lblType.Text = dt0.Rows[0]["Type"].ToString();
                lblStatus.Text = dt0.Rows[0]["Status"].ToString();
                lblName.Text = dt0.Rows[0]["Name"].ToString();
                lblBlock.Text = dt0.Rows[0]["BlockName"].ToString();
                lblPanchayat.Text = dt0.Rows[0]["PanchayatName"].ToString();
                lblVillage.Text = dt0.Rows[0]["VILLNAME"].ToString();
                gvInspection.DataSource = dt0;
                gvInspection.DataBind();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("TubwellInpectionList.aspx");
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
}