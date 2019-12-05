<%@ Page Title="" Language="C#" MasterPageFile="~/JE/JEMaster.master" AutoEventWireup="true" CodeFile="AddInspection.aspx.cs" Inherits="JE_AddInspection" %>

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
                        <a class="btn btn-primary btn-sm" href="#">Back To Tubewell Inspection List</a>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                    
                </div>
                <div class="row">
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
                        Village*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server" ControlToValidate="ddlVillage" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlVillage_SelectedIndexChanged">
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
            <asp:AsyncPostBackTrigger  ControlID="btnSave" EventName="Click" />
            <asp:AsyncPostBackTrigger  ControlID="btnReset" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>



