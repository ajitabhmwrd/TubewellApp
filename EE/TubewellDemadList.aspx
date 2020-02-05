<%@ Page Title="Demand" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TubewellDemadList.aspx.cs" Inherits="EE_TubewellDemadList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Tube Well Demand</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 p-1">
                <a class="btn btn-primary btn-sm" href="CreateDemand.aspx">Create Demand</a>
            </div>
            <div class="col-md-6 p-1"></div>
            <div class="col-md-3 p-1">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm" placeholder="Search.." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>

