<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="AssignMukhiaPanchayatSachiv.aspx.cs" Inherits="EE_AssignMukhiaPanchayatSachiv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Assign Mukhiya/ Panchayat Sachiv</span>
                <hr />
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-12 p-1">
                        <asp:GridView ID="gvBlock" runat="server" AutoGenerateColumns="False" CssClass="table-hover table-bordered table-sm" GridLines="None"
                            HeaderStyle-CssClass="customBgColor" EmptyDataText="No Records Found"
                            OnRowEditing="gvBlock_RowEditing" OnRowUpdating="gvBlock_RowUpdating" OnRowCancelingEdit="gvBlock_RowCancelingEdit" OnRowDataBound="gvBlock_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPanchayatCode" runat="server" Text='<%# Bind("PanchayatCode") %>' Visible="false"></asp:Label>
                                        <asp:Label ID="lblBlockCode" runat="server" Text='<%# Bind("BlockCode") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Block Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Panchayat Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPanchayatName" runat="server" Text='<%# Bind("PanchayatName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assigned Mukhiya">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMukhiya" runat="server" Text='<%# Bind("MukhiyaName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlMukhiya" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Assigned Panchayat Sachiv">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPanchayatSachiv" runat="server" Text='<%# Bind("PanchayatSachivName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="ddlPanchayatSachiv" runat="server"></asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Assign" CommandName="Edit" class="btn btn-primary btn-sm" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" class="btn btn-primary btn-sm" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" class="btn btn-primary btn-sm" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
