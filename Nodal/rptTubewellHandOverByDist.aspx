<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="rptTubewellHandOverByDist.aspx.cs" Inherits="Admin_rptTubewellHandOverByDist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">Tubewell Functional Report Block-wise</span>

        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 p-1">
                <a class="btn btn-primary btn-sm" href="rptTubewellHandover.aspx">Back</a>
            </div>
            <div class="col-md-12 p-1">
                <asp:Label ID="lblDistCode" runat="server" Text="" Visible="false"></asp:Label>
                District : <asp:Label ID="lblDist" runat="server" ForeColor="Blue" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>
            
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found" ShowFooter="true" FooterStyle-Font-Bold="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Block Code" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblBlockCode" runat="server" Text='<%# Bind("BlockCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Block Name">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbBlockName" runat="server" Text='<%# Bind("BlockName") %>' OnClick="lbBlockName_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Total Tubewell">
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
                        <asp:TemplateField HeaderText="Functional">
                            <ItemTemplate>
                                <asp:Label ID="lblTotalTubewellFunctional" runat="server" Text='<%# Bind("TotalTubewellFunctional") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Non-Functional">
                            <ItemTemplate>
                                <asp:Label ID="lblNonFunctional" runat="server" Text='<%# Bind("TotalTubewellNonFunctional") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>




