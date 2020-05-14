<%@ Page Title="" Language="C#" MasterPageFile="~/SE/seMaster.master" AutoEventWireup="true" CodeFile="TwAddTecnician.aspx.cs" Inherits="SE_TwAddTecnician" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Add new technician/ Suppliers</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 p-1">
                        <a class="btn btn-primary btn-sm" href="TwTechnicialList.aspx">Back</a>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row">
                     <div class="col-md-3 p-1">
                        Empanelment Type*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="ddlListType" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlListType" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Firm Type*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlFirmType" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlFirmType" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Name/Firm Name*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtNameFirm" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtNameFirm" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Registration No (If any)                    
                        <asp:TextBox ID="txtRegNo" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Mobile*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile" ErrorMessage="(Invalid)" ValidationExpression="[0-9]{10}" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control form-control-sm" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Altlernate Mobile
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAltMobile" ErrorMessage="(Invalid)" ValidationExpression="[0-9]{10}" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtAltMobile" runat="server" CssClass="form-control form-control-sm" MaxLength="10"></asp:TextBox>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" ValidationGroup="TubewellEntry" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary btn-sm" OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
        
</asp:Content>





