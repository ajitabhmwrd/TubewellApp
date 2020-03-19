using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "AndroidWCFService" in code, svc and config file together.

public class AndroidWCFService : IAndroidWCFService
{
    getData gd = new getData();

    public AppDetail getAppDetail()
    {
        try
        {
            DataTable dt = gd.getDataTable("getAppDetail");
            if (dt.Rows.Count > 0)
            {
                return new AppDetail
                {
                    Priority = dt.Rows[0]["Priority"].ToString(),
                    AdminMsg = dt.Rows[0]["AdminMsg"].ToString(),
                    AdminTitle = dt.Rows[0]["AdminTitle"].ToString(),
                    UpdateMsg = dt.Rows[0]["UpdateMsg"].ToString(),
                    UpdateTitle = dt.Rows[0]["UpdateTitle"].ToString(),
                    aapUrl = dt.Rows[0]["aapUrl"].ToString(),
                    Role = dt.Rows[0]["Role"].ToString(),
                    Ver = dt.Rows[0]["Ver"].ToString()
                };
            }
        }
        catch (Exception ex)
        {
        }
        return new AppDetail { };
    }

    public ClsLogin VerifyLogin(string UserID, string Password)
    {
        try
        {

            Encryptor enc = new Encryptor(Encryptor.PrivateKey);
            SqlParameter[] prm = new SqlParameter[]
            {
                new SqlParameter("@LoginId",UserID),
                new SqlParameter("@Pass",enc.Encrypt(Password))
            };
            DataTable dt = gd.getDataTable("getLoginDetails", prm);
            if (dt.Rows.Count == 1)
            {
                string message = "Success";
                bool status = true;
                string RoleId = dt.Rows[0]["RoleId"].ToString();
                string RoleName = dt.Rows[0]["RoleName"].ToString();
                string ZoneCode = dt.Rows[0]["ZoneCode"].ToString();
                string ZoneName = dt.Rows[0]["ZoneName"].ToString();
                string DivisionCode = dt.Rows[0]["DivisionCode"].ToString();
                string DivisionName = dt.Rows[0]["DivisionName"].ToString();
                string DistCode = dt.Rows[0]["DistCode"].ToString();
                string DistName = dt.Rows[0]["DistName"].ToString();
                return new ClsLogin
                {
                    message = message,
                    status = status,
                    RoleId = RoleId,
                    RoleName = RoleName,
                    DistCode = DistCode != "" ? DistCode : null,
                    DistName = DistName != "" ? DistName : null,
                    ZoneCode = ZoneCode != "" ? ZoneCode : null,
                    ZoneName = ZoneName != "" ? ZoneName : null,
                    DivisionCode = DivisionCode != "" ? DivisionCode : null,
                    DivisionName = DivisionName != "" ? DivisionName : null
                };
            }
            else
            {

            }
            return new ClsLogin { message = "Invalid Credentials, Please try again!!!", status = false };
        }
        catch (Exception ex)
        {
            return new ClsLogin { message = "Some error occured!!!", status = false };
        }
    }

}