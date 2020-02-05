<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="OtherEmloyee.aspx.cs" Inherits="EE_OtherEmloyee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="Update" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Mukhiya/ Panchayat Sachiv List</span>
                <hr />
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-3 p-1">
                        <a class="btn btn-primary btn-sm" href="AddOtherEmployee.aspx">Add new</a>
                    </div>
                    <div class="col-md-6 p-1"></div>
                    <div class="col-md-3 p-1">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control form-control-sm" placeholder="Search.." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                    </div>
                    <div class="col-md-12 p-2 table-responsive">
                        <asp:GridView ID="gvBlockEmployee" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                            HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                            OnPageIndexChanging="gvEmployee_PageIndexChanging" PageSize="5" AllowPaging="false">
                            
                            <Columns>
                                <asp:TemplateField HeaderText="SNo">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate>
                                        <asp:Label ID="lblID" runat="server" Text='<%# Bind("EmpID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Designation">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDesignation" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                
                                <asp:TemplateField HeaderText="District">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDist" runat="server" Text='<%# Bind("Dist") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Block">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBlock" runat="server" Text='<%# Bind("Block") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Panchayat">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPanchayat" runat="server" Text='<%# Bind("Panchayat") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Mobile">
                                    <ItemTemplate>
                                        <asp:Label ID="lblMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="AltMob">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAltMob" runat="server" Text='<%# Bind("AltMob") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>                                                
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" class="btn btn-primary btn-sm" OnClick="btnEdit_Click" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="btnEdit" />
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



