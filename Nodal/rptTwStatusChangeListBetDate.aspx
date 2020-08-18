<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="rptTwStatusChangeListBetDate.aspx.cs" Inherits="Nodal_rptTwStatusChangeListBetDate" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/Style/printStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container font-weight-bold">
        Tube Well change in Functional/ Non Fumnctional List
        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-2 p-1">
                District
                <asp:DropDownList ID="ddlDist" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Status
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control form-control-sm" >
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1">
                From Date(YYYY-MM-DD)*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtStartDate" Text="(Required)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtStartDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="(19|20|21)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])" ErrorMessage="(Invalid date)" />
                <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtStartDate" runat="server" TargetControlID="txtStartDate" Format="yyyy-MM-dd"></cc1:CalendarExtender>
            </div>
            <div class="col-md-3 p-1">
                To Date(YYYY-MM-DD)*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEndDate" Text="(Required)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtEndDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="(19|20|21)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])" ErrorMessage="(Invalid date)" />
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                <cc1:CalendarExtender ID="Calendarextender1" PopupButtonID="txtEndDate" runat="server" TargetControlID="txtEndDate" Format="yyyy-MM-dd"></cc1:CalendarExtender>
            </div>

            <div class="col-md-2 p-1">
                <br />
                <asp:Button ID="btnView" runat="server" Text="View" class="btn btn-sm btn-primary" OnClick="btnView_Click" />
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
                <asp:Button ID="btnExportToExcel" runat="server" Text="Export" class="btn btn-sm btn-primary" OnClick="btnExportToExcel_Click" />
            </div>
            <div class="row font-weight-bold">
                <div class="col-md-12">
                    <asp:Label ID="lblHeading" runat="server" Text=""></asp:Label>
                    (Report Date-<%= (DateTime.Now.ToString("dd MMM yy")) %>)                    
                </div>
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="tableCust" EmptyDataText="No Records Found"
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
                        <asp:TemplateField HeaderText="DistName">
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
                        <asp:TemplateField HeaderText="Type" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Current Status" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Change in Status" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <%# Eval("TubewellStatus") %> <br />On date : <%# Eval("EntryDate", "{0:dd/MM/yyyy}")%>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

        </div>
    </div>
</asp:Content>

