<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="TubewellComplainList.aspx.cs" Inherits="EE_TubewellComplainList" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
     <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="ml-5 mr-5">
        <br />
        <span class="font-weight-bold small">Tube Well Complain</span>
        <hr />
        <div class="row"> 
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
            <div class="col-md-12 p-1">
                <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-primary btn-sm" OnClick="btnClear_Click" />
            </div>
            <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvTubewell" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"
                    OnPageIndexChanging="gvTubewell_PageIndexChanging" PageSize="100" AllowPaging="true" ShowFooter="false" FooterStyle-Font-Bold="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Complain ID">
                            <ItemTemplate>
                                <asp:Label ID="lblComplainID" runat="server" Text='<%# Bind("ComplainID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Tube well ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%# Bind("TubewellID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Tube well Details">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="District" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblDistName" runat="server" Text='<%# Bind("DistName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
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
                        <%--<asp:TemplateField HeaderText="Status" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Bind("Status") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField HeaderText="Informer Remarks Type" >
                            <ItemTemplate>
                                <asp:Label ID="lblRemarksType" runat="server" Text='<%# Bind("RemarksType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Informer Remarks" >
                            <ItemTemplate>
                                <asp:Label ID="lblRemarks" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Complain Date" >
                            <ItemTemplate>
                                <asp:Label ID="lblEntryDt" runat="server" Text='<%# Eval("EntryDt", "{0:dd/MMM/yyyy}") %>' /></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>   
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Pdf">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkPDF" Text="" CommandArgument='<%# Eval("PDF") %>' runat="server" OnClick="lnkDownload_Click"><i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download MB"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Image1">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkImage1" Text="" CommandArgument='<%# Eval("Image1") %>' runat="server" OnClick="lnkDownload_Click"><i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download MB"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Image2">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkImage2" Text="" CommandArgument='<%# Eval("Image2") %>' runat="server" OnClick="lnkDownload_Click"><i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download MB"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Resolved Status"  >
                            <ItemTemplate>
                                <asp:Label ID="lblResolvedStatus" runat="server" Text='<%# Bind("ResolvedStatus") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Resolved Remarks"  >
                            <ItemTemplate>
                                <asp:Label ID="lblClosingRemarks" runat="server" Text='<%# Bind("ClosingRemarks") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Resolved Pdf">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkResolvedPdf" Text="" CommandArgument='<%# Eval("ResolvedPdf") %>' runat="server" OnClick="lnkDownload_Click"><i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download MB"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Resolved Image">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkResolvedImage1" Text="" CommandArgument='<%# Eval("ResolvedImage1") %>' runat="server" OnClick="lnkDownload_Click"><i class="fa fa-download" aria-hidden="true"  data-toggle="tooltip" data-placement="bottom" title="Download MB"></i></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Resolved Date" >
                            <ItemTemplate>
                                <asp:Label ID="lblClosedDate" runat="server" Text='<%# Eval("ClosedDate", "{0:dd/MMM/yyyy}") %>' /></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:TemplateField ItemStyle-Wrap="false" HeaderText="Edit">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" OnClick="lnkEdit_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    <asp:LinkButton ID="lnkFake" runat="server" Text=""></asp:LinkButton>
    <!-- ModalPopupExtender2 -->
    <cc1:ModalPopupExtender ID="mpSt" runat="server" PopupControlID="Panel2" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none" ScrollBars="Auto">
        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>
                <div class="p-4 row">
                    <div class="col-md-12 font-weight-bold small">
                        Update Tube Well Complain
                <hr />
                    </div>
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                    <div class="col-md-12 p-1">
                        <asp:Label ID="lblStMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                    </div>
                    <div class="col-md-12 p-1">
                       
                        Tubewell ID =
                            <asp:Label ID="lblTwStID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                        <br />
                        Tubewell Name =
                            <asp:Label ID="lblTwStName" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                        <%--<br />
                        Tubewell Current Status =
                            <asp:Label ID="lblTwStStatus" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>--%>
                        <br />
                        Complain ID = 
                            <asp:Label ID="lblStComplainID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-md-3 p-1">
                        Status*
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" InitialValue="0" runat="server" ControlToValidate="ddlResolvedType" Display="Dynamic" Text="(Select)" ErrorMessage="Select Block" ForeColor="Red" ValidationGroup="TubewellEntrySt" Font-Bold="True"></asp:RequiredFieldValidator>
                            <asp:DropDownList ID="ddlResolvedType" runat="server" CssClass="form-control form-control-sm">
                                <asp:ListItem Value="0">Select</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-12"></div>
                    <div class="col-md-3 p-1">
                        Resolved Remarks*
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtRemarks" ValidationGroup="TubewellEntrySt" Font-Bold="true" ForeColor="Red" runat="server" ErrorMessage="(Enter)"></asp:RequiredFieldValidator>
                        <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" CssClass="form-control form-control-sm"></asp:TextBox>
                    </div>
                    <div class="col-md-12"></div>
                    <div class="col-md-12 p-1">
                        Upload Image(.jpg only): <asp:FileUpload ID="fuImage1" runat="server" />                        
                    </div>
                    <div class="col-md-12 p-1">
                        Upload Document(.pdf only): <asp:FileUpload ID="fuPDF" runat="server" />
                    </div>
                    <div class="col-md-12 p-1">
                        <br />
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary btn-sm" OnClick="btnUpdate_Click" ValidationGroup="TubewellEntrySt" />
                        <asp:Button ID="btnClose" runat="server" Text="Close" class="btn btn-primary btn-sm" />
                    </div>
                </div>
                

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUpdate"/>
                <asp:PostBackTrigger ControlID="btnClose" />
            </Triggers>
        </asp:UpdatePanel>
    </asp:Panel>
    <!-- ModalPopupExtender2 -->

</asp:Content>

