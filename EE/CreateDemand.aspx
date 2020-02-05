<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="CreateDemand.aspx.cs" Inherits="EE_CreateDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Create Tube Well Demand</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-3 p-1">
                <a class="btn btn-primary btn-sm" href="TubewellDemadList.aspx">Back</a>
            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-3 p-1">
                Financial Year*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlFinYear" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1">
                Allotment Head*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlHead" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlHead" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>
</asp:Content>

