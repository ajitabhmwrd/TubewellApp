<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="AddTubewell.aspx.cs" Inherits="EE_AddTubewell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <br />
            <div class="container">
                <span class="font-weight-bold small">Add new Tube Well</span>
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
                    
                </div>
                <div class="row">
                    <div class="col-md-3 p-1">
                        Block*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" InitialValue="0" runat="server" ControlToValidate="ddlPanchayat" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Village*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" InitialValue="0" runat="server" ControlToValidate="ddlVillage" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlVillage" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Tubewell Name*
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTubewellName" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtTubewellName" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Tubewell Status*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlStatus" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Tubewell Type*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="ddlType" Text="(Select)" ErrorMessage="Select Tube Well Type" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlType" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3 p-1">
                        Longitude
                    <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtLongitude" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtLongitude" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:TextBox ID="txtLongitude" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Latitude
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtLatitude" ValidationGroup="TubewellEntry" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtLatitude" Text="(Enter)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        <asp:TextBox ID="txtLatitude" runat="server" CssClass="form-control" MaxLength="50"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Is Handed Over to Panchayat
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="0" runat="server" ControlToValidate="ddlIsHandedOver" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlIsHandedOver" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>                        
                    </div>

                    <div class="col-md-3 p-1">
                        Select Hand Over Block
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" InitialValue="0" runat="server" ControlToValidate="ddlHandOverBlock" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlHandOverBlock" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>                        
                    </div>

                    <div class="col-md-3 p-1">
                        Select Hand Over Panchayat
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="0" runat="server" ControlToValidate="ddlHandOverPanchayat" Text="(Select)" ErrorMessage="Select Tube Well Status" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlHandOverPanchayat" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>                        
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-md-12 p-1">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" ValidationGroup="TubewellEntry" />
                        <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="btn btn-secondary btn-sm" OnClick="btnReset_Click" />
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlBlock" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="ddlPanchayat" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger  ControlID="btnSave" EventName="Click" />
            <asp:AsyncPostBackTrigger  ControlID="btnReset" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

