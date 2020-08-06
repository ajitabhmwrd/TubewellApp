<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="rptTwDistwiseNonPlanHead.aspx.cs" Inherits="Nodal_rptTwDistwiseNonPlanHead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/Style/printStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">

            <div class="col-md-2 p-1">
                Financial Year
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Zone
                <asp:DropDownList ID="ddlZone" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlZone_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Circle 
                <asp:DropDownList ID="ddlDivision" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDivision_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                <br />
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-2 p-1">
            </div>
            <div class="col-md-2">
                <br />
                <input id="btnPrint" type="button" class="btn btn-sm btn-primary" value="Print" onclick="window.print();" />
                <asp:Button ID="btnExportToExcel" runat="server" Text="Export" class="btn btn-sm btn-primary" OnClick="btnExportToExcel_Click" />
            </div>
            <div id="section-to-print">
                <div id="divGrid" runat="server" class="col-md-12 table-responsive">
                    <div class="font-weight-bold text-center">
                        Tube Well District wise Non-Plan Head Report (
                    Financial Year :
                    <asp:Label ID="lblFinYr" runat="server" Text=""></asp:Label>, 
                    Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>
                    )
                    </div>
                    <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="tableCust" GridLines="None"
                        EmptyDataText="No Records Found" AllowSorting="true" OnSorting="gvTubewell_Sorting"
                        ShowFooter="true" FooterStyle-Font-Bold="true">
                        <Columns>
                            <asp:TemplateField HeaderText="SNo">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="District " SortExpression="DistName">
                                <ItemTemplate>
                                    <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Circle" SortExpression="DivisionName">
                                <ItemTemplate>
                                    <asp:Label ID="lblDivisionName" runat="server" Text='<%# Bind("DivisionName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Zone" SortExpression="ZoneName">
                                <ItemTemplate>
                                    <asp:Label ID="lblZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Tubewell Required Repair " SortExpression="TwReqRepair">
                                <ItemTemplate>
                                    <asp:Label ID="lblTwReqRepair" runat="server" Text='<%# Bind("TwReqRepair") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Tubewell Got Fund " SortExpression="TwGotFund">
                                <ItemTemplate>
                                    <asp:Label ID="lblTwGotFund" runat="server" Text='<%# Bind("TwGotFund") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Panchayat Got Fund " SortExpression="PanchayatGotFund">
                                <ItemTemplate>
                                    <asp:Label ID="lblPanchayatGotFund" runat="server" Text='<%# Bind("PanchayatGotFund") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:TemplateField HeaderText="Estimated Cost " SortExpression="TESCost">
                                <ItemTemplate>
                                    <asp:Label ID="lblTESCost" runat="server" Text='<%# Bind("TESCost") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="Administrative Approval Amount " SortExpression="TAA">
                                <ItemTemplate>
                                    <asp:Label ID="lblTAA" runat="server" Text='<%# Bind("TAA") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <asp:TemplateField HeaderText="Allotment " SortExpression="TAllotment">
                                <ItemTemplate>
                                    <asp:Label ID="lblTAllotment" runat="server" Text='<%# Bind("TAllotment") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expenditure " SortExpression="TExpenditure">
                                <ItemTemplate>
                                    <asp:Label ID="lblTExpenditure" runat="server" Text='<%# Bind("TExpenditure") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tubewell Repair Started " SortExpression="TRepairStarted">
                                <ItemTemplate>
                                    <asp:Label ID="lblTRepairStarted" runat="server" Text='<%# Bind("TRepairStarted") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tubewell Repair Completed " SortExpression="TRepairCompleted">
                                <ItemTemplate>
                                    <asp:Label ID="lblTRepairCompleted" runat="server" Text='<%# Bind("TRepairCompleted") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                    <br />
                    *This is software generated report.
                </div>

            </div>
        </div>
    </div>
</asp:Content>

