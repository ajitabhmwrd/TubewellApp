<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="CreateAllotment.aspx.cs" Inherits="EE_CreateAllotment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Add Tube Well Allotment</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 p-1">
                <a class="btn btn-primary btn-sm" href="TubewellAllotment.aspx">Back</a>
            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-2 p-1">
                Financial Year*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlFinYear" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Head Type*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlHead" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlHead" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Fund Type*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="0" runat="server" ControlToValidate="ddlFundType" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlFundType" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Letter No*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLetterNo" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtLetterNo" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
            </div>
            <div class="col-md-2 p-1">
                Letter Date*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLetterDate" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtLetterDate" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
            </div>
        </div>

        <div class="row">

        </div>
    </div>
</asp:Content>

