<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="AssignBlockAEJE.aspx.cs" Inherits="EE_AssignBlockAEJE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">Add new AE/JE</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 p-1">
                <a class="btn btn-primary btn-sm" href="BlockEmpList.aspx">Back To AE/JE List</a>
            </div>
            <asp:GridView ID="gvBlock" runat="server" AutoGenerateColumns="False" CssClass="table-hover table-bordered table-sm" GridLines="None"
                HeaderStyle-CssClass="bg-primary text-white" EmptyDataText="No Records Found">
                <Columns>
                    <asp:TemplateField HeaderText="SNo">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="lblBlockCode" runat="server" Text='<%# Bind("BlockCode") %>' Visible="false"></asp:Label>
                            <asp:CheckBox ID="cbBlock" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <asp:Label ID="lblBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

</asp:Content>

