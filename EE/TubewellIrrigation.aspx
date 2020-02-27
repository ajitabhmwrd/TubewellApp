<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TubewellIrrigation.aspx.cs" Inherits="JE_TubewellIrrigation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .modalBackground {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .modalPopup {
            background-color: #FFFFFF;
            border-color: black;
            width: 95%;
            height: 600px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">Tube Well Irrigation List</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-3 p-1">
                <a class="btn btn-primary btn-sm" href="AddTubewellIrrigation.aspx">Add new Irrigation</a>
            </div>
            <div class="col-md-9 p-1"></div>
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
                <br />
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
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
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tube well ID">
                            <ItemTemplate>
                                <asp:Label ID="lblTubewellID" runat="server" Text='<%# Bind("TubewellID") %>'></asp:Label>
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
                        <%-- <asp:TemplateField HeaderText="Panchayat">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPanchayatName" runat="server" Text='<%# Bind("PanchayatName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                        <%--<asp:TemplateField HeaderText="Village">
                                    <ItemTemplate>
                                        <asp:Label ID="lblVILLNAME" runat="server" Text='<%# Bind("VILLNAME") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Area (In Decimal)">
                            <ItemTemplate>
                                <asp:Label ID="lblAreaDecimal" runat="server" Text='<%# Bind("AreaDecimal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Irrigation Time">
                            <ItemTemplate>
                                <asp:Label ID="lblDuration" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Revenue Demand<br/> (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueDemandRs" runat="server" Text='<%# Bind("RevenueDemandRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Revenue Collection<br/> (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueCollectionRs" runat="server" Text='<%# Bind("RevenueCollectionRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deposited In Bank<br/> (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblDepositedAmountInBank" runat="server" Text='<%# Bind("DepositedAmountInBank") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Irrigation Date">
                            <ItemTemplate>
                                <asp:Label ID="lblIrrigationDate" runat="server" Text='<%# Eval("IrrigationDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" class="btn-primary" OnClick="btnEdit_Click" />
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
    <asp:LinkButton ID="lnkFake" runat="server" Text=""></asp:LinkButton>
    <!-- ModalPopupExtender -->

    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Auto">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="p-4 row">
                    <div class="col-md-12 font-weight-bold small">
                        Update Tube Well Irrigation
                <hr />
                    </div>

                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblID" runat="server" Text="" ForeColor="Blue" Font-Bold="true" Visible="false"></asp:Label>
                        Tubewell ID =
                            <asp:Label ID="lblTubewellID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <div class="p-4 row">
                    <div class="col-md-3 p-1">
                        Irrigation Date(dd-MM-yyyy)*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtIrrigationDate" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtIrrigationDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\-(0[1-9]|1[0-2])\-((19|20)\d\d))$" ErrorMessage="(Invalid)" Font-Size="Small" />
                        <asp:TextBox ID="txtIrrigationDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                        <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtInspectionDate" runat="server" TargetControlID="txtIrrigationDate" Format="dd-MM-yyyy"></cc1:CalendarExtender>
                    </div>

                    <div class="col-md-3 m-0 p-1">
                        <div style="width: 100%;">
                            Irrigation Time Duration*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="Select" runat="server" Display="Dynamic" ControlToValidate="ddlHour" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="Select" runat="server" Display="Dynamic" ControlToValidate="ddlMinutes" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                        </div>
                        <div style="float: left; width: 50%;">
                            <asp:DropDownList ID="ddlHour" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem Value="Select">Select Hour</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div style="float: left; width: 50%;">
                            <asp:DropDownList ID="ddlMinutes" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem Value="Select">Select Minutes</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Irrigation Area(In Decimal)*
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtIrrigationAreaInDecimal" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtIrrigationAreaInDecimal" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtIrrigationAreaInDecimal" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Revenue Demand(In Rs.)*
                    <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtRevenueDemand" ValidationGroup="TubewellEntry" Display="Dynamic"
                        ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtRevenueDemand" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:TextBox ID="txtRevenueDemand" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Revenue Collection (In Rs.)*
                    <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtRevenueCollection" ValidationGroup="TubewellEntry" Display="Dynamic"
                        ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtRevenueCollection" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:TextBox ID="txtRevenueCollection" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1 ">
                        Deposited into Bank (In Rs.)*
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtBankDeposited" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtBankDeposited" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:TextBox ID="txtBankDeposited" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-6 p-1 "></div>
                    <div class="col-md-3 p-1 ">
                        Comment                        
                        <asp:TextBox ID="txtComment" TextMode="MultiLine" Rows="3" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                </div>
                <div class="p-4 row">
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnSave" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" ValidationGroup="TubewellEntry" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="btnClose_Click" CssClass="btn btn-primary btn-sm" />
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSave" EventName="Click" />
                <asp:PostBackTrigger ControlID="btnClose" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender -->
</asp:Content>

