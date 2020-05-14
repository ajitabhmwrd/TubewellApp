<%@ Page Title="" Language="C#" MasterPageFile="~/secretary/Nodal.master" AutoEventWireup="true" CodeFile="LoginLog.aspx.cs" Inherits="Nodal_LoginLog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />

    <div class="container">
        <span class="font-weight-bold small">Login Log</span>
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

                        <asp:TemplateField HeaderText="LoginId">
                            <ItemTemplate>
                                <asp:Label ID="lblLoginId" runat="server" Text='<%# Bind("LoginId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Role">
                            <ItemTemplate>
                                <asp:Label ID="lblLoginRole" runat="server" Text='<%# Bind("LoginRole") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Login IP">
                            <ItemTemplate>
                                <asp:Label ID="lblLoginIP" runat="server" Text='<%# Bind("LoginIP") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Login Date (MM/DD/YYYY)">
                            <ItemTemplate>
                                <asp:Label ID="lblLoginDate" runat="server" Text='<%# Bind("LoginDate") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>

</asp:Content>





