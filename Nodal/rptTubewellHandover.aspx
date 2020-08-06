<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="rptTubewellHandover.aspx.cs" Inherits="Admin_rptTubewellHandover"
    EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/Style/printStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />

    <div id="divPage" class="container">
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
                <input id="btnPrint" type="button" class="btn btn-sm btn-primary" value="Print" onclick="window.print();"  />
                <asp:Button ID="btnExportToExcel" runat="server" Text="Export" class="btn btn-sm btn-primary" OnClick="btnExportToExcel_Click" />
            </div>

            <div id="section-to-print" class="col-md-12 table-responsive">
                <div class="row font-weight-bold">
                    <div class="col-md-6">
                        Tubwell Functional Report (  
                    Report Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>)                    
                    </div>
                    <div class="col-md-6">
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
                                <asp:LinkButton ID="lbDistName" runat="server" Text='<%# Bind("DistName") %>' OnClick="lbDistName_Click"></asp:LinkButton>
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
                                <asp:LinkButton ID="lbTotalTubewell" runat="server" Text='<%# Bind("TotalTubewell") %>' OnClick="lbTotalTubewell_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Having<br/> CA No" SortExpression="TotalCA">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbTotalCA" runat="server" Text='<%# Bind("TotalCA") %>' OnClick="lbTotalCA_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Tubewell<br/> Panchayat" SortExpression="TotalTubewellPanchayat">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbTotalTubewellPanchayat" runat="server" Text='<%# Bind("TotalTubewellPanchayat") %>' OnClick="lbTotalTubewellPanchayat_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Functional" SortExpression="TotalTubewellFunctional">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbTotalTubewellFunctional" runat="server" Text='<%# Bind("TotalTubewellFunctional") %>' OnClick="lbTotalTubewellFunctional_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Functional(%)" SortExpression="FunPercent">
                            <ItemTemplate>
                                <asp:Label ID="lbFunPercent" runat="server" Text='<%# Bind("FunPercent") %>'></asp:Label>
                                %
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Non-Functional" SortExpression="TotalTubewellNonFunctional">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbNonFunctional" runat="server" Text='<%# Bind("TotalTubewellNonFunctional") %>' OnClick="lbNonFunctional_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>

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


