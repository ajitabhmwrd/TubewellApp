<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="rptCriticalZoneTubewellDistwiseReport.aspx.cs" Inherits="Nodal_rptCriticalZoneTubewellReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/Style/printStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />

    <div id="divPage" style="padding-left: 25px; padding-right: 25px">
        <div class="row">
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
            <div class="col-md-4">
            </div>
            <div class="col-md-2">
                <br />
                <input id="btnPrint" type="button" class="btn btn-sm btn-primary" value="Print" onclick="window.print();" />
                <asp:Button ID="btnExportToExcel" runat="server" Text="Export" class="btn btn-sm btn-primary" OnClick="btnExportToExcel_Click" />
            </div>
            <div id="section-to-print">
                <div >
                    <div class="row font-weight-bold">
                        <div class="col-md-6">
                            District-wise Tubwell Criticality Report (  
                    Report Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>)                    
                        </div>
                        <div class="col-md-6 text-right">
                            Critical (C), Semi-Critical (S), Over-Exploited (O)
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

                            <asp:TemplateField HeaderText="Total Tubewell" SortExpression="TotalTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lbTotalTubewell" runat="server" Text='<%# Bind("TotalTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Block Involved (C+S+O)" SortExpression="blockInvolved">
                                <ItemTemplate>
                                    <asp:Label ID="lblblockInvolved" runat="server" Text='<%# Bind("blockInvolved") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total (C+S+O)" HeaderStyle-Width="20px" SortExpression="TotalCritSemiOverTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalCritSemiOverTubewell" runat="server" Text='<%# Bind("TotalCritSemiOverTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Functional (C+S+O)" HeaderStyle-Width="20px" SortExpression="TotalCritSemiOverFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lbTotalCritSemiOverFunTubewell" runat="server" Text='<%# Bind("TotalCritSemiOverFunTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Non-Functional (C+S+O)" HeaderStyle-Width="20px" SortExpression="TotalCritSemiOverNonFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalCritSemiOverNonFunTubewell" runat="server" Text='<%# Bind("TotalCritSemiOverNonFunTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Critical (C)" SortExpression="TotalCriticalTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalCriticalTubewell" runat="server" Text='<%# Bind("TotalCriticalTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Semi-Critical (S)" SortExpression="TotalSemiCriticalTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalSemiCriticalTubewell" runat="server" Text='<%# Bind("TotalSemiCriticalTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Over-Exploited (0)" SortExpression="TotalOverExploitedTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalOverExploitedTubewell" runat="server" Text='<%# Bind("TotalOverExploitedTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Functional (C)" SortExpression="TotalCriticalFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalCriticalFunTubewell" runat="server" Text='<%# Bind("TotalCriticalFunTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Functional (S)" SortExpression="TotalSemiCriticalFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalSemiCriticalFunTubewell" runat="server" Text='<%# Bind("TotalSemiCriticalFunTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Functional (O)" SortExpression="TotalOverExploitedFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalOverExploitedFunTubewell" runat="server" Text='<%# Bind("TotalOverExploitedFunTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Non-Functional (C)" SortExpression="TotalCriticalNonFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalCriticalNonFunTubewell" runat="server" Text='<%# Bind("TotalCriticalNonFunTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Non-Functional (S)" SortExpression="TotalSemiCriticalNonFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalSemiCriticalNonFunTubewell" runat="server" Text='<%# Bind("TotalSemiCriticalNonFunTubewell") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Non-Functional (O)" SortExpression="TotalOverExploitedNonFunTubewell">
                                <ItemTemplate>
                                    <asp:Label ID="lblTotalOverExploitedNonFunTubewell" runat="server" Text='<%# Bind("TotalOverExploitedNonFunTubewell") %>'></asp:Label>
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
    <br />
    <%--<script src="../myContent/JS/html2canvas.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#btnPrint").click(function () {
                html2canvas(document.querySelector("#divGrid")).then(canvas => {
                    document.getElementById("divPage").setAttribute("hidden", ""); 
                    document.body.appendChild(canvas);
                    window.print();
                    $('canvas').remove();
                    document.getElementById("divPage").removeAttribute("hidden"); 

                });
            });
        });
    </script>--%>
</asp:Content>




