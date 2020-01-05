using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_UpdateTubewellIrrigation : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        Calendar1.EndDate = DateTime.Now;
        if (!IsPostBack)
        {
            bindHour();
            bindMinutes();
            getIrrigation();
        }
    }
    
    public void getIrrigation()
    {
        try
        {
            string ID = Context.Items["ID"].ToString();
            lblID.Text= ID.ToUpper();
            SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@ID",ID)
                };
            DataTable dt = gd.getDataTable("getIrrigationByID", prm);
            if (dt.Rows.Count == 1)
            {
                lblTubewellID.Text = dt.Rows[0]["TubewellID"].ToString();
                txtIrrigationDate.Text = DateTime.Parse(dt.Rows[0]["IrrigationDate"].ToString()).ToString("dd-MM-yyyy");
                ddlHour.SelectedValue= dt.Rows[0]["DurationHour"].ToString();
                ddlMinutes.SelectedValue= dt.Rows[0]["DurationMinute"].ToString();
                txtIrrigationAreaInDecimal.Text= dt.Rows[0]["AreaDecimal"].ToString();
                txtRevenueDemand.Text= dt.Rows[0]["RevenueDemandRs"].ToString();
                txtRevenueCollection.Text= dt.Rows[0]["RevenueCollectionRs"].ToString();
                txtBankDeposited.Text= dt.Rows[0]["DepositedAmountInBank"].ToString();
                txtComment.Text= dt.Rows[0]["Comment"].ToString();
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("TubewellIrrigation.aspx");
        }
    }

    public void bindHour()
    {
        try
        {
            ddlHour.Items.Clear();
            for (int i = 0; i <= 23; i++)
            {
                ddlHour.Items.Insert(i, new ListItem(i.ToString(), i.ToString()));
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
                    new SqlParameter("@ID",lblID.Text),
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
            lblMessage.Text = gd.insExecuteSP("updTubewellIrrigation", prm);
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
        ddlHour.ClearSelection();
        ddlMinutes.ClearSelection();
        txtBankDeposited.Text = "";
        txtComment.Text = "";
        txtIrrigationAreaInDecimal.Text = "";
        txtIrrigationDate.Text = "";
        txtRevenueCollection.Text = "";
        txtRevenueDemand.Text = "";
    }

    
}