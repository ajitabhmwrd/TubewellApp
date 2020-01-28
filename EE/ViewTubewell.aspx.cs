using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_ViewTubewell : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string ID = Context.Items["ID"].ToString();
                lblTubewellID.Text = ID.ToUpper();
                SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@ID",ID)
                    };
                DataTable dt = gd.getDataTable("getTubewellByID", prm);
                if (dt.Rows.Count == 1)
                {
                    lblName.Text = dt.Rows[0]["Name"].ToString();
                    lblblock.Text = dt.Rows[0]["BlockName"].ToString();
                    lblPanchayat.Text = dt.Rows[0]["PanchayatName"].ToString();
                    lblVillage.Text = dt.Rows[0]["VILLNAME"].ToString();
                    lblStatus.Text = dt.Rows[0]["Status"].ToString();
                    lblType.Text = dt.Rows[0]["Type"].ToString();
                    if (dt.Rows[0]["IsHandedOver"].ToString() == "Y")
                    {
                        lblIsHandOverPanchayat.Text = "Yes";
                    }
                    else
                    {
                        lblIsHandOverPanchayat.Text = "No";
                    }
                    lblHandOverBlock.Text = dt.Rows[0]["HandedOverBlock"].ToString();
                    lblHandOverPanchayat.Text = dt.Rows[0]["HandedOverPanchyat"].ToString();
                    lblScadaStatus.Text = dt.Rows[0]["ScadaDetail"].ToString();
                    lblLong.Text = dt.Rows[0]["Longitude"].ToString();
                    lblLat.Text = dt.Rows[0]["Latitude"].ToString();
                    string HandedOverDate = dt.Rows[0]["HandedOverDate"].ToString();
                    if (string.IsNullOrWhiteSpace(HandedOverDate) == false)
                    {
                        DateTime date1 = DateTime.Parse(HandedOverDate);
                        lblHandOverDate.Text = date1.ToString("dd-MM-yyyy");
                    }
                    lblCANo.Text = dt.Rows[0]["ConsumerID"].ToString();
                    lblFarName.Text = dt.Rows[0]["ConsernFarmer1"].ToString();
                    lblFarMobile.Text = dt.Rows[0]["ConsernFarmer1Mobile"].ToString();
                    lblFar2Name.Text = dt.Rows[0]["ConsernFarmer2"].ToString();
                    lblFar2Mob.Text = dt.Rows[0]["ConsernFarmer2Mobile"].ToString();
                    if(dt.Rows[0]["IsLock"].ToString()=="Y")
                    {
                        btnLock.Visible = false;
                    }
                    else
                    {
                        btnLock.Visible = true;
                    }
                }
                else
                    Response.Redirect("TubewellDetail.aspx");
            }
            catch (Exception ex)
            {
                Response.Redirect("TubewellDetail.aspx");
            }

        }
    }



    protected void btnLock_Click(object sender, EventArgs e)
    {
        try
        {
            lblMessage.Text = "";
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID", lblTubewellID.Text),
                    new SqlParameter("@IsLock", 'Y'),
                    new SqlParameter("@LockByID",Session["LoginId"].ToString()),
                    new SqlParameter("@LockByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("updTubewellLockUnlock", prm);
            btnLock.Visible = false;
        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.ToString();
        }
    }
}