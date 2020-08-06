using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for getData
/// </summary>
public class getData
{
    string con = ConfigurationManager.ConnectionStrings["ConnectionStringTubewellApp"].ConnectionString;
    public getData()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public DataSet getDataSet(string spQuery, SqlParameter[] sqlParameters)
    {
        DataSet dt = new DataSet();
        try
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand(spQuery, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (SqlParameter prm in sqlParameters)
                    {
                        cmd.Parameters.Add(prm);
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        catch (Exception ex)
        {
            return null;
        }

    }

    public DataTable getDataTable(string spQuery, SqlParameter[] sqlParameters)
    {
        DataTable dt = new DataTable();
        try
        {
            using(SqlConnection conn=new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand(spQuery,conn))
                {
                    cmd.CommandType =CommandType.StoredProcedure;
                    foreach(SqlParameter prm in sqlParameters)
                    {
                        cmd.Parameters.Add(prm);
                    }
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        catch (Exception ex)
        {
            return null;
        }
        
    }

    public DataTable getDataTable(string spQuery)
    {
        DataTable dt = new DataTable();
        try
        {
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand(spQuery, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;                    
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(dt);
                    return dt;
                }
            }
        }
        catch (Exception ex)
        {
            return null;
        }

    }

    public string insExecuteSP(string spQuery, SqlParameter[] sqlParameters)
    {
        string response = "Error Occured";
        try
        {            
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand(spQuery, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (SqlParameter prm in sqlParameters)
                    {
                        cmd.Parameters.Add(prm);
                    }
                    SqlParameter outResponse = new SqlParameter("@response", SqlDbType.NVarChar, 200) { Direction = ParameterDirection.Output };
                    cmd.Parameters.Add(outResponse);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    response = outResponse.Value.ToString();
                    conn.Close();
                    return response;
                }
            }
        }
        catch (Exception ex)
        {
            return response;
        }

    }

    public response insExecuteSPReturnID(string spQuery, SqlParameter[] sqlParameters)
    {
        string response = "Error Occured!!!";
        string success = "0";
        string ID;
        try
        {
            
            using (SqlConnection conn = new SqlConnection(con))
            {
                using (SqlCommand cmd = new SqlCommand(spQuery, conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    foreach (SqlParameter prm in sqlParameters)
                    {
                        cmd.Parameters.Add(prm);
                    }
                    SqlParameter outResponse = new SqlParameter("@response", SqlDbType.NVarChar, 200) { Direction = ParameterDirection.Output };
                    SqlParameter outsuccess = new SqlParameter("@success", SqlDbType.NVarChar, 200) { Direction = ParameterDirection.Output };
                    SqlParameter outID = new SqlParameter("@ID", SqlDbType.NVarChar, 200) { Direction = ParameterDirection.Output };
                    cmd.Parameters.Add(outResponse);                    
                    cmd.Parameters.Add(outsuccess);
                    cmd.Parameters.Add(outID);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    response = outResponse.Value.ToString();
                    success = outsuccess.Value.ToString();
                    ID = outID.Value.ToString();
                    conn.Close();
                    return new response { success = success, message = response, ID= ID};
                }
            }
        }
        catch (Exception ex)
        {
            return new response { success = "0",
                message = "Error Occured!!!"
                };
        }

    }
}
