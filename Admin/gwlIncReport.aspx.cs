using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;

public partial class Admin_gwlIncReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string getlabels()
    {
        string[] dates= new string[] {
            "01/02/2019", "02/02/2019", "03/02/2019", "04/02/2019", "05/02/2019", "06/02/2019", "07/02/2019", "07/02/2019", "08/02/2019", "09/02/2019", "10/02/2019"
        };
        return (new JavaScriptSerializer()).Serialize(dates);
    }
    public double[] getData()
    {
        double[] data = new double[]
            {
                6.75,8.65,9.65,12.25,6.77,5,47.8,56.9,25.2,2.3,8.36
            };
        return data;
    }

}