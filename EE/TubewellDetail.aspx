<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TubewellDetail.aspx.cs" Inherits="EE_TubewellDetail" %>

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
        <span class="font-weight-bold small">Tube Well List</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-3 p-1">
                <a class="btn btn-primary btn-sm" href="AddTubewell.aspx">Add new Tube Well</a>
            </div>
            <div class="col-md-9 p-1"></div>
            <div class="col-md-2 p-1">
                Type
                <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlType_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Status
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">
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
                <br />
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                    OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="50" AllowPaging="true" OnRowDataBound="gvTubewell_RowDataBound">
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
                        <asp:TemplateField HeaderText="Status" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnEdit" runat="server" Text="Edit" class="btn-primary" OnClick="btnEdit_Click" />
                                        <asp:Button ID="btnStEdit" runat="server" Text="Change Status" class="btn-primary" OnClick="btnStEdit_Click" />
                                        <asp:Button ID="btnView" runat="server" Text="View / Lock" class="btn-primary" OnClick="btnView_Click" />
                                        
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:PostBackTrigger ControlID="btnEdit" />
                                        <asp:PostBackTrigger ControlID="btnView" />
                                        <asp:PostBackTrigger ControlID="btnStEdit" />
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
                        Update Tube Well
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
                        Block*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlBlockMP" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlBlockMP" runat="server" CssClass="form-control form-control-sm" Visible="true" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChangedMP">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlPanchayatMP" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlPanchayatMP" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChangedMP">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Village*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server" ControlToValidate="ddlVillage" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Tubewell Name*
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTubewellName" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtTubewellName" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Tubewell Type*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="ddlTypeMP" Text="(Select)" ErrorMessage="Select Tube Well Type" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlTypeMP" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Longitude
                    <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtLongitude" ValidationGroup="TubewellEntry" Display="Dynamic"
                        ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtLongitude" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:TextBox ID="txtLongitude" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Latitude
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtLatitude" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLatitude" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:TextBox ID="txtLatitude" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Is Handed Over to Panchayat
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="0" runat="server" ControlToValidate="ddlIsHandedOver" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlIsHandedOver" runat="server" CssClass="form-control form-control-sm" OnSelectedIndexChanged="ddlIsHandedOver_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                            <asp:ListItem Value="Y">Yes</asp:ListItem>
                            <asp:ListItem Value="N">No</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3 p-1">
                        Handed Over Date
                        <asp:RequiredFieldValidator ID="rfvHandedOverDate" runat="server" ControlToValidate="txtHandedOverDate" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic" Font-Size="Small"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtHandedOverDate" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="(19|20|21)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])" ErrorMessage="(Invalid)" Font-Size="Small" />
                        <asp:TextBox ID="txtHandedOverDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                        <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtHandedOverDate" runat="server" TargetControlID="txtHandedOverDate" Format="yyyy-MM-dd"></cc1:CalendarExtender>
                    </div>

                    <div class="col-md-3 p-1">
                        Select Handed Over Block
                        <asp:RequiredFieldValidator ID="rfvHandOverBlock" InitialValue="0" runat="server" ControlToValidate="ddlHandOverBlock" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlHandOverBlock" runat="server" CssClass="form-control form-control-sm" OnSelectedIndexChanged="ddlHandOverBlock_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-3 p-1">
                        Select Handed Over Panchayat
                        <asp:RequiredFieldValidator ID="rfvHandOverPanchayat" InitialValue="0" runat="server" ControlToValidate="ddlHandOverPanchayat" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlHandOverPanchayat" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        CA Number*
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtCANo" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtCANo" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Scada Status
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="0" runat="server" ControlToValidate="ddlScadaStatus" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlScadaStatus" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Consern Farmer1 Name
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtCANo" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:TextBox ID="txtFarmer1Name" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Consern Farmer1 Mobile
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtCANo" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFarmer1Mobile" ErrorMessage="(Invalid)" ValidationExpression="[0-9]{10}" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtFarmer1Mobile" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Consern Farmer2 Name
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtCANo" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:TextBox ID="txtFarmer2Name" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Consern Farmer2 Mobile
                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtCANo" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFarmer2Mobile" ErrorMessage="(Invalid)" ValidationExpression="[0-9]{10}" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:TextBox ID="txtFarmer2Mobile" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnUpdate_Click" ValidationGroup="TubewellEntry" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" class="btn btn-primary btn-sm" />
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnUpdate" EventName="Click" />
                <asp:PostBackTrigger ControlID="btnClose" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender -->

    <!-- ModalPopupExtender2 -->
    <cc1:ModalPopupExtender ID="mpSt" runat="server" PopupControlID="Panel2" TargetControlID="lnkFake"
        CancelControlID="btnStClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Auto">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="p-4 row">
                    <div class="col-md-12 font-weight-bold small">
                        Update Tube Well Status
                <hr />
                    </div>

                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblStMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="col-md-12 p-1">
                       
                        Tubewell ID =
                            <asp:Label ID="lblTwStID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                        <br />
                        Tubewell Name =
                            <asp:Label ID="lblTwStName" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                        <br />
                        Tubewell Current Status =
                            <asp:Label ID="lblTwStStatus" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 p-1">
                        Status
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlStStatus" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntrySt" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlStStatus" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-9 p-1">
                        <br />
                        <asp:Button ID="btnStUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnStUpdate_Click" ValidationGroup="TubewellEntrySt" />
                        <asp:Button ID="btnStClose" runat="server" Text="Close" class="btn btn-primary btn-sm" />
                    </div>
                </div>
                

            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnStUpdate" EventName="Click" />
                <asp:PostBackTrigger ControlID="btnStClose" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender2 -->
</asp:Content>

