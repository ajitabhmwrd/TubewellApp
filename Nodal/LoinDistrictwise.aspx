<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="LoinDistrictwise.aspx.cs" Inherits="Nodal_LoinDistrictwise" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />

    <div class="container">
        <span class="font-weight-bold small">Login District-wise Report</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">
             <div class="col-md-3 p-1">
                Start Date(YYYY-MM-DD)*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtStartDate" Text="(Required)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                   <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtStartDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="(19|20|21)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])" ErrorMessage="(Invalid date)" />
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                <cc1:calendarextender id="Calendar1" popupbuttonid="txtStartDate" runat="server" targetcontrolid="txtStartDate" format="yyyy-MM-dd"></cc1:calendarextender>
            </div>
            <div class="col-md-3 p-1">
                End Date(YYYY-MM-DD)*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEndDate" Text="(Required)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtEndDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="(19|20|21)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])" ErrorMessage="(Invalid date)" />
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                <cc1:calendarextender id="Calendarextender1" popupbuttonid="txtEndDate" runat="server" targetcontrolid="txtEndDate" format="yyyy-MM-dd"></cc1:calendarextender>
            </div>
            <div class="col-md-3 p-1">
                <br />
                <asp:Button ID="btnSearch" runat="server" Text="View" CssClass="btn btn-primary btn-sm"  ValidationGroup="TubewellEntry" OnClick="btnSearch_Click" />
            <//div>
            <div class="col-md-3 p-1"></div>
        </div>
        <div class="col-md-3 p-1"></div>
        <div class="row">           
            <div class="col-md-12 table-responsive">
                <div class="font-weight-bold small text-center">
                    District wise Login Report (
                    <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
                    )
                </div>
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="EE Login Count">
                            <ItemTemplate>
                                <asp:Label ID="lblEELogin" runat="server" Text='<%# Bind("EELogin") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AE Login  Count">
                            <ItemTemplate>
                                <asp:Label ID="lblAELogin" runat="server" Text='<%# Bind("AELogin") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="JE Login  Count">
                            <ItemTemplate>
                                <asp:Label ID="lblJELogin" runat="server" Text='<%# Bind("JELogin") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>                        
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>

</asp:Content>






