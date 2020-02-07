<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TubewellAllotment.aspx.cs" Inherits="EE_TubewellAllotment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Tube Well Allotment</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 p-1">
                <a class="btn btn-primary btn-sm" href="CreateAllotment.aspx">Add Tube Well Allotment</a>
            </div>
            <div class="col-md-6 p-1"></div>
            <div class="col-md-3 p-1">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm" placeholder="Search.." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
            </div>
        </div>
    </div>
</asp:Content>

