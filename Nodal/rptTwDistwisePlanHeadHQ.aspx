<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="rptTwDistwisePlanHeadHQ.aspx.cs" Inherits="Nodal_rptTwDistwisePlanHeadHQ" EnableEventValidation="false" %>

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
                <div id="divGrid" runat="server" class="col-md-12 p-2 table-responsive">
                    <div class="font-weight-bold text-center">
                        Tube Well District wise Plan Head Report HQ(
                    Financial Year :
                    <asp:Label ID="lblFinYr" runat="server" Text=""></asp:Label>, 
                    Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>
                    )
                    </div>
                    <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" GridLines="None" EmptyDataText="No Records Found" AllowSorting="true" OnSorting="gvTubewell_Sorting"
                        ShowFooter="true" FooterStyle-Font-Bold="true" CssClass="tableCust">
                        <Columns>
                            <asp:TemplateField HeaderText="SNo">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="District  " SortExpression="DistName">
                                <ItemTemplate>
                                    <asp:Label ID="lblDistCode" runat="server" Text='<%# Bind("DistCode") %>' Visible="false"></asp:Label>
                                    <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Circle" SortExpression="DivisionName">
                                <ItemTemplate>
                                    <asp:Label ID="lblDivisionName" runat="server" Text='<%# Bind("DivisionName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Zone " SortExpression="ZoneName">
                                <ItemTemplate>
                                    <asp:Label ID="lblZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Tubewell Got Fund  " SortExpression="TubewellCount">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lblTubewellCount" runat="server" Text='<%# Bind("TubewellCount") %>' OnClick="lblTubewellCount_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Estimated Cost" SortExpression="EstimatedCost">
                                <ItemTemplate>
                                    <asp:Label ID="lblEstimatedCost" runat="server" Text='<%# Bind("EstimatedCost") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>                           
                            <asp:TemplateField HeaderText="Allotment  " SortExpression="TAllotmentAmount">
                                <ItemTemplate>
                                    <asp:Label ID="lblTAllotmentAmount" runat="server" Text='<%# Bind("TAllotmentAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>
                    <br />
                    *This is software generated Report.
                </div>

            </div>
        </div>
    </div>
</asp:Content>
