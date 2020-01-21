<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Master.master" AutoEventWireup="true" CodeFile="gwlAverageDistrictWise.aspx.cs" Inherits="Admin_gwlAverageDistrictWise" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">GWL Averge District Wise</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 p-1">
                Select Date:
                <asp:TextBox ID="txtDate" runat="server" ></asp:TextBox>
                <cc1:CalendarExtender ID="txtDate_CalendarExtender" runat="server"
                    Enabled="True" TargetControlID="txtDate" Format="yyyy-MM-dd"></cc1:CalendarExtender>
                <asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click" />
                <br /><br />
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found" AutoGenerateColumns="false">
                    <Columns>
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblDistrict" runat="server" Text='<%# Bind("District") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblAverage" runat="server" Text='<%# Bind("Average") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

