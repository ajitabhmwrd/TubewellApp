using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accountant_TwAllotmentRequisitionplanAction : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindgvFinalReq();
        }
    }
    public void bindgvFinalReq()
    {
        try
        {
            string RequisitionID = Context.Items["RequisitionID"].ToString();
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@RequisitionID",RequisitionID),
                    new SqlParameter("@IsLock",'Y')
                    };
            DataTable dt = gd.getDataTable("getTwAllotmentRequisition", prm);
            bc.bindGV(gvFinalReq, dt);
            try
            {
                SqlParameter[] prm1 = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",dt.Rows[0]["DistCode"].ToString())
                    };
                DataTable dt1 = gd.getDataTable("getDistrictByDIstCode", prm1);
                lblDistrict.Text = dt.Rows[0]["DistName"].ToString();
                lblRequisitionID.Text = RequisitionID;

            }
            catch (Exception)
            {
            }
        }
        catch (Exception ex)
        {
            Response.Redirect("TwAllotmentRequisitionPlan.aspx");
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
    protected void gvFinalReq_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox txtAllotmentAmount = e.Row.FindControl("txtAllotmentAmount") as TextBox;
            RadioButton rbAccept = e.Row.FindControl("rbAccept") as RadioButton;
            RadioButton rbReject = e.Row.FindControl("rbReject") as RadioButton;
            RequiredFieldValidator rfRevisedEstimate = e.Row.FindControl("rfRevisedEstimate") as RequiredFieldValidator;
            RegularExpressionValidator rfRENum = e.Row.FindControl("rfRENum") as RegularExpressionValidator;
            string AdmAprID = (e.Row.FindControl("lblAdmAprID") as Label).Text;
            string TubewellID = (e.Row.FindControl("lblTubewellID") as Label).Text;
            string IsAllotmentTempAccept = (e.Row.FindControl("lblIsAllotmentTempAccept") as Label).Text;
            GridView gvFRAllotment = e.Row.FindControl("gvFRAllotment") as GridView;
            SqlParameter[] prmAllotment = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",TubewellID),
                        new SqlParameter("@AdmAprID",AdmAprID)
                    };
            DataTable dtAllotment = gd.getDataTable("getAllotmentbyTubewellHQ", prmAllotment);
            bc.bindGV(gvFRAllotment, dtAllotment);
            
            if(IsAllotmentTempAccept=="Y")
            {
                rbAccept.Checked = true;
                rbReject.Checked = false;
                rfRevisedEstimate.Enabled = true;
                rfRENum.Enabled = true;
                txtAllotmentAmount.Enabled = true;
            }
            else
            {
                rbAccept.Checked = false;
                rbReject.Checked = true;
                rfRevisedEstimate.Enabled = false;
                rfRENum.Enabled = false;
                txtAllotmentAmount.Enabled = false;
            }
        }


    }

    protected void rbAccept_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton rbAccept = (RadioButton)sender;
        GridViewRow gvr = (GridViewRow)rbAccept.NamingContainer;
        TextBox txtAllotmentAmount = gvr.FindControl("txtAllotmentAmount") as TextBox;
        RequiredFieldValidator rfRevisedEstimate = gvr.FindControl("rfRevisedEstimate") as RequiredFieldValidator;
        RegularExpressionValidator rfRENum = gvr.FindControl("rfRENum") as RegularExpressionValidator;
        if (rbAccept.Checked)
        {
            txtAllotmentAmount.Enabled = true;
            rfRevisedEstimate.Enabled = true;
            rfRENum.Enabled = true;
        }
    }

    protected void rbReject_CheckedChanged(object sender, EventArgs e)
    {
        RadioButton rbAccept = (RadioButton)sender;
        GridViewRow gvr = (GridViewRow)rbAccept.NamingContainer;
        TextBox txtAllotmentAmount = gvr.FindControl("txtAllotmentAmount") as TextBox;
        RequiredFieldValidator rfRevisedEstimate = gvr.FindControl("rfRevisedEstimate") as RequiredFieldValidator;
        RegularExpressionValidator rfRENum = gvr.FindControl("rfRENum") as RegularExpressionValidator;
        if (rbAccept.Checked)
        {
            txtAllotmentAmount.Text = "";
            txtAllotmentAmount.Enabled = false;
            rfRevisedEstimate.Enabled = false;
            rfRENum.Enabled = false;
        }
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        try
        {
            if(!IsValid)
            {
                return;
            }
            foreach (GridViewRow gvr in gvFinalReq.Rows)
            {
                Label lblartdID = gvr.FindControl("lblartdID") as Label;
                TextBox txtAllotmentAmount = gvr.FindControl("txtAllotmentAmount") as TextBox;
                RadioButton rbAccept = gvr.FindControl("rbAccept") as RadioButton;
                RadioButton rbReject = gvr.FindControl("rbReject") as RadioButton;
                SqlParameter[] prm = new SqlParameter[]
                        {
                        new SqlParameter("@AllotmentAmount",rbAccept.Checked?txtAllotmentAmount.Text:(object)DBNull.Value),
                        new SqlParameter("@IsAllotmentTempAccept",rbAccept.Checked?'Y':'N'),
                        new SqlParameter("@artdID",lblartdID.Text),
                        };
                gd.insExecuteSP("updTempSaveAllotmentRequisition", prm);  
            }
            lblMessage.Text = "Saved Successfully";
        }
        catch (Exception)
        {
            lblMessage.Text = "Error Occured!!!";
        }
        
    }

    protected void txtAllotmentAmount_TextChanged(object sender, EventArgs e)
    {
        TextBox txtAllotmentAmount = (TextBox)sender;
        GridViewRow gvr = (GridViewRow)txtAllotmentAmount.NamingContainer;
        Label lblRequsitionAmount = (Label)gvr.FindControl("lblRequsitionAmount");
        try
        {
            
            if (decimal.Parse(txtAllotmentAmount.Text)>decimal.Parse(lblRequsitionAmount.Text))
            {
                txtAllotmentAmount.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "alertmessage", "alert('Allotment cannot be greater than Requisition!!!');", true);                
            }
        }
        catch (Exception)
        {
            txtAllotmentAmount.Text = "";
        }
    }
}