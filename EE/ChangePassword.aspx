<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="EE_ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">Change Password</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Old Password*<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtOldPassword" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtOldPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password"></asp:TextBox>

            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-3 p-1">
                New Password*<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtNewPassword" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-3 p-1">
                Re-enter New Password*
                <asp:TextBox ID="txtReEnterPassword" runat="server" CssClass="form-control form-control-sm" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-3 p-1">
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Change" CssClass="btn btn-primary" OnClick="btnSubmit_Click" ValidationGroup="TubewellEntry" />
            </div>
        </div>
    </div>
</asp:Content>

