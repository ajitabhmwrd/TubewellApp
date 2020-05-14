<%@ Page Title="" Language="C#" MasterPageFile="~/secretary/Nodal.master" AutoEventWireup="true" CodeFile="ApproveTubewell.aspx.cs" Inherits="Nodal_ApproveTubewell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="Update" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">New Tube Well Request</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-3 p-1">
                        <%--<a class="btn btn-primary btn-sm" href="AddTubewell.aspx">Add new Tube Well</a>--%>
                    </div>
                    <div class="col-md-6 p-1"></div>
                    <div class="col-md-3 p-1">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm" placeholder="Search.." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                    </div>
                    <div class="col-md-12 p-2 table-responsive">
                        <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                            HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                            OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="50" AllowPaging="true">
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CA Number">
                                    <ItemTemplate>
                                        <asp:Label ID="lblConsumerID" runat="server" Text='<%# Bind("ConsumerID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Block">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBlockName" runat="server" Text='<%# Bind("BlockName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Panchayat">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPanchayatName" runat="server" Text='<%# Bind("PanchayatName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Village">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVILLNAME" runat="server" Text='<%# Bind("VILLNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Type"  ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status"  ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" ItemStyle-Wrap="false">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>                                                
                                                <asp:Button ID="btnView" runat="server" Text="View" class="btn-primary" OnClick="btnView_Click"/>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="btnView" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>

                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="txtSearch" EventName="TextChanged" />
        </Triggers>
    </asp:UpdatePanel>   
</asp:Content>

