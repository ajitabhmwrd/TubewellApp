<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="RptTwIrrigationDistWise.aspx.cs" Inherits="Nodal_RptTwIrrigationDistWise" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/Style/printStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />

    <div id="divPage" class="container">
        <div class="row">
            <div class="col-md-2 p-1">
                Financial Year
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Season Type
                <asp:DropDownList ID="ddlCropType" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlCropType_SelectedIndexChanged">
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
                <asp:Button ID="btnReset" runat="server" Text="Reset" class="btn btn-sm btn-primary" OnClick="btnReset_Click" />
            </div>
            <div class="col-md-2">
                <br />
                <input id="btnPrint" type="button" class="btn btn-sm btn-primary" value="Print" onclick="window.print();" />
                <asp:Button ID="btnExportToExcel" runat="server" Text="Export" class="btn btn-sm btn-primary" OnClick="btnExportToExcel_Click" />
            </div>
            <br />
            <div id="section-to-print" class="col-md-12 table-responsive">
                <div id="divHead" runat="server" visible="false" class="row font-weight-bold">
                    <div class="col-md-8">
                        Tubwell Irrigation Report 
                        <asp:Label ID="lblDetail" runat="server" Text=""></asp:Label>
                        (  
                    Report Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>)                    
                    </div>
                    <div class="col-md-4">
                        <div class="color-Box" style="background-color: #ff8080;"><=30 %</div>
                        <div class="color-Box" style="background-color: #ffb833;">>30 % & <60 %</div>
                        <div class="color-Box" style="background-color: #4dff4d;">>=60 %</div>
                    </div>
                </div>
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" GridLines="None"
                    EmptyDataText="No Records Found" ShowFooter="true" FooterStyle-Font-Bold="true" OnRowDataBound="gvTubewell_RowDataBound"
                    AllowSorting="true" OnSorting="gvTubewell_Sorting" CssClass="tableCust">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Dist Code" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblDistCode" runat="server" Text='<%# Bind("DistCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District" SortExpression="DistName">
                            <ItemTemplate>
                                <asp:Label ID="lbDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Circle" SortExpression="DivisionName">
                            <ItemTemplate>
                                <asp:Label ID="lblDivisionName" runat="server" Text='<%# Bind("DivisionName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zone Name" SortExpression="ZoneName">
                            <ItemTemplate>
                                <asp:Label ID="lblZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="Duration" ItemStyle-Wrap="false" SortExpression="Hour">
                            <ItemTemplate>
                                <asp:Label ID="lblHour" runat="server" Text='<%# Bind("Hour") %>'></asp:Label>
                                Hour
                                <asp:Label ID="lblMinute" runat="server" Text='<%# Bind("Minute") %>'></asp:Label>
                                Minute
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Irrigation Area" SortExpression="AreaDecimal">
                            <ItemTemplate>
                                <asp:Label ID="lblAreaDecimal" runat="server" Text='<%# Bind("AreaDecimal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Demand(In Rs)" SortExpression="RevenueDemandRs">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueDemandRs" runat="server" Text='<%# Bind("RevenueDemandRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Collection(In Rs)" SortExpression="RevenueCollectionRs">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueCollectionRs" runat="server" Text='<%# Bind("RevenueCollectionRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deposited In Bank(In Rs)" SortExpression="DepositedAmountInBank">
                            <ItemTemplate>
                                <asp:Label ID="lblDepositedAmountInBank" runat="server" Text='<%# Bind("DepositedAmountInBank") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

            </div>

        </div>
    </div>
    <br />
</asp:Content>

