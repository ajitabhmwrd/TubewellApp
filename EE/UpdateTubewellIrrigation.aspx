<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="UpdateTubewellIrrigation.aspx.cs" Inherits="EE_UpdateTubewellIrrigation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Update Tube Well Irrigation</span>
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
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblID" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="false"></asp:Label>
                        Tubewell ID = <asp:Label ID="lblTubewellID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 p-1">
                        Irrigation Date(dd-MM-yyyy)*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtIrrigationDate" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtIrrigationDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\-(0[1-9]|1[0-2])\-((19|20)\d\d))$" ErrorMessage="(Invalid)" Font-Size="Small" />
                        <asp:TextBox ID="txtIrrigationDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                        <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtInspectionDate" runat="server" TargetControlID="txtIrrigationDate" Format="dd-MM-yyyy"></cc1:CalendarExtender>
                    </div>
                    
                    <div class="col-md-3 m-0 p-1">
                        <div style="width: 100%;">
                            Irrigation Time Duration*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="Select" runat="server" Display="Dynamic" ControlToValidate="ddlHour" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="Select" runat="server" Display="Dynamic" ControlToValidate="ddlMinutes" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                        </div>
                        <div style="float: left; width: 50%;">
                            <asp:DropDownList ID="ddlHour" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem Value="Select">Select Hour</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div style="float: left; width: 50%;">
                            <asp:DropDownList ID="ddlMinutes" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem Value="Select">Select Minutes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Irrigation Area(In Decimal)*
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtIrrigationAreaInDecimal" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtIrrigationAreaInDecimal" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtIrrigationAreaInDecimal" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Revenue Demand(In Rs.)*
                    <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtRevenueDemand" ValidationGroup="TubewellEntry" Display="Dynamic"
                        ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtRevenueDemand" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:TextBox ID="txtRevenueDemand" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Revenue Collection (In Rs.)*
                    <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtRevenueCollection" ValidationGroup="TubewellEntry" Display="Dynamic"
                        ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtRevenueCollection" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:TextBox ID="txtRevenueCollection" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Deposited into Bank (In Rs.)*
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtBankDeposited" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtBankDeposited" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:TextBox ID="txtBankDeposited" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-6 p-1 "></div>
                    <div class="col-md-3 p-1 ">
                        Comment                        
                        <asp:TextBox ID="txtComment" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" ValidationGroup="TubewellEntry" />
                        <a class="btn btn-primary btn-sm" href="TubewellIrrigation.aspx">Cancel</a>
                    </div>
                </div>
            </div>

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

