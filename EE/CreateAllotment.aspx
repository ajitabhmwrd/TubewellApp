<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="CreateAllotment.aspx.cs" Inherits="EE_CreateAllotment" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Add Tube Well Allotment</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-2 p-1">
                <a class="btn btn-primary btn-sm" href="TubewellAllotment.aspx">Back</a>
            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-2 p-1">
                Financial Year*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlFinYear" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Head Type*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlHead" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlHead" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Fund Type*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" InitialValue="0" runat="server" ControlToValidate="ddlFundType" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlFundType" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Letter No*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLetterNo" Text="(Enter)" ErrorMessage="Enter Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:TextBox ID="txtLetterNo" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
            </div>
            <div class="col-md-3 p-1">
                Lt. Dt(dd/MM/yyyy)*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtLetterDate" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtLetterDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" ErrorMessage="(Invalid)" Font-Size="Small" />
                <asp:TextBox ID="txtLetterDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtInspectionDate" runat="server" TargetControlID="txtLetterDate" Format="dd/MM/yyyy"></cc1:CalendarExtender>
            </div>
        </div>
        <br />
        <div class="row border border-info">
            <div class="col-md-2 p-1">
                Block*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="gvTubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="ddlPanchayat" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="gvTubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Tubewell*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="0" runat="server" ControlToValidate="ddlTubewell" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="gvTubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlTubewell" runat="server" CssClass="form-control form-control-sm">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1 ">
                DPR(In Rs)*
                <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtDPRAmount" runat="server" Display="Dynamic" ValidationGroup="gvTubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtDPRAmount" ValidationGroup="gvTubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtDPRAmount" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <div class="col-md-2 p-1 ">
                Allotment(In Rs)*
                <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtAllotment" runat="server" Display="Dynamic" ValidationGroup="gvTubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtAllotment" ValidationGroup="gvTubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtAllotment" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <div class="col-md-2 p-1 ">
                <br />
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary btn-sm" OnClick="btnAdd_Click" ValidationGroup="gvTubewellEntry" />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records">
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
                        <asp:TemplateField HeaderText="Type" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblType" runat="server" Text='<%# Bind("Type") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" class="btn-primary" OnClick="btnDelete_Click" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

    </div>
</asp:Content>

