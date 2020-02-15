using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EE_AssignMukhiaPanchayatSachiv : System.Web.UI.Page
{
    bindControls bc = new bindControls();
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
            DataTable dt = gd.getDataTable("getTubewellPanchayat", prm);
            bc.bindGV(gvBlock, dt);
        }
        catch (Exception ex)
        {
            string message = ex.ToString();
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
            Label lblPanchayatCode = gvBlock.Rows[e.RowIndex].FindControl("lblPanchayatCode") as Label;
            DropDownList ddlMukhiya = gvBlock.Rows[e.RowIndex].FindControl("ddlMukhiya") as DropDownList;
            DropDownList ddlPanchayatSachiv = gvBlock.Rows[e.RowIndex].FindControl("ddlPanchayatSachiv") as DropDownList;
            SqlParameter[] prm = new SqlParameter[]{
                    new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                    new SqlParameter("@BlockCode",lblBlockCode.Text),
                    new SqlParameter("@PanchayatCode",lblPanchayatCode.Text),
                    new SqlParameter("@Mukhiya",ddlMukhiya.SelectedValue),
                    new SqlParameter("@PanchayatSachiv",ddlPanchayatSachiv.SelectedValue),
                    new SqlParameter("@UpdatedByID",Session["LoginId"].ToString()),
                    new SqlParameter("@UpdatedByIP",customVariables.GetIPAddress())
                            };
            gd.insExecuteSP("updMukhiyaPanSachiv", prm);
            gvBlock.EditIndex = -1;
            bindGVBlock();
        }
        catch (Exception ex)
        {
            string message = ex.ToString();
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
                    DropDownList ddlMukhiya = (DropDownList)e.Row.FindControl("ddlMukhiya");
                    DropDownList ddlPanchayatSachiv = (DropDownList)e.Row.FindControl("ddlPanchayatSachiv");
                    string BlockCode = ((Label)e.Row.FindControl("lblBlockCode")).Text;
                    string PanchayatCode = ((Label)e.Row.FindControl("lblPanchayatCode")).Text;
                    SqlParameter[] prm = new SqlParameter[]{
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@BlockID",BlockCode),
                        new SqlParameter("@PanchyatID",PanchayatCode)
                    };
                    SqlParameter[] prm1 = new SqlParameter[]{
                        new SqlParameter("@DistCode",Session["DistCode"].ToString()),
                        new SqlParameter("@BlockID",BlockCode),
                        new SqlParameter("@PanchyatID",PanchayatCode)

                    };
                    DataTable dtMukhiya = gd.getDataTable("getMukhiyaByPanchayat", prm);
                    bc.bindDDL(ddlMukhiya, dtMukhiya, "Name", "EmpID");
                    ddlMukhiya.Items.RemoveAt(0);
                    ddlMukhiya.Items.Insert(0, new ListItem("Not Assigned", "0"));
                    DataTable dtPanchayatSachiv = gd.getDataTable("getPanchayatSachivByPanchayat", prm1);
                    bc.bindDDL(ddlPanchayatSachiv, dtPanchayatSachiv, "Name", "EmpID");
                    ddlPanchayatSachiv.Items.RemoveAt(0);
                    ddlPanchayatSachiv.Items.Insert(0, new ListItem("Not Assigned", "0"));
                    string Mukhiya = dr["Mukhiya"].ToString();
                    string PanchayatSachiv = dr["PanchayatSachiv"].ToString();
                    if (!string.IsNullOrEmpty(Mukhiya) || Mukhiya != "0")
                        ddlMukhiya.SelectedValue = dr["Mukhiya"].ToString();
                    if (!string.IsNullOrEmpty(PanchayatSachiv) || PanchayatSachiv != "0")
                        ddlPanchayatSachiv.SelectedValue = dr["PanchayatSachiv"].ToString();
                }
                catch (Exception ex)
                {
                    string message = ex.ToString();
                }
            }
        }
    }
}