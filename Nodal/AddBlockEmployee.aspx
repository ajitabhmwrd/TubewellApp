﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="AddBlockEmployee.aspx.cs" Inherits="EE_AddDistrictEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold">Add new AE/JE</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 p-1">
                        <a class="btn btn-primary btn-sm" href="BlockEmpList.aspx">Back To AE/JE List</a>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>                    
                </div>
                <div class="row">
                    <div class="col-md-3 p-1">
                        Designation*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlDesignation" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlDesignation" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Name*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div> 
                    <div class="col-md-3 p-1">
                        Father Name*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtFatherName" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div> 
                    <div class="col-md-3 p-1">
                        Gender*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="0" runat="server" ControlToValidate="ddlGender" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="M">Male</asp:ListItem>
                            <asp:ListItem Value="F">Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Employee Type*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="0" runat="server" ControlToValidate="ddlEmpType" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlEmpType" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>                            
                            <asp:ListItem Value="R">Regular</asp:ListItem>                            
                            <asp:ListItem Value="T">Temporary</asp:ListItem>                            
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Mobile*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtMobile" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile" ErrorMessage="(Invalid)"  ValidationExpression="[0-9]{10}"  ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>  
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control form-control-sm" MaxLength="10"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Altlernate Mobile
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtAltMobile" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtAltMobile" ErrorMessage="(Invalid)"  ValidationExpression="[0-9]{10}"  ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>  
                        <asp:TextBox ID="txtAltMobile" runat="server" CssClass="form-control form-control-sm" MaxLength="10"></asp:TextBox>
                    </div>    
                    <div class="col-md-3 p-1">
                        Working District*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlPostingDistrict" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlPostingDistrict" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPostingDistrict_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Working Block*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlPostingBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlPostingBlock" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
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
            <asp:AsyncPostBackTrigger ControlID="ddlPostingDistrict" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger  ControlID="btnSave" EventName="Click" />
            <asp:AsyncPostBackTrigger  ControlID="btnReset" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

