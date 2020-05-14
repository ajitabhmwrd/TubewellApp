<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="rptTwDistwisePlanHead.aspx.cs" Inherits="Nodal_rptTwDistwisePlanHead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                <br />
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-8 p-1">
            </div>
            <div id="divGrid" runat="server" class="col-md-12 p-2 table-responsive">
                <div class="font-weight-bold small text-center">
                    Tube Well District wise Plan Head Report (
                    Financial Year :
                    <asp:Label ID="lblFinYr" runat="server" Text=""></asp:Label>, 
                    Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>
                    )
                </div>
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" HeaderStyle-ForeColor="White" EmptyDataText="No Records Found" AllowSorting="true" OnSorting="gvTubewell_Sorting"
                    ShowFooter="true" FooterStyle-Font-Bold="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District  &#8661;" SortExpression="DistName">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zone &#8661;" SortExpression="ZoneName">
                            <ItemTemplate>
                                <asp:Label ID="lblZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Required Repair  &#8661;"  SortExpression="TwReqRepair">
                            <ItemTemplate>
                                <asp:Label ID="lblTwReqRepair" runat="server" Text='<%# Bind("TwReqRepair") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Got Fund  &#8661;"  SortExpression="TwGotFund">
                            <ItemTemplate>
                                <asp:Label ID="lblTwGotFund" runat="server" Text='<%# Bind("TwGotFund") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Panchayat Got Fund  &#8661;"  SortExpression="PanchayatGotFund">
                            <ItemTemplate>
                                <asp:Label ID="lblPanchayatGotFund" runat="server" Text='<%# Bind("PanchayatGotFund") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimated Cost  &#8661;"  SortExpression="TESCost">
                            <ItemTemplate>
                                <asp:Label ID="lblTESCost" runat="server" Text='<%# Bind("TESCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Administrative Approval Amount  &#8661;"  SortExpression="TAA">
                            <ItemTemplate>
                                <asp:Label ID="lblTAA" runat="server" Text='<%# Bind("TAA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Allotment  &#8661;"  SortExpression="TAllotment">
                            <ItemTemplate>
                                <asp:Label ID="lblTAllotment" runat="server" Text='<%# Bind("TAllotment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Expenditure  &#8661;"  SortExpression="TExpenditure">
                            <ItemTemplate>
                                <asp:Label ID="lblTExpenditure" runat="server" Text='<%# Bind("TExpenditure") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Repair Started  &#8661;"  SortExpression="TRepairStarted">
                            <ItemTemplate>
                                <asp:Label ID="lblTRepairStarted" runat="server" Text='<%# Bind("TRepairStarted") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Repair Completed  &#8661;"  SortExpression="TRepairCompleted">
                            <ItemTemplate>
                                <asp:Label ID="lblTRepairCompleted" runat="server" Text='<%# Bind("TRepairCompleted") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>





