<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="UpdateTubewell.aspx.cs" Inherits="EE_UpdateTubewell" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Update Tube Well</span>
                <hr />
            </div>

            <div class="container">
                <div class="row">
                    <div class="col-md-12 p-1">
                        <a class="btn btn-primary btn-sm" href="TubewellDetail.aspx">Back To Tubewell List</a>
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="col-md-12 p-1">
                        Tubewell ID = <asp:Label ID="lblTubewellID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 p-1">
                        Block*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlPanchayat" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
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
                    <%--<div class="col-md-3 p-1">
                        Tubewell Status*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlStatus" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>--%>
                    <div class="col-md-3 p-1">
                        Tubewell Type*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="ddlType" Text="(Select)" ErrorMessage="Select Tube Well Type" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control form-control-sm">
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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtFarmer1Mobile" ErrorMessage="(Invalid)"  ValidationExpression="[0-9]{10}"  ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>  
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
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtFarmer2Mobile" ErrorMessage="(Invalid)"  ValidationExpression="[0-9]{10}"  ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Display="Dynamic"></asp:RegularExpressionValidator>  
                        <asp:TextBox ID="txtFarmer2Mobile" runat="server" CssClass="form-control form-control-sm" MaxLength="50"></asp:TextBox>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnUpdate_Click" ValidationGroup="TubewellEntry" />
                        <a class="btn btn-primary btn-sm" href="TubewellDetail.aspx">Cancel</a>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlBlock" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlPanchayat" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger  ControlID="btnUpdate" EventName="Click" />
            
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>



