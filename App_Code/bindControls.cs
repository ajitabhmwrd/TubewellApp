using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
/// <summary>
/// Summary description for bindControls
/// </summary>
public class bindControls
{
    public bindControls()
    {
        
    }
    public void bindGV(GridView gv,DataTable dt)
    {
        try
        {
            gv.DataSource = dt;
            gv.DataBind();
        }
        catch (Exception ex)
        {
        }
    }
    public void bindDDL(DropDownList ddl, DataTable dt,string text, string val)
    {
        try
        {
            ddl.Items.Clear();
            ddl.DataTextField = text;
            ddl.DataValueField = val;
            ddl.DataSource = dt;
            ddl.DataBind();
            ddl.Items.Insert(0, new ListItem("Select", "0"));
        }
        catch (Exception ex)
        {
            ddl.Items.Clear();
            ddl.Items.Insert(0, new ListItem("Select", "0"));
        }
    }
}