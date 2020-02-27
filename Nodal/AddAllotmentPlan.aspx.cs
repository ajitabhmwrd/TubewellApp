using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_AddAllotmentPlan : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        //Calendar1.EndDate = DateTime.Now;
        if (!IsPostBack)
        {
            bindDDLDistrict();
            bindgvTubewell();
        }
    }
    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",ddlDist.SelectedValue=="0"?(object)DBNull.Value:ddlDist.SelectedValue),
                        new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                        new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("getAdmAprBySearch", prm);
            bc.bindGV(gvTubewell, dt);
        }
        catch (Exception ex)
        {
            ex.ToString();
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

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                    new SqlParameter("@EstimatedCost",txtEstimated.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessage.Text = gd.insExecuteSP("insCreateTubewellAdmAprv", prm);
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

    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

    }

    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void btnAddAllotment_Click(object sender, EventArgs e)
    {
        try
        {
            Button btnEdit = (Button)sender;
            GridViewRow gvr = (GridViewRow)btnEdit.NamingContainer;
            lblTWAllotmentID.Text=((Label)gvr.FindControl("lblID")).Text;
            lblTWID.Text=((Label)gvr.FindControl("lblTubewellID")).Text;
            lblTWName.Text=((Label)gvr.FindControl("lblName")).Text;
            bindDDLFinYr();
            txtAllotment.Text = "";
            lblMessageMP.Text = "";
            bindgvAllotment();
            mp1.Show();
        }
        catch (Exception ex)
        {
            ex.ToString();   
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
    protected void btnClear_Click(object sender, EventArgs e)
    {
        ddlDist.ClearSelection();
        bindDDLBlock();
        //ddlBlock.ClearSelection();
        //ddlPanchayat.ClearSelection();
        //ddlTubewell.ClearSelection();
        bindgvTubewell();
    }

    protected void btnInsertAllotment_Click(object sender, EventArgs e)
    {
        try
        {
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessageMP.Text = "";

            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",lblTWID.Text),
                    new SqlParameter("@AdmAprID",lblTWAllotmentID.Text),
                    new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue),
                    new SqlParameter("@HeadType","1"),
                    new SqlParameter("@AllotmentAmount",txtAllotment.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress())
                            };
            lblMessageMP.Text = gd.insExecuteSP("insCreateTubewellAllotment", prm);
            bindgvAllotment();
        }
        catch (Exception ex)
        {
        }
    }

    public void bindgvAllotment()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",lblTWID.Text),
                        new SqlParameter("@AdmAprID",lblTWAllotmentID.Text)

                    };
            DataTable dt = gd.getDataTable("getAllotmentbyTubewell", prm);
            bc.bindGV(gvAllotment, dt);
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }

    protected void btnClose_Click(object sender, EventArgs e)
    {
        mp1.Hide();
    }
}