<%@ Page Title="" Language="C#" MasterPageFile="~/Operator/Operator.master" AutoEventWireup="true" CodeFile="AddAllotmentPlan.aspx.cs" Inherits="Nodal_AddAllotmentPlan" MaintainScrollPositionOnPostback="true" %>

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
            width: 90%;
            height: 100vh;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <br />
        <span class="font-weight-bold small">Tube Well Allotment (Plan)</span>
        <hr />
    </div>
    <div class="container">
        <div class="row">

            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-md-2 p-1">
                District*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" InitialValue="0" runat="server" ControlToValidate="ddlDist" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlDist" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDist_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Block*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlBlock" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlBlock" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlBlock_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Panchyat*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" InitialValue="0" runat="server" ControlToValidate="ddlPanchayat" Text="(Select)" ErrorMessage="Select Panchayat" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlPanchayat" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlPanchayat_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-2 p-1">
                Tubewell*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" InitialValue="0" runat="server" ControlToValidate="ddlTubewell" Text="(Select)" ErrorMessage="Select Village" ForeColor="Red" ValidationGroup="TubewellEntry" Font-Bold="True" Font-Size="Small"></asp:RequiredFieldValidator>
                <asp:DropDownList ID="ddlTubewell" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlTubewell_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-3 p-1 ">
                Estimated Cost(In Rs)*
                <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtEstimated" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtEstimated" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                <asp:TextBox ID="txtEstimated" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
            </div>
            <div class="col-md-2 p-1 ">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-primary btn-sm" OnClick="btnAdd_Click" ValidationGroup="TubewellEntry" />
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>

            <div class="col-md-12">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                    OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="50" AllowPaging="true" OnRowEditing="gvTubewell_RowEditing" OnRowCancelingEdit="gvTubewell_RowCancelingEdit"
                    OnRowUpdating="gvTubewell_RowUpdating">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("ID") %>' Visible="false"></asp:Label>
                                <asp:Label ID="lblTubewellID" runat="server" Text='<%# Bind("TubewellID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tube well Name">
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

                        <asp:TemplateField HeaderText="Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblEstimatedCost" runat="server" Text='<%# Bind("EstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtEstimatedCost" runat="server" Display="Dynamic" ValidationGroup="TubewellEntry" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtEstimatedCost" ValidationGroup="TubewellEntry" Display="Dynamic"
                    ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                                <asp:TextBox ID="txtEstimatedCost" runat="server" ValidationGroup="gvValidation" Text='<%# Bind("EstimatedCost") %>'></asp:TextBox>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Allotment">
                            <ItemTemplate>
                                <asp:Label ID="lblTAllotmentAmount" runat="server" Text='<%# Bind("TAllotmentAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Alotment Count">
                            <ItemTemplate>
                                <asp:Label ID="lblAlotmentCount" runat="server" Text='<%# Bind("AlotmentCount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="" ItemStyle-Wrap="false">
                            <ItemTemplate >
                                <asp:Button ID="btnAddAllotment" runat="server" Text="Add Allotment" class="btn-primary" OnClick="btnAddAllotment_Click" />
                                <asp:Button ID="BtnECEdit" runat="server" Text="Edit" class="btn-primary" CommandName="Edit" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Button ID="btnECUpdate" runat="server" CommandName="Update" Text="Update" class="btn-primary" ValidationGroup="gvValidation" />
                                <asp:Button ID="btnECCancel" runat="server" CommandName="Cancel" Text="Cancel" class="btn-primary" />

                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <asp:LinkButton ID="lnkFake" runat="server" Text="" />

    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Auto">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="p-4 row">
                    <div class="col-md-12 font-weight-bold small">
                        Add Tube Well Allotment (Plan)
                <hr />
                    </div>
                    <div class="col-md-3 p-1">
                        Tubewell ID =
                        <asp:Label ID="lblAllotmentID" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="lblAdmAprID" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="lblTWID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-6 p-1">
                        Tubewell Name =
                <asp:Label ID="lblTWName" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 p-1"></div>
                    <div class="col-md-2 p-1">
                        Financial Year*
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlFinYear" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntryMP" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="col-md-2 p-1 ">
                        Allotment(In Rs)*
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtAllotment" runat="server" Display="Dynamic" ValidationGroup="TubewellEntryMP" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtAllotment" ValidationGroup="TubewellEntryMP" Display="Dynamic"
                            ValidationExpression="^(\d{1,18})(.\d{1,2})?$" ErrorMessage="(Invalid)" Font-Size="Small" Font-Bold="true" />
                        <asp:TextBox ID="txtAllotment" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>

                    <div class="col-md-2 p-1 ">
                        Letter No*
                        <asp:RequiredFieldValidator ErrorMessage="(Enter)" ControlToValidate="txtLtNO" runat="server" Display="Dynamic" ValidationGroup="TubewellEntryMP" ForeColor="Red" Font-Bold="true" Font-Size="Small" />
                        <asp:TextBox ID="txtLtNO" runat="server" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-3 p-1">
                        Letter Date(YYYY-MM-DD)*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtLtDate" Text="(Required)" ErrorMessage="Enter Tube Well Name" ForeColor="Red" ValidationGroup="TubewellEntryMP" Font-Bold="True" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator runat="server" ForeColor="Red" ControlToValidate="txtLtDate" ValidationGroup="TubewellEntryMP" Display="Dynamic"
                            ValidationExpression="(19|20|21)\d\d[-](0[1-9]|1[012])[-](0[1-9]|[12][0-9]|3[01])" ErrorMessage="(Invalid date)" />
                        <asp:TextBox ID="txtLtDate" runat="server" CssClass="form-control form-control-sm" autocomplete="off"></asp:TextBox>
                        <cc1:CalendarExtender ID="Calendar1" PopupButtonID="txtLtDate" runat="server" TargetControlID="txtLtDate" Format="yyyy-MM-dd"></cc1:CalendarExtender>
                    </div>
                    <div class="col-md-3 p-1 ">
                        <br />
                        <asp:Button ID="btnInsertAllotment" runat="server" Text="Add" CssClass="btn btn-primary btn-sm" OnClick="btnInsertAllotment_Click" ValidationGroup="TubewellEntryMP" />
                        <asp:Button ID="btnUpdateAllotment" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnUpdateAllotment_Click" ValidationGroup="TubewellEntryMP" Visible="false" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" OnClick="btnCancel_Click" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-primary btn-sm" OnClick="btnClose_Click" />
                    </div>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblMessageMP" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                </div>
                <div class="col-md-12 ">
                    <asp:GridView ID="gvAllotment" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                        HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found">
                        <Columns>
                            <asp:TemplateField HeaderText="SNo">
                                <ItemTemplate>
                                    <%#Container.DataItemIndex+1 %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allotment ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblAllotmentID" runat="server" Text='<%# Bind("AllotmentID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Financial Year">
                                <ItemTemplate>
                                    <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Bind("FinancialYear") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Allotment (In Rs)">
                                <ItemTemplate>
                                    <asp:Label ID="lblAllotmentAmount" runat="server" Text='<%# Bind("AllotmentAmount") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Letter No">
                                <ItemTemplate>
                                    <asp:Label ID="lblLetterNo" runat="server" Text='<%# Bind("LetterNo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Letter Date">
                                <ItemTemplate>
                                    <asp:Label ID="lblLetterDate" runat="server" Text='<%# Eval("LetterDate","{0:yyyy-MM-dd}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:Button ID="btnAllotmentEdit" runat="server" Text="Edit" class="btn-primary" OnClick="btnAllotmentEdit_Click" />
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="btnAllotmentEdit" EventName="Click" />
                                        </Triggers>
                                    </asp:UpdatePanel>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnInsertAllotment" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnUpdateAllotment" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnCancel" EventName="Click" />
                <asp:PostBackTrigger ControlID="btnClose"/>
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender -->
</asp:Content>
