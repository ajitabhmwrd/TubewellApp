<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="RptTubewellIrrigationTubewellwise.aspx.cs" Inherits="Nodal_RptTubewellIrrigationTubewellwise" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <%--<div class="container">
        <span class="font-weight-bold small">Tube Well wise Irrigation Report</span>
        <hr />
    </div>--%>

    <div class="container">
        <div class="row">
            <div class="col-md-2 p-1">
                District               
                <asp:DropDownList ID="ddlDist" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDist_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Block              
                    <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Panchyat
                    <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Tubewell
                    <asp:DropDownList ID="ddlTubewell" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlTubewell_SelectedIndexChanged">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                    </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Financial Year
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Crop Type
                <asp:DropDownList ID="ddlCropType" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <div class="font-weight-bold small text-center">
                    Tube Well wise Irrigation Report (
                    Financial Year : <asp:Label ID="lblFinYr" runat="server" Text=""></asp:Label>, 
                    Crop Type : <asp:Label ID="lblCropType" runat="server" Text=""></asp:Label>, 
                    Date : <%= (DateTime.Now.ToString("dd MMM yyyy")) %>
                    )
                </div>
                <asp:GridView ID="gvIrrigation" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found" ShowFooter="true" FooterStyle-Font-Bold="true" AllowPaging="true" OnPageIndexChanging="gvIrrigation_PageIndexChanging" PageSize="1000">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Name">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Duration" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblHour" runat="server" Text='<%# Bind("Hour") %>'></asp:Label>
                                Hour
                                <asp:Label ID="lblMinute" runat="server" Text='<%# Bind("Minute") %>'></asp:Label>
                                Minute
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Irrigation Area">
                            <ItemTemplate>
                                <asp:Label ID="lblAreaDecimal" runat="server" Text='<%# Bind("AreaDecimal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Demand(In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueDemandRs" runat="server" Text='<%# Bind("RevenueDemandRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Collection(In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueCollectionRs" runat="server" Text='<%# Bind("RevenueCollectionRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deposited In Bank(In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblDepositedAmountInBank" runat="server" Text='<%# Bind("DepositedAmountInBank") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        </div>

        </div>
    </div>
</asp:Content>

