using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;
using System.Data;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IAndroidWCFService" in both code and config file together.
[ServiceContract]
public interface IAndroidWCFService
{
    [OperationContract]
    [WebInvoke(Method = "GET",
        RequestFormat = WebMessageFormat.Json,
            ResponseFormat = WebMessageFormat.Json,
            BodyStyle = WebMessageBodyStyle.Bare,
            UriTemplate = "getAppDetail")]
    AppDetail getAppDetail();

    [OperationContract]
    [WebInvoke(Method = "POST", 
        BodyStyle = WebMessageBodyStyle.WrappedRequest,
        ResponseFormat = WebMessageFormat.Json,
        RequestFormat = WebMessageFormat.Json,
            UriTemplate = "VerifyLogin")]
    ClsLogin VerifyLogin(string UserID, string Password);
}

[DataContract]
public class ClsLogin
{
    [DataMember]
    public bool status { get; set; }
    [DataMember]
    public string message { get; set; }
    [DataMember]
    public string ZoneCode { get; set; }
    [DataMember]
    public string ZoneName { get; set; }
    [DataMember]
    public string DivisionCode { get; set; }
    [DataMember]
    public string DivisionName { get; set; }
    [DataMember]
    public string DistCode { get; set; }
    [DataMember]
    public string DistName { get; set; }
    [DataMember]
    public string RoleId { get; set; }
    [DataMember]
    public string RoleName { get; set; }
}

public class AppDetail
{
    
    [DataMember]
    public string Priority { get; set; }
    [DataMember]
    public string AdminMsg { get; set; }
    [DataMember]
    public string AdminTitle { get; set; }
    [DataMember]
    public string UpdateMsg { get; set; }
    [DataMember]
    public string UpdateTitle { get; set; }
    [DataMember]
    public string aapUrl { get; set; }
    [DataMember]
    public string Role { get; set; }
    [DataMember]
    public string Ver { get; set; }
}







