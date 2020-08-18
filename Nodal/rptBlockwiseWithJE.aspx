<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="rptBlockwiseWithJE.aspx.cs" Inherits="Nodal_rptBlockwiseWithJE" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/Style/printStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-md-2 p-1">
                District
                        <asp:DropDownList ID="ddlDist" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDist_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                <br />
                <input id="btnPrint" type="button" class="btn btn-sm btn-primary" value="Print" onclick="window.print();" />
                <asp:Button ID="btnExportToExcel" runat="server" Text="Export" class="btn btn-sm btn-primary" OnClick="btnExportToExcel_Click" OnDataBound="OnDataBound" />
            </div>
            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>

            <div id="section-to-print" class="col-md-12 p-2">
                <div class="row font-weight-bold">
                    <div class="col-md-6">
                        JE Wise Tubwell Report (  
                    Report Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>)                    
                    </div>
                </div>
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="tableCust" GridLines="None"
                    EmptyDataText="No Records Found" ShowFooter="true" FooterStyle-Font-Bold="true" OnDataBound="gvTubewell_DataBound">
                    <Columns>
                        
                        <asp:TemplateField HeaderText="Code" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblDistCode" runat="server" Text='<%# Bind("DistCode") %>'></asp:Label>
                                <asp:Label ID="lblBlockCode" runat="server" Text='<%# Bind("BlockCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="District Name">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:Label ID="lbDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="JE Name">
                            <ItemTemplate>
                                <asp:Label ID="lbName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="JE Mobile">
                            <ItemTemplate>
                                <asp:Label ID="lbMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Block Name">
                            <ItemTemplate>
                                <asp:Label ID="lbBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Tubewell">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblTotalTubewell" runat="server" Text='<%# Bind("TotalTubewell") %>' OnClick="lbTotalTubewell_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Tubewell Having CA No">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblTotalCA" runat="server" Text='<%# Bind("TotalCA") %>' OnClick="lbTotalCA_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Tubewell Panchayat">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblTotalTubewellPanchayat" runat="server" Text='<%# Bind("TotalTubewellPanchayat") %>' OnClick="lbTotalTubewellPanchayat_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Functional">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblTotalTubewellFunctional" runat="server" Text='<%# Bind("TotalTubewellFunctional") %>' OnClick="lbTotalTubewellFunctional_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Non-Functional">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblNonFunctional" runat="server" Text='<%# Bind("TotalTubewellNonFunctional") %>' OnClick="lTubewellNonFunctional_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
            *This is software generated report.<br />
        </div>
    </div>

</asp:Content>





