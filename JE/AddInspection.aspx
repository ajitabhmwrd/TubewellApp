<%@ Page Title="" Language="C#" MasterPageFile="~/JE/JEMaster.master" AutoEventWireup="true" CodeFile="AddInspection.aspx.cs" Inherits="JE_AddInspection" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Add new Tube Well Inspection</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 p-1">
                        <a class="btn btn-primary btn-sm" href="TubwellInpectionList.aspx">Back To Tubewell Inspection List</a>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>                    
                </div>
                <div class="row">
                    <div class="col-md-3 p-1">
                        Inpection Date(dd/MM/yyyy)*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtInspectionDate" Text="(Required)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ForeColor = "Red" ControlToValidate="txtInspectionDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="(Invalid date)"/>
                        <asp:TextBox ID="txtInspectionDate" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                        <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtInspectionDate" runat="server" TargetControlID="txtInspectionDate" Format="dd/MM/yyyy"> </cc1:CalendarExtender> 
                    </div>
                    <div class="col-md-3 p-1">
                        Block*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlPanchayat" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    
                    <div class="col-md-3 p-1">
                        Tubewell*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="0" runat="server" ControlToValidate="ddlTubewell" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlTubewell" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 1*
                        <asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="fuImage1" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"  ValidationGroup="TubewellEntry" Font-Bold="true"
                        ControlToValidate="fuImage1" runat="server" ForeColor="Red" ErrorMessage="(.jpg file only)"
                        Display="Dynamic" />
                        <asp:FileUpload ID="fuImage1" runat="server" />
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 2
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"  ValidationGroup="TubewellEntry" Font-Bold="true"
                        ControlToValidate="fuImage2" runat="server" ForeColor="Red" ErrorMessage="(.jpg file only)"
                        Display="Dynamic" />
                        <asp:FileUpload ID="fuImage2" runat="server" />       
                        
                    </div>
                    <div class="col-md-3 p-1 ">   
                        Image 3
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"  ValidationGroup="TubewellEntry" Font-Bold="true"
                        ControlToValidate="fuImage3" runat="server" ForeColor="Red" ErrorMessage="(.jpg file only)"
                        Display="Dynamic" />
                        <asp:FileUpload ID="fuImage3" runat="server" />  
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 3
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.jpg)$"  ValidationGroup="TubewellEntry" Font-Bold="true"
                        ControlToValidate="fuImage4" runat="server" ForeColor="Red" ErrorMessage="(.jpg file only)"
                        Display="Dynamic" />
                        <asp:FileUpload ID="fuImage4" runat="server" />                  
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 1 Comment Type*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlCommentType1" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlCommentType1" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 2 Comment Type
                        <asp:DropDownList ID="ddlCommentType2" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>      
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 3 Comment Type
                        <asp:DropDownList ID="ddlCommentType3" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Select</asp:ListItem>  
                            </asp:DropDownList>
                    </div>                    
                    <div class="col-md-3 p-1 ">
                        Image 4 Comment Type
                        <asp:DropDownList ID="ddlCommentType4" runat="server" CssClass="form-control">
                        <asp:ListItem Value="0">Select</asp:ListItem>  
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 1 Comment*
                        <asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="txtComment1" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />
                        <asp:TextBox ID="txtComment1" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>                  
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 2 Comment
                        <%--<asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="txtComment2" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />--%>
                        <asp:TextBox ID="txtComment2" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>                  
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 3 Comment
                        <%--<asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="txtComment3" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />--%>
                        <asp:TextBox ID="txtComment3" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>                  
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 4 Comment
                        <%--<asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="txtComment4" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />--%>
                        <asp:TextBox ID="txtComment4" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control"></asp:TextBox>                  
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" ValidationGroup="TubewellEntry" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary btn-sm" OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlBlock" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlPanchayat" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger  ControlID="btnSave" />
            <asp:AsyncPostBackTrigger  ControlID="btnReset" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>



