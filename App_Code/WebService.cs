using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Xml.XPath;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService
{

    getData gd = new getData();
    public WebService()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public DataTable getAppDetail()
    {
        SqlParameter[] prm = new SqlParameter[]
                    {
                        new SqlParameter("@DistCode",(object)DBNull.Value),
                        new SqlParameter("@BlockID",(object)DBNull.Value),
                        new SqlParameter("@PanchyatID",(object)DBNull.Value),
                        new SqlParameter("@ID",(object)DBNull.Value),
                        new SqlParameter("@EstID",(object)DBNull.Value),
                        new SqlParameter("@FinaciyalYear",(object)DBNull.Value)
                    };
        DataTable dt = gd.getDataTable("getTubewellEstimatedCost", prm);
        dt.TableName = "test";
        return dt;
    }

    
}
