﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for customVariables
/// </summary>
public static class customVariables
{

    public static string GetIPAddress()
    {
        System.Web.HttpContext context = System.Web.HttpContext.Current;
        string ipAddress = context.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

        if (!string.IsNullOrEmpty(ipAddress))
        {
            string[] addresses = ipAddress.Split(',');
            if (addresses.Length != 0)
            {
                return addresses[0];
            }
        }
        return context.Request.ServerVariables["REMOTE_ADDR"];
    }

    public static object chkTxtBox(object value)
    {
        return string.IsNullOrWhiteSpace(value.ToString()) ? (object)DBNull.Value : value;
    }
    public static object chkDDL(object value)
    {
        return value.ToString()=="0" ? (object)DBNull.Value : value;
    }

}