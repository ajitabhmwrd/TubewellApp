using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.OleDb;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_gwlEntry : System.Web.UI.Page
{
    getData gd = new getData();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtDate.Attributes.Add("ReadOnly", "True");
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            lblextMsg.Text = "";
            if (!FileUpload1.HasFile)
            {
                Response.Write("<script>alert('Please upload excel file!!!');</script>");
                return;
            }
            if (txtDate.Text.Trim() == "")
            {
                Response.Write("<script>alert('Please select settlement date!!!');</script>");
                return;
            }
            //Coneection String by default empty  
            string ConStr = "";
            //Extantion of the file upload control saving into ext because   
            //there are two types of extation .xls and .xlsx of Excel   
            string ext = Path.GetExtension(FileUpload1.FileName).ToLower();
            //getting the path of the file   
            string path = Server.MapPath("~/ResponseFiles/" + FileUpload1.FileName);
            //saving the file inside the MyFolder of the server  
            FileUpload1.SaveAs(path);
            //Label1.Text = FileUpload1.FileName + "\'s Data showing into the GridView";  
            //checking that extantion is .xls or .xlsx  
            if (ext.Trim() == ".xls")
            {
                //connection string for that file which extantion is .xls  
                ConStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + path + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=2\"";
            }
            else if (ext.Trim() == ".xlsx")
            {
                //connection string for that file which extantion is .xlsx  
                ConStr = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + path + ";Extended Properties=\"Excel 12.0;HDR=Yes;IMEX=2\"";
            }
            //making query  
            string query = "SELECT * FROM [Sheet1$]";
            //Providing connection  
            using (OleDbConnection conn = new OleDbConnection(ConStr))
            {
                //checking that connection state is closed or not if closed the   
                //open the connection  
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
                //create command object  
                OleDbCommand cmd = new OleDbCommand(query, conn);
                // create a data adapter and get the data into dataadapter  
                OleDbDataAdapter da = new OleDbDataAdapter(cmd);
                DataSet ds = new DataSet();
                //fill the Excel data to data set  
                da.Fill(ds);
                int totalRecords = ds.Tables[0].Rows.Count;
                try
                {
                    int count = 0;
                    foreach (DataRow dr in ds.Tables[0].Rows)
                    {
                        SqlParameter[] prm = new SqlParameter[]{
                            new SqlParameter("@Longitude",dr["Longitude"].ToString()),
                            new SqlParameter("@Latitude",dr["Latitude"].ToString()),
                            new SqlParameter("@GWLInMeter",dr["GWL"].ToString()),
                            new SqlParameter("@GWLDate",DateTime.Parse(txtDate.Text.Trim()).ToString("yyyy-MM-dd"))
                            };
                        count += int.Parse( gd.insExecuteSP("insGWLData", prm));
                    }
                    lblextMsg.Text = count + " Records inserted successfully. (Total records = " + totalRecords + ") From File : " + FileUpload1.FileName;
                    txtDate.Text = "";
                }
                catch (Exception ex)
                {
                    lblextMsg.Text = ex.ToString();
                }
                conn.Close();


            }
        }
        catch (Exception ex)
        {
            lblextMsg.Text = ex.ToString();
        }
    }
}