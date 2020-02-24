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

            }
            catch (Exception ex)
            {
                Response.Redirect("TubwellInpectionList.aspx");
            }
            loadData();
        }

    }

    public void loadData()
    {
        try
        {
            
            SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@ID",lblTubewellID.Text)
                };
            DataSet ds = gd.getDataSet("getTubewellInspectionByID", prm);
            DataTable dt0 = ds.Tables[0];
            DataTable dt1 = ds.Tables[1];
            if (dt0.Rows.Count > 0)
            {
                lblCANumber.Text = dt0.Rows[0]["ConsumerID"].ToString();
                lblType.Text = dt0.Rows[0]["Type"].ToString();
                lblStatus.Text = dt0.Rows[0]["Status"].ToString();
                lblName.Text = dt0.Rows[0]["Name"].ToString();
                lblBlock.Text = dt0.Rows[0]["BlockName"].ToString();
                lblPanchayat.Text = dt0.Rows[0]["PanchayatName"].ToString();
                lblVillage.Text = dt0.Rows[0]["VILLNAME"].ToString();
                int count = 0;
                foreach (DataRow dr in dt0.Rows)
                {
                    count++;
                    string ins = "Inspection By : " + dr["EntryByDesignation"].ToString() + ", Date : " + DateTime.Parse(dr["InspectionDate"].ToString()).ToString("dd-MMM-yyyy");
                    AddLabel(count,ins);  
                    foreach (DataRow dri in dt1.Rows)
                    {                        
                        if (dr["InpectionID"].ToString() == dri["InpectionID"].ToString())
                        {
                            System.Drawing.Image image = clsImage.byteArrayToImage((byte[])(dri["Image"]));
                            byte[] bin = clsImage.scaleImage(image, 400, 400, false);
                            //byte[] image = (byte[])(dri["Image"]);
                            AddImage(bin, count);
                        }
                    }

                }
            }
            else
                Response.Redirect("TubwellInpectionList.aspx");
        }
        catch (Exception ex)
        {
            Response.Redirect("TubwellInpectionList.aspx");
        }
    }
    private void AddLabel(int index,string insDate)
    {
        Label lbl = new Label();
        lbl.ID = "lblInsDate" + index;
        lbl.Text = insDate;
        lbl.Font.Bold = true;
        lbl.ForeColor = System.Drawing.Color.DarkBlue;
        pnlDetail.Controls.Add(new Literal() { Text = "<Br/>" });
        pnlDetail.Controls.Add(new Literal() { Text = "<Br/>" });
        pnlDetail.Controls.Add(lbl);
        pnlDetail.Controls.Add(new Literal() {Text = "<hr/>" });
    }
    public void AddImage(byte[] Image,int index )
    {
        ImageButton img1 = new ImageButton();
        img1.ID= "ImgInspection" + index;

        img1.Attributes.Add("style", "padding:5px");
        //img1.Width = new Unit("100%");
        img1.Height = new Unit("200px");
        string insImg = Convert.ToBase64String(Image);
        img1.ImageUrl = String.Format("data:image/jpg;base64,{0}", insImg);
        //img1.Attributes.Add("OnClientClick", "return LoadDiv(this.src);");
        img1.Click += new ImageClickEventHandler(img1_Click);
        pnlDetail.Controls.Add(img1);
    }

    private void img1_Click(object sender, ImageClickEventArgs e)
    {
        lblMessage.Text = "Button Clicked";
    }
}