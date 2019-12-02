<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="AssignBlockAEJE.aspx.cs" Inherits="EE_AssignBlockAEJE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Assign Block AE / JE</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 p-1">
                        <%--<a class="btn btn-primary btn-sm" href="BlockEmpList.aspx">Back To AE/JE List</a>--%>
                    </div>
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
                                    <asp:Label ID="lblBlockCode" runat="server" Text='<%# Bind("BlockCode") %>' Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Block Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Assigned AE">
                                <ItemTemplate>
                                    <asp:Label ID="lblAEName" runat="server" Text='<%# Bind("AEName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlAE" runat="server"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Assigned JE">
                                <ItemTemplate>
                                    <asp:Label ID="lblJEName" runat="server" Text='<%# Bind("JEName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlJE" runat="server"></asp:DropDownList>
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
        </ContentTemplate>
        <Triggers>
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

