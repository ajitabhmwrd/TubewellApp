<%@ Page Title="" Language="C#" MasterPageFile="~/Accountant/Accountant.master" AutoEventWireup="true" CodeFile="AllotmentRequsitionRecived.aspx.cs" Inherits="Accountant_AllotmentRequsitionRecived" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
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
    <br />
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <span class="font-weight-bold">Tube Well Allotment Requisition (Plan)</span>
                <hr />
            </div>
            <div class="col-md-12">
                <asp:GridView ID="gvRequisition" runat="server" AutoGenerateColumns="false" CssClass="tableCust" OnRowDataBound="gvRequisition_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Requisition ID">
                            <ItemTemplate>
                                <asp:Label ID="lblRequisitionID" runat="server" Text='<%#Bind("RequisitionID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="District">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%#Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Requisition type">
                            <ItemTemplate>
                                <asp:Label ID="lblIsGroupReq" runat="server" Text='<%# Eval("IsGroupReq") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Is Forwarded">
                            <ItemTemplate>
                                <asp:Label ID="lblIsForwarded" runat="server" Text='<%# Eval("IsForwarded") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Forwarded Date">
                            <ItemTemplate>
                                <asp:Label ID="lblForwardDate" runat="server" Text='<%# Eval("ForwardDate","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Creation Date">
                            <ItemTemplate>
                                <asp:Label ID="lblEntryDt" runat="server" Text='<%# Eval("EntryDt","{0:dd/MMM/yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Requsition Letter">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkDownload" Text="" CommandArgument='<%# Eval("LetterLocation") %>' runat="server" OnClick="lnkDownload_Click"><i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Is Allotment Approved">
                            <ItemTemplate>
                                <asp:Label ID="lblIsAllotmentApproved" runat="server" Text='<%# Eval("IsAllotmentApproved") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Allotment Letter">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkAllotmentLetterLocation" Text="" CommandArgument='<%# Eval("AllotmentLetterLocation") %>' runat="server" OnClick="lnkDownload_Click"><i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download"></i></asp:LinkButton>

                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Prepare Allotment">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkPrepareAllotment" runat="server" Text="Prepare Allotment" OnClick="lnkPrepareAllotment_Click" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Finalize">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkFinalize" runat="server" Text="Finalize" OnClick="lnkFinalize_Click" ></asp:LinkButton>
                            </ItemTemplate>
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
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <br />
                            <span class="font-weight-bold">Forward Allotment Requisition</span>
                            <hr />
                        </div>
                        <div class="col-md-12 p-1">                            
                            <asp:Label ID="lblMessageMP" runat="server" Text="" Font-Bold="true" ForeColor="Red"></asp:Label>
                        </div>
                        <div class="col-md-12 p-1">                            
                            Requisition ID : <asp:Label ID="lblRequistionIDMP" runat="server" Text="" Font-Bold="true" ForeColor="Blue"></asp:Label>
                        </div>
                        <div class="col-md-2 p-1">
                        Financial Year*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" InitialValue="0" runat="server" ControlToValidate="ddlFinYear" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntryMP" Font-Bold="True"></asp:RequiredFieldValidator>
                        <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm">
                            <asp:ListItem Value="0">Select</asp:ListItem>
                        </asp:DropDownList>
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
                        <div class="col-md-12 p-2">
                            Upload Signed Letter (PDF only)*
                            <asp:FileUpload ID="fuForwardRequisitionPDF" runat="server" />
                        </div>
                        <div class="col-md-12 p-1">
                            <asp:Button ID="btnFinalize" runat="server"  Text="Finalize" CssClass="btn btn-primary btn-sm" ValidationGroup="TubewellEntryMP" OnClick="btnFinalize_Click" OnClientClick="return  confirm('Check Allotment is Prepared correctly before Proceed. This cannot be undone. !!!!')" />
                            <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-primary btn-sm" OnClick="btnClose_Click" />
                        </div>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnClose" />
                <asp:PostBackTrigger ControlID="btnFinalize" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender -->
</asp:Content>


