using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AssignBlockAEJE : System.Web.UI.Page
{
    bindControls bc = new bindControls();
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            bindGVBlock();
        }
    }
    public void bindGVBlock()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
            DataTable dt = gd.getDataTable("getAllBlocksByDistCode", prm);
            bc.bindGV(gvBlock, dt);
        }
        catch (Exception ex)
        {
        }
    }

    protected void gvBlock_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvBlock.EditIndex = e.NewEditIndex;
        bindGVBlock();
    }

    protected void gvBlock_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        try
        {
            Label lblBlockCode = gvBlock.Rows[e.RowIndex].FindControl("lblBlockCode") as Label;
            DropDownList ddlAE = gvBlock.Rows[e.RowIndex].FindControl("ddlAE") as DropDownList;
            DropDownList ddlJE = gvBlock.Rows[e.RowIndex].FindControl("ddlJE") as DropDownList;
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockCode",lblBlockCode.Text),
                    new SqlParameter("@JEEmpID",ddlJE.SelectedValue),
                    new SqlParameter("@AEEmpID",ddlAE.SelectedValue),
                    new SqlParameter("@UpdatedByID",Session["LoginId"].ToString()),
                    new SqlParameter("@UpdatedByIP",customVariables.GetIPAddress())
                            };
            gd.insExecuteSP("updBlockAEJE", prm);
            gvBlock.EditIndex = -1;
            bindGVBlock();
        }
        catch (Exception ex)
        {
        }
    }

    protected void gvBlock_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvBlock.EditIndex = -1;
        bindGVBlock();
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
                    DropDownList ddlAE = (DropDownList)e.Row.FindControl("ddlAE");
                    DropDownList ddlJE = (DropDownList)e.Row.FindControl("ddlJE");
                    SqlParameter[] prm = new SqlParameter[]{
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
                    SqlParameter[] prm1 = new SqlParameter[]{
                        new SqlParameter("@DistCode",Session["DistCode"].ToString())
                    };
                    DataTable dtAE = gd.getDataTable("getAEByDist", prm);
                    bc.bindDDL(ddlAE, dtAE, "Name", "EmpID");
                    ddlAE.Items.RemoveAt(0);
                    ddlAE.Items.Insert(0, new ListItem("Not Assigned", "0"));
                    DataTable dtJE = gd.getDataTable("getJEByDist", prm1);
                    bc.bindDDL(ddlJE, dtJE, "Name", "EmpID");
                    ddlJE.Items.RemoveAt(0);
                    ddlJE.Items.Insert(0, new ListItem("Not Assigned", "0"));
                    string AEEmpID = dr["AEEmpID"].ToString();
                    string JEEmpID = dr["AEEmpID"].ToString();
                    if (!string.IsNullOrEmpty(AEEmpID) || AEEmpID!="0")
                        ddlAE.SelectedValue = dr["AEEmpID"].ToString();
                    if (!string.IsNullOrEmpty(JEEmpID) || JEEmpID!="0")
                        ddlJE.SelectedValue = dr["JEEmpID"].ToString();                    
                }
                catch (Exception ex)
                {
                }
            }
        }
    }
}