<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TubewellHandOverByDist.aspx.cs" Inherits="EE_TubewellHandOverByDist" %>

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
                                <asp:LinkButton ID="lblTotalTubewell" runat="server" Text='<%# Bind("TotalTubewell") %>' OnClick="lbTotalTubewell_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tubewell Having CA No">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblTotalCA" runat="server" Text='<%# Bind("TotalCA") %>'  OnClick="lbTotalCA_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Tubewell Panchayat">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblTotalTubewellPanchayat" runat="server" Text='<%# Bind("TotalTubewellPanchayat") %>' OnClick="lbTotalTubewellPanchayat_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Functional">
                            <ItemTemplate>
                                <asp:LinkButton ID="lblTotalTubewellFunctional" runat="server" Text='<%# Bind("TotalTubewellFunctional") %>' OnClick="lbTotalTubewellFunctional_Click" ></asp:LinkButton>
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

        </div>
    </div>
</asp:Content>




