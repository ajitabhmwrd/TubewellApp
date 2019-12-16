<%@ Page Title="" Language="C#" MasterPageFile="~/JE/JEMaster.master" AutoEventWireup="true" CodeFile="AddTubewellIrrigation.aspx.cs" Inherits="JE_AddTubewellIrrigation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Add new Tube Well Irrigation</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 p-1">
                        <a class="btn btn-primary btn-sm" href="TubewellIrrigation.aspx">Back To Tubewell Irrigation List</a>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 p-1">
                        Irrigation Date(dd/MM/yyyy)*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtIrrigationDate" Text="(Required)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtIrrigationDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="(Invalid date)" />
                        <asp:TextBox ID="txtIrrigationDate" runat="server" CssClass="form-control" autocomplete="off"></asp:TextBox>
                        <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtInspectionDate" runat="server" TargetControlID="txtIrrigationDate" Format="dd/MM/yyyy"></cc1:CalendarExtender>
                    </div>
                    <div class="col-md-9 p-1">
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
                    <div class="col-md-3 m-0 p-1">
                        <div style="width: 1000%;">
                            Irrigation Time Duration*
                        </div>
                        <div style="float: left; width: 50%; margin-top:-25px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlTubewell" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">Select Hour</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div style="float: left; width: 50%; margin-top:-25px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="ddlTubewell" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0">Select Minutes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 2 Comment
                        <%--<asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="txtComment2" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />--%>
                        <asp:TextBox ID="txtComment2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 3 Comment
                        <%--<asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="txtComment3" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />--%>
                        <asp:TextBox ID="txtComment3" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Image 4 Comment
                        <%--<asp:RequiredFieldValidator ErrorMessage="(Required)" ControlToValidate="txtComment4" runat="server" Display="Dynamic"   ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" />--%>
                        <asp:TextBox ID="txtComment4" runat="server" CssClass="form-control"></asp:TextBox>
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
            <asp:AsyncPostBackTrigger ControlID="ddlVillage" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlBlock" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlPanchayat" EventName="SelectedIndexChanged" />
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:AsyncPostBackTrigger ControlID="btnReset" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

