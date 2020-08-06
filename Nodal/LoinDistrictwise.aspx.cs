using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Nodal_LoinDistrictwise : System.Web.UI.Page
{
    getData gd = new getData();
    bindControls bc = new bindControls();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
        }
    }

    public void bindgvTubewell()
    {
        try
        {
            SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@StartDate",  DateTime.Parse(txtStartDate.Text).ToString("yyyy-MM-dd")),
                        new SqlParameter("@EndDate",  DateTime.Parse(txtEndDate.Text).ToString("yyyy-MM-dd"))
                    };
            DataTable dt = gd.getDataTable("getLoginDetailDistWise", prm);
            bc.bindGV(gvTubewell, dt);
            lblDate.Text = "From Date " + DateTime.Parse(txtStartDate.Text).ToString("dd MMM yyyy") +" to " + DateTime.Parse(txtEndDate.Text).ToString("dd MMM yyyy");
        }
        catch (Exception ex)
        {
        }
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        divHead.Visible = true;
        bindgvTubewell();
    }

    protected void btnExportToExcel_Click(object sender, EventArgs e)
    {
        ExportGridToExcel(gvTubewell,"LoginRpt");
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


    public override void VerifyRenderingInServerForm(Control control)
    {
        /* Verifies that the control is rendered */
    }

    protected void gvTubewell_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)e.Row.DataItem;
            if (int.Parse(dr["EELogin"].ToString()) == 0)
            {
                e.Row.Cells[2].BackColor = System.Drawing.ColorTranslator.FromHtml("#ff8080");
            }
            if (int.Parse(dr["AELogin"].ToString()) == 0)
            {
                e.Row.Cells[3].BackColor = System.Drawing.ColorTranslator.FromHtml("#ff8080");
            }
            if (int.Parse(dr["JELogin"].ToString()) == 0)
            {
                e.Row.Cells[4].BackColor = System.Drawing.ColorTranslator.FromHtml("#ff8080");
            }
        }
    }
}