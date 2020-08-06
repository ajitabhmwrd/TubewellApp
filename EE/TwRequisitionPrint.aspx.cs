using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_TwRequisitionPrint : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
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
                    new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
                DataTable dt1 = gd.getDataTable("getDistrictByDIstCode", prm1);
                lblCount.Text = gvFinalReq.Rows.Count.ToString();
                lblDist.Text = dt1.Rows[0]["DistName"].ToString();
                lblDistName.Text = dt1.Rows[0]["DistName"].ToString();
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
}