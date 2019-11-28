<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="BlockEmpList.aspx.cs" Inherits="EE_BlockEmpList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="Update" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">AE/JE List</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-3 p-1">
                        <a class="btn btn-primary btn-sm" href="AddBlockEmployee.aspx">Add new AE/JE</a>
                    </div>
                    <div class="col-md-6 p-1"></div>
                    <div class="col-md-3 p-1">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" placeholder="Search.." OnTextChanged="txtSearch_TextChanged" AutoPostBack="true"></asp:TextBox>
                    </div>
                    <div class="col-md-12 p-2 table-responsive">
                        <asp:GridView ID="gvBlockEmployee" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                            HeaderStyle-CssClass="bg-primary text-white" EmptyDataText="No Records Found"
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
                                
                                
                                <asp:TemplateField HeaderText="Working District">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPostingDist" runat="server" Text='<%# Bind("PostingDist") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Working Block">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPostingBlock" runat="server" Text='<%# Bind("PostingBlock") %>'></asp:Label>
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
                                <asp:TemplateField HeaderText="Status" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="">
                                    <ItemTemplate>
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                            <ContentTemplate>                                                
                                        <asp:Button ID="btnEdit" runat="server" Text="EDIT" class="btn btn-primary btn-sm" OnClick="btnEdit_Click" />
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
    <script>
        $(document).ready(function () {
            $('.table-responsive').doubleScroll();
        });
    </script>
</asp:Content>

