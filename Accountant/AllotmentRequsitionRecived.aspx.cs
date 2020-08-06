using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accountant_AllotmentRequsitionRecived : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgvRequisition();
            bindDDLFinYr();
        }
    }
    protected void bindgvRequisition()
    {
        SqlParameter[] prm = new SqlParameter[]
                        {
                        new SqlParameter("@IsForwarded","Y")
                        };
        DataTable dt = gd.getDataTable("getRequsitionList",prm);
        bc.bindGV(gvRequisition, dt);
    }
    protected void lnkForward_Click(object sender, EventArgs e)
    {
        try
        {
            LinkButton lnkForward = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lnkForward.NamingContainer;
            Label lblRequisitionID = (Label)gvr.FindControl("lblRequisitionID");
            lblRequistionIDMP.Text = lblRequisitionID.Text;
            txtLtDate.Text = "";
            txtLtNO.Text = "";
            lblMessageMP.Text = "";
            mp1.Show();
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
    protected void gvRequisition_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {            
            
            LinkButton lnkPrepareAllotment = e.Row.FindControl("lnkPrepareAllotment") as LinkButton;
            LinkButton lnkFinalize = e.Row.FindControl("lnkFinalize") as LinkButton;
            LinkButton lnkAllotmentLetterLocation = e.Row.FindControl("lnkAllotmentLetterLocation") as LinkButton;
            Label lblIsAllotmentApproved = e.Row.FindControl("lblIsAllotmentApproved") as Label;            

            if (lblIsAllotmentApproved.Text == "Y")
            {
                lnkAllotmentLetterLocation.Visible = true;
                lblIsAllotmentApproved.Text = "Yes";
                lnkPrepareAllotment.Enabled = false;
                lnkFinalize.Enabled = false;
                lnkPrepareAllotment.Text = "Prepared";
                lnkFinalize.Text = "Finalized";
            }
            else
            {
                lnkAllotmentLetterLocation.Visible = false;
                lblIsAllotmentApproved.Text = "No";
                lnkPrepareAllotment.Enabled = true;
                lnkFinalize.Enabled = true;
                lnkPrepareAllotment.Text = "Prepare Allotment";
                lnkFinalize.Text = "Finalize";
            }

        }
    }
    protected void lnkFinalize_Click(object sender, EventArgs e)
    {
        try
        {            
            LinkButton lnkForward = (LinkButton)sender;
            GridViewRow gvr = (GridViewRow)lnkForward.NamingContainer;
            Label lblRequisitionID = (Label)gvr.FindControl("lblRequisitionID");
            SqlParameter[] prm = new SqlParameter[]
                        {
                        new SqlParameter("@RequisitionID",lblRequisitionID.Text),
                        new SqlParameter("@IsLock",'Y'),
                        new SqlParameter("@IsAllotmentTempAccept",'R'),// R for null value
                        };
            DataTable dt= gd.getDataTable("getTwAllotmentRequisition", prm);
            if (dt.Rows.Count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alertmessage", "alert('Prepare allotment and save before proceed!!!');", true);
                return;
            }
            lblRequistionIDMP.Text = lblRequisitionID.Text;
            txtLtDate.Text = "";
            txtLtNO.Text = "";
            lblMessageMP.Text = "";
            mp1.Show();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }
    }
    protected void lnkPrepareAllotment_Click(object sender, EventArgs e)
    {
        LinkButton lnkPrint = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)lnkPrint.NamingContainer;
        Context.Items.Add("RequisitionID", ((Label)gvr.FindControl("lblRequisitionID")).Text.ToString());
        Server.Transfer("TwAllotmentRequisitionplanAction.aspx");
    }
    protected void btnFinalize_Click(object sender, EventArgs e)
    {
        mp1.Show();
        if (Page.IsValid == false)
        {
            return;
        }
        if (!fuForwardRequisitionPDF.HasFile)
        {
            lblMessageMP.Text = "Please Attach Signed Letter as PDF!!!";
            return;
        }

        lblMessageMP.Text = "";
        string uploadFolder = Request.PhysicalApplicationPath + "AltReqPdf\\";
        string Location = "";
        if (fuForwardRequisitionPDF.HasFile)
        {
            int fileSize = fuForwardRequisitionPDF.PostedFile.ContentLength;
            if (fileSize > (1024 * 10240))
            {
                lblMessageMP.Text = "Filesize of PDF is too large. Maximum file size permitted is " + 10 + "MB";
                return;
            }
            string str = fuForwardRequisitionPDF.FileName;
            string extension = Path.GetExtension(fuForwardRequisitionPDF.PostedFile.FileName);
            if (extension != ".pdf")
            {
                lblMessageMP.Text = "Only .pdf file is allowed!!!!";
                return;
            }
            int i = 1;
            Location = "LT" + txtLtNO.Text + extension;
            while (File.Exists(uploadFolder + Location))
            {
                i++;
                Location = "LT" + txtLtNO.Text + i.ToString() + extension;
            }
        }
        SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@RequisitionID",lblRequistionIDMP.Text),
                        new SqlParameter("@LetterNo",txtLtNO.Text),
                        new SqlParameter("@letterDate",txtLtDate.Text),
                        new SqlParameter("@LetterLocation","~\\AltReqPdf\\" + Location),
                        new SqlParameter("@AllotmenApprovedByID",Session["LoginId"].ToString()),
                        new SqlParameter("@AllotmenApprovedByIP",customVariables.GetIPAddress()),
                        new SqlParameter("@AllotmenApprovedByDesignation",Session["Designation"].ToString()),
                        new SqlParameter("@FinancialYear",ddlFinYear.SelectedValue)
                    };
        response r = gd.insExecuteSPReturnID("updFinalizeAllotmentRequisition", prm);
        lblMessageMP.Text = r.message;

        if (r.success == "1")
        {
            fuForwardRequisitionPDF.SaveAs(uploadFolder + Location);
            bindgvRequisition();
            mp1.Hide();
            ClientScript.RegisterStartupScript(this.GetType(), "alertmessage", "alert('Finalized Successfully!!!');", true);
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
}