using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class JE_AddTubewellIrrigation : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        Calendar1.EndDate = DateTime.Now;
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindHour();
            bindMinutes();
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
        }
        catch (Exception ex)
        {
        }
    }

    public void bindHour()
    {
        try
        {
            ddlHour.Items.Clear();
            for (int i=0; i<=23; i++)
            {                
                ddlHour.Items.Insert(i, new ListItem(i.ToString(),i.ToString()));
            }
            ddlHour.Items.Insert(0, new ListItem("Hour", "Select"));
        }
        catch (Exception ex)
        {
        }
        
    }

    public void bindMinutes()
    {
        try
        {
            ddlMinutes.Items.Clear();
            for (int i = 0; i <= 59; i++)
            {
                ddlMinutes.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
            }
            ddlMinutes.Items.Insert(0, new ListItem("Minutes", "Select"));
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
            Encryptor enc = new Encryptor(Encryptor.PrivateKey);
            lblMessage.Text = "";
            if (Page.IsValid == false)
            {
                return;
            }
            lblMessage.Text = "";
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),             
                    new SqlParameter("@IrrigationDate",DateTime.Parse(txtIrrigationDate.Text).ToString("yyyy-MM-dd")),
                    new SqlParameter("@DurationHour",ddlHour.SelectedValue),
                    new SqlParameter("@DurationMinute",ddlMinutes.SelectedValue),
                    new SqlParameter("@AreaDecimal",txtIrrigationAreaInDecimal.Text.Trim()),
                    new SqlParameter("@RevenueDemandRs",txtRevenueDemand.Text.Trim()),
                    new SqlParameter("@RevenueCollectionRs",txtRevenueCollection.Text.Trim()),
                    new SqlParameter("@DepositedAmountInBank",txtBankDeposited.Text.Trim()),
                    new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                    new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                    new SqlParameter("@EntryByRole",Session["RoleName"].ToString()),
                    new SqlParameter("@Comment",txtComment.Text.Trim()),
                            };
            lblMessage.Text = gd.insExecuteSP("insTubewellIrrigation", prm);
            clear();
        }
        catch (Exception ex)
        {
            //lblMessage.Text = ex.ToString();
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
        ddlHour.ClearSelection();
        ddlMinutes.ClearSelection();

        txtBankDeposited.Text = "";
        txtComment.Text = "";
        txtIrrigationAreaInDecimal.Text = "";
        txtIrrigationDate.Text = "";
        txtRevenueCollection.Text = "";
        txtRevenueDemand.Text = "";
    }

    protected void ddlVillage_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
    }
}