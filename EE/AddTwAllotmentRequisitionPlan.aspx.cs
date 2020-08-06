using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class EE_AddTwAllotmentRequisitionPlan : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            //bindDDLStatus();
            //bindDDLType();
            //bindDDLCriticalStatus();
            bindgvFinalReq();
        }        
    }
    public void bindgvFinalReq()
    {
        SqlParameter[] prm = new SqlParameter[]
                    {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
        DataTable dt = gd.getDataTable("getTwAllotmentRequisition", prm);
        bc.bindGV(gvFinalReq,dt);
        if(dt.Rows.Count>0)
        {
            btnLock.Visible = true;
        }
        else
        {
            btnLock.Visible = false;
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
    public void bindDDLTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
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
    }
    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
    }
    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        txtAAAmount.Text = "";
        txtTS.Text = "";
        ddlIsRevised.ClearSelection();
        ddlRevisedECApprovedBy.ClearSelection();
        foreach (GridViewRow gvr in gvFinalReq.Rows)
        {
            Label lblTubewellID = gvr.FindControl("lblTubewellID") as Label;
            if (ddlTubewell.SelectedValue == lblTubewellID.Text)
            {
                lblMessage.Text = "Tube well already added";
                return;
            }
        }
        if (!checkTwRequisitionExist())
        {
            lblMessage.Text = "Requsition alredy exist on selected Tube well!!!";
            return;
        }
        SqlParameter[] prmTwDetail = new SqlParameter[]
                    {
                        new SqlParameter("@ID",ddlTubewell.SelectedValue)
                    };
        DataTable dtTwDetail = gd.getDataTable("getTubewellByDistCodeRPt", prmTwDetail);
        bc.bindGV(gvTubewell, dtTwDetail);
        SqlParameter[] prmEC = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue)
                    };
        DataTable dtEC = gd.getDataTable("getAdmAprBySearch", prmEC);
        string AdmAprID = "";
        if (dtEC.Rows.Count > 0)
        {
            DataTable dtECFiltered = dtEC.AsEnumerable()
              .Where(row => row.Field<String>("IsActive") == "Y")
              .CopyToDataTable();
            bc.bindGV(gvEC, dtECFiltered);
            AdmAprID = dtECFiltered.Rows[0]["ID"].ToString();
        }
        SqlParameter[] prmAllotment = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                        new SqlParameter("@AdmAprID",AdmAprID)
                    };
        DataTable dtAllotment = gd.getDataTable("getAllotmentbyTubewellHQ", prmAllotment);
        if (dtAllotment.Rows.Count > 0)
        {
            divMukhiya.Visible = true;
        }
        else
        {
            lblMessage.Text = "Allotment doesnot exists on selected Tube Well!!!";
            //ClientScript.RegisterStartupScript(this.GetType(), "alertmessage", "alert('Allotment doesnot exists on selected Tube Well!!!');", true);
            divMukhiya.Visible = false;
        }
        bc.bindGV(gvAllotment, dtAllotment);

    }
    protected void txtExpenditure_TextChanged(object sender, EventArgs e)
    {
        TextBox txtExpenditure = (TextBox)sender;
        GridViewRow gvr = (GridViewRow)txtExpenditure.NamingContainer;
        Label lblSurrender = (Label)gvr.FindControl("lblSurrender");
        Label lblAllotmentAmount = (Label)gvr.FindControl("lblAllotmentAmount");
        try
        {
            decimal surrenderAmount = decimal.Parse(lblAllotmentAmount.Text) - decimal.Parse(txtExpenditure.Text);
            lblSurrender.Text = surrenderAmount.ToString();
            if (surrenderAmount < 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alertmessage", "alert('Expediture cannot be greater than Allotment!!!');", true);
                txtExpenditure.Text = "";
                lblSurrender.Text = "";
            }
        }
        catch (Exception)
        {
            txtExpenditure.Text = "";
            lblSurrender.Text = "";
        }

    }
    protected void ddlIsRevised_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtRevisedEstimate.Text = "";
        if (ddlIsRevised.SelectedValue == "Y")
        {
            divIsRevised.Visible = true;
            divIsRevisedECApprovedBy.Visible = true;
            rfRevisedEstimate.Enabled = true;
            rfRevisedECApprovedBy.Enabled = true;
        }
        else
        {
            divIsRevised.Visible = false;
            divIsRevisedECApprovedBy.Visible = false;
            rfRevisedEstimate.Enabled = false;
            rfRevisedECApprovedBy.Enabled = false;
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try
        {

            lblMessage.Text = "";
            if (Page.IsValid == false)
            {
                return;
            }
            
            foreach (GridViewRow gvr in gvFinalReq.Rows)
            {
                Label lblTubewellID = gvr.FindControl("lblTubewellID") as Label;      
                if (ddlTubewell.SelectedValue == lblTubewellID.Text)
                {
                    lblMessage.Text = "Tube well already added";
                    return;
                }
            }
            if(!checkTwRequisitionExist())
            {
                lblMessage.Text = "Requsition alredy exist on selected Tube well";
                return;
            }
            if (!fuMBPDF.HasFile || !fuUCPDF.HasFile || !fuPhoto.HasFile)
            {
                lblMessage.Text = "Please Attach MB & UC as PDF!!!";
                return;
            }
            decimal EC = 0;
            decimal Expenditure = 0;
            if (ddlIsRevised.SelectedValue == "Y")
            {
                EC = decimal.Parse(txtRevisedEstimate.Text);
            }
            else
            {
                Label lblIsRevised = gvEC.Rows[0].FindControl("lblIsRevised") as Label;
                Label lblRevisedEC = gvEC.Rows[0].FindControl("lblRevisedEC") as Label;
                Label lblEstimatedCost = gvEC.Rows[0].FindControl("lblEstimatedCost") as Label;
                if (lblIsRevised.Text == "Y")
                {
                    EC = decimal.Parse(lblRevisedEC.Text);
                }
                else
                {
                    EC = decimal.Parse(lblEstimatedCost.Text);
                }
            }
            foreach(GridViewRow gvr in gvAllotment.Rows)
            {
                Expenditure += decimal.Parse((gvr.FindControl("txtExpenditure") as TextBox).Text);
            }
            if(EC-Expenditure<decimal.Parse(txtRequisitionAmount.Text))
            {
                lblMessage.Text = "Requisition Amount cannot exeed than Estimate/ Revised Estimate ("+ EC + ") - Expenditure ("+Expenditure+") i.e. Rs "+ (EC - Expenditure);
                return;
            }
            string uploadFolder = Request.PhysicalApplicationPath + "AltReqPdf\\";
            string MBLocation = "";
            string UCLocation = "";
            string PhotoLocation = "";
            
            if (fuPhoto.HasFile)
            {
                int fileSize = fuPhoto.PostedFile.ContentLength;
                if (fileSize > (1024 * 200))
                {
                    lblMessage.Text = "Filesize of Photo is too large. Maximum file size permitted is " + 200 + "KB";
                    return;
                }
                string str = fuPhoto.FileName;
                string extension = Path.GetExtension(fuPhoto.PostedFile.FileName);
                if (extension != ".jpg")
                {
                    lblMessage.Text = "Only .jpg file is allowed!!!!";
                    return;
                }
                int i = 1;
                PhotoLocation = "Ph" + ddlTubewell.SelectedValue + extension;
                while (File.Exists(uploadFolder + PhotoLocation))
                {
                    i++;
                    PhotoLocation = "Ph" + ddlTubewell.SelectedValue + i.ToString() + extension;
                }
            }

            if (fuMBPDF.HasFile)
            {
                int fileSize = fuMBPDF.PostedFile.ContentLength;
                if (fileSize > (1024 * 10240))
                {
                    lblMessage.Text = "Filesize of PDF is too large. Maximum file size permitted is " + 10 + "MB";
                    return;
                }
                string str = fuMBPDF.FileName;
                string extension = Path.GetExtension(fuMBPDF.PostedFile.FileName);
                if (extension != ".pdf")
                {
                    lblMessage.Text = "Only .pdf file is allowed!!!!";
                    return;
                }
                int i = 1;
                MBLocation = "AMB" + ddlTubewell.SelectedValue + extension;
                while (File.Exists(uploadFolder + MBLocation))
                {
                    i++;
                    MBLocation = "AMB" + ddlTubewell.SelectedValue + i.ToString() + extension;
                }
            }

            if (fuUCPDF.HasFile)
            {
                int fileSize = fuUCPDF.PostedFile.ContentLength;
                if (fileSize > (1024 * 10240))
                {
                    lblMessage.Text = "Filesize of PDF is too large. Maximum file size permitted is " + 10 + "MB";
                    return;
                }
                string str = fuUCPDF.FileName;
                string extension = Path.GetExtension(fuUCPDF.PostedFile.FileName);
                if (extension != ".pdf")
                {
                    lblMessage.Text = "Only .pdf file is allowed!!!!";
                    return;
                }
                int i = 1;
                UCLocation = "AUC" + ddlTubewell.SelectedValue + extension;
                while (File.Exists(uploadFolder + UCLocation))
                {
                    i++;
                    UCLocation = "AUC" + ddlTubewell.SelectedValue + i.ToString() + extension;
                }
            }


            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@IsGroupReq","N"),
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue),
                        new SqlParameter("@Status", ((Label)gvTubewell.Rows[0].FindControl("lblStatus")).Text),
                        new SqlParameter("@CSOStatus",((Label)gvTubewell.Rows[0].FindControl("lblCriticalType")).Text),
                        new SqlParameter("@EstimateID",((Label)gvEC.Rows[0].FindControl("lblID")).Text),
                        new SqlParameter("@IsRevised",ddlIsRevised.SelectedValue),
                        new SqlParameter("@RevisedEC",ddlIsRevised.SelectedValue=="Y"?txtRevisedEstimate.Text:(object)DBNull.Value),
                        new SqlParameter("@AdministrativeApprovalAmount",txtAAAmount.Text),
                        new SqlParameter("@TechnicalSanctionAmount",txtTS.Text),
                        new SqlParameter("@WorkProgress",txtWorkProgress.Text),
                        new SqlParameter("@MBLocation","~\\AltReqPdf\\" + MBLocation),
                        new SqlParameter("@PhotoLocation","~\\AltReqPdf\\" +PhotoLocation),
                        new SqlParameter("@UCLocation","~\\AltReqPdf\\" +UCLocation),
                        new SqlParameter("@EntryByID",Session["LoginId"].ToString()),
                        new SqlParameter("@EntryByIP",customVariables.GetIPAddress()),
                        new SqlParameter("@EntryByDesignation",Session["Designation"].ToString()),
                        new SqlParameter("@RequsitionAmount",txtRequisitionAmount.Text),
                        new SqlParameter("@Remarks",txtRemarks.Text),
                    };
            response r = gd.insExecuteSPReturnID("insTubewellAllotmentRequisition", prm);
            lblMessage.Text = r.message;
            if (r.success == "1")
            {
                fuMBPDF.SaveAs(uploadFolder + MBLocation);
                fuUCPDF.SaveAs(uploadFolder + UCLocation);
                fuPhoto.SaveAs(uploadFolder + PhotoLocation);
                foreach (GridViewRow gvr in gvAllotment.Rows)
                {                    
                    Label lblAllotmentID = gvr.FindControl("lblAllotmentID") as Label;
                    TextBox txtExpenditure = gvr.FindControl("txtExpenditure") as TextBox;
                    SqlParameter[] prmAlt = new SqlParameter[]
                    {
                        new SqlParameter("@Expenditure",txtExpenditure.Text),
                        new SqlParameter("@AllotmentID",lblAllotmentID.Text),
                    };
                    gd.insExecuteSP("updTubewellExpenditureRequisition", prmAlt);
                }
                lblMessage.Text = "Added successfully";
                bindgvFinalReq();
                reset();
            }
        }
        catch (Exception)
        {
            lblMessage.Text = "Some Error Occured!!!";
        }
    }
    public void reset()
    {
        ddlIsRevised.ClearSelection();
        txtRevisedEstimate.Text = "";
        txtWorkProgress.Text = "";
        txtRequisitionAmount.Text = "";
        divMukhiya.Visible = false;
        ddlBlock.ClearSelection();
        bindDDLPanchyat();
        bindDDLTubewell();
        bindgvFinalReq();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "";
        reset();
        
    }
    protected void gvFinalReq_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string AdmAprID = (e.Row.FindControl("lblAdmAprID") as Label).Text;
            string TubewellID = (e.Row.FindControl("lblTubewellID") as Label).Text;
            GridView gvFRAllotment = e.Row.FindControl("gvFRAllotment") as GridView;
            SqlParameter[] prmAllotment = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",TubewellID),
                        new SqlParameter("@AdmAprID",AdmAprID)
                    };
            DataTable dtAllotment = gd.getDataTable("getAllotmentbyTubewellHQ", prmAllotment);
            bc.bindGV(gvFRAllotment, dtAllotment);
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
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnkDelete = (LinkButton)sender;
        GridViewRow gvr = (GridViewRow)lnkDelete.NamingContainer;
        SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@ID",(gvr.FindControl("lblartdID") as Label).Text),
                        new SqlParameter("@RequisitionID",(gvr.FindControl("lblRequisitionID") as Label).Text),
                        new SqlParameter("@gvRowsCount",gvFinalReq.Rows.Count)
                    };
        lblMessage.Text= gd.insExecuteSP("deleteTwRequsition", prm);
        bindgvFinalReq();
    }
    protected void btnLock_Click(object sender, EventArgs e)
    {
        divMukhiya.Visible = false;
        SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@RequisitionID",(gvFinalReq.Rows[0].FindControl("lblRequisitionID") as Label).Text)
                    };
        lblMessage.Text = gd.insExecuteSP("updLockAllotmentRequisition", prm);
        bindgvFinalReq();
    }
    public bool checkTwRequisitionExist()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@TubewellID",ddlTubewell.SelectedValue)
                    };
            DataTable dt = gd.getDataTable("checkTwRequisitionExist", prm);
            if(dt.Rows.Count>0)
            {
                return false;
            }
        }
        catch (Exception)  { }
        return true;
    }
}