using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AssignJETubewellwise : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindDDLBlock();
            bindDDLType();
            bindDDLStatus();
            bindgvTubewell();
        }
    }

    
    public void bindDDLType()
    {
        try
        {
            DataTable dt = gd.getDataTable("getTubewellType");
            bc.bindDDL(ddlType, dt, "Type", "ID");
        }
        catch (Exception ex)
        {
        }
    }

    public void bindDDLStatus()
    {
        try
        {
            DataTable dt = gd.getDataTable("getTubewellStatus");
            bc.bindDDL(ddlStatus, dt, "Status", "ID");
        }
        catch (Exception ex)
        {
        }
    }
    public void bindgvTubewell()
    {
        try
        {

            SqlParameter[] prm = new SqlParameter[]
                {
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockID",ddlBlock.SelectedValue=="0"?(object)DBNull.Value:ddlBlock.SelectedValue),
                    new SqlParameter("@PanchyatID",ddlPanchayat.SelectedValue=="0"?(object)DBNull.Value:ddlPanchayat.SelectedValue),
                    new SqlParameter("@ID",ddlTubewell.SelectedValue=="0"?(object)DBNull.Value:ddlTubewell.SelectedValue),
                    new SqlParameter("@Status",ddlStatus.SelectedValue=="0"?(object)DBNull.Value:ddlStatus.SelectedItem.Text),
                    new SqlParameter("@Type",ddlType.SelectedValue=="0"?(object)DBNull.Value:ddlType.SelectedItem.Text)
                };
            DataTable dt = gd.getDataTable("getTubewellByDistCodeRPt", prm);
            bc.bindGV(gvTubewell, dt);
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
        bindgvTubewell();
    }

    protected void ddlPanchayat_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLTubewell();
        bindgvTubewell();
    }
    protected void ddlTubewell_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }
    protected void gvTubewell_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        bindgvTubewell();
        gvTubewell.PageIndex = e.NewPageIndex;
        gvTubewell.DataBind();
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        bindDDLBlock();
        ddlPanchayat.ClearSelection();
        ddlTubewell.ClearSelection();
        ddlStatus.ClearSelection();
        ddlType.ClearSelection();
        bindgvTubewell();
    }

    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindgvTubewell();
    }

    protected void ddlDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDDLBlock();
        bindgvTubewell();
    }
    private void ExportGridToExcel(GridView gv, string filename)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.ClearContent();
        Response.ClearHeaders();
        Response.Charset = "";
        string FileName = filename + DateTime.Now + ".xls";
        StringWriter strwritter = new StringWriter();
        HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
        gv.AllowPaging = false;
        this.bindgvTubewell();
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.ms-excel";
        Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
        gv.GridLines = GridLines.Both;
        gv.HeaderStyle.Font.Bold = true;
        gv.RenderControl(htmltextwrtter);
        Response.Write(Regex.Replace(strwritter.ToString(), "</?(a|A).*?>", ""));
        Response.End();

    }
    protected void gvBlock_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                try
                {
                    DataRowView dr = e.Row.DataItem as DataRowView;
                    //DropDownList ddlAE = (DropDownList)e.Row.FindControl("ddlAE");
                    DropDownList ddlJE = (DropDownList)e.Row.FindControl("ddlJE");
                    //SqlParameter[] prm = new SqlParameter[]{
                    //    new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    //};
                    SqlParameter[] prm1 = new SqlParameter[]{
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
                    //DataTable dtAE = gd.getDataTable("getAEByDist", prm);
                    //bc.bindDDL(ddlAE, dtAE, "Name", "EmpID");
                    //ddlAE.Items.RemoveAt(0);
                    //ddlAE.Items.Insert(0, new ListItem("Not Assigned", "0"));
                    DataTable dtJE = gd.getDataTable("getJEByDist", prm1);
                    bc.bindDDL(ddlJE, dtJE, "Name", "EmpID");
                    ddlJE.Items.RemoveAt(0);
                    ddlJE.Items.Insert(0, new ListItem("Not Assigned", "0"));
                    //string AEEmpID = dr["AEEmpID"].ToString();
                    string JEEmpID = dr["JEEmpID"].ToString();
                    //if (!string.IsNullOrEmpty(AEEmpID) || AEEmpID != "0")
                    //    ddlAE.SelectedValue = dr["AEEmpID"].ToString();
                    if (!string.IsNullOrEmpty(JEEmpID) || JEEmpID != "0")
                        ddlJE.SelectedValue = dr["JEEmpID"].ToString();
                }
                catch (Exception ex)
                {
                }
            }
        }
    }
    protected void gvBlock_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvTubewell.EditIndex = e.NewEditIndex;
        bindgvTubewell();
    }
    protected void gvBlock_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label lblBlockCode = gvTubewell.Rows[e.RowIndex].FindControl("lblBlockCode") as Label;
            DropDownList ddlAE = gvTubewell.Rows[e.RowIndex].FindControl("ddlAE") as DropDownList;
            DropDownList ddlJE = gvTubewell.Rows[e.RowIndex].FindControl("ddlJE") as DropDownList;
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockCode",lblBlockCode.Text),
                    new SqlParameter("@JEEmpID",ddlJE.SelectedValue),
                    new SqlParameter("@AEEmpID",ddlAE.SelectedValue),
                    new SqlParameter("@UpdatedByID",Session["LoginId"].ToString()),
                    new SqlParameter("@UpdatedByIP",customVariables.GetIPAddress())
                            };
            gd.insExecuteSP("updBlockAEJE", prm);
            gvTubewell.EditIndex = -1;
            bindgvTubewell();
        }
        catch (Exception ex)
        {
        }
    }

    protected void gvBlock_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvTubewell.EditIndex = -1;
        bindgvTubewell();
    }
}