<%@ Page Title="" Language="C#" MasterPageFile="~/secretary/Nodal.master" AutoEventWireup="true" CodeFile="rptTubewellHandover.aspx.cs" Inherits="Admin_rptTubewellHandover" %>

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
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found" ShowFooter="true" FooterStyle-Font-Bold="true">
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
                                <asp:LinkButton ID="lbDistName" runat="server" Text='<%# Bind("DistName") %>' OnClick="lbDistName_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Zone Name">
                            <ItemTemplate>
                                <asp:Label ID="lblZoneName" runat="server" Text='<%# Bind("ZoneName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Tubewell">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbTotalTubewell" runat="server" Text='<%# Bind("TotalTubewell") %>' OnClick="lbTotalTubewell_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Having CA No">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbTotalCA" runat="server" Text='<%# Bind("TotalCA") %>' OnClick="lbTotalCA_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Tubewell Panchayat">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbTotalTubewellPanchayat" runat="server" Text='<%# Bind("TotalTubewellPanchayat") %>' OnClick="lbTotalTubewellPanchayat_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Functional">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbTotalTubewellFunctional" runat="server" Text='<%# Bind("TotalTubewellFunctional") %>' OnClick="lbTotalTubewellFunctional_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Non-Functional">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbNonFunctional" runat="server" Text='<%# Bind("TotalTubewellNonFunctional") %>' OnClick="lbNonFunctional_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>


