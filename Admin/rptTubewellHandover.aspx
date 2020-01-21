<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Master.master" AutoEventWireup="true" CodeFile="rptTubewellHandover.aspx.cs" Inherits="Admin_rptTubewellHandover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">Tubewell Functional Report</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">

            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found">
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
                        <asp:TemplateField HeaderText="District Name">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zone Name">
                            <ItemTemplate>
                                <asp:Label ID="lblZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total No of Tubewell">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalTubewell" runat="server" Text='<%# Bind("TotalTubewell") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Having CA No">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalCA" runat="server" Text='<%# Bind("TotalCA") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Tubewell Panchayat">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalTubewellPanchayat" runat="server" Text='<%# Bind("TotalTubewellPanchayat") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Functional">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalTubewellFunctional" runat="server" Text='<%# Bind("TotalTubewellFunctional") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>


