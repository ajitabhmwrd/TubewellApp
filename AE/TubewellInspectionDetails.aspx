<%@ Page Title="" Language="C#" MasterPageFile="~/AE/AEMaster.master" AutoEventWireup="true" CodeFile="TubewellInspectionDetails.aspx.cs" MaintainScrollPositionOnPostback="true" Inherits="JE_TubewellInspectionDetails" %>

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
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: auto;
            height: auto;
        }

        .img-FullScr {
            max-width: 99%;
            max-height: 95vh;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">Tube well Inpection Detail </span>
        <hr />
    </div>

    <div class="container">
        <div class="row" style="font-size: 14px">
            <div class="col-md-12 p-1">
                <a class="btn btn-primary btn-sm" href="TubwellInpectionList.aspx">Back</a>
            </div>
            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell ID :
                        <asp:Label ID="lblTubewellID" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                CA Number :
                        <asp:Label ID="lblCANumber" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Name :
                        <asp:Label ID="lblName" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell District :
                        <asp:Label ID="lblDistrict" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Block :
                        <asp:Label ID="lblBlock" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Panchayat :
                        <asp:Label ID="lblPanchayat" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Village :
                        <asp:Label ID="lblVillage" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Type :
                        <asp:Label ID="lblType" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Current Status :
                        <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
        </div>

        <div class="col-md-12 p-2">
            <asp:GridView ID="gvInspection" runat="server" AutoGenerateColumns="False" CssClass="table table-sm" GridLines="None"
                HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found" DataKeyNames="InpectionID" ShowHeader="false" OnRowDataBound="gvInspection_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <span style="font-size: 15px; font-weight: bold; padding-bottom: 8px">
                                <%#Container.DataItemIndex+1 %>.
                               Inspection By : 
                                <asp:Label ID="lblEntryBy" runat="server" Text='<%# Bind("Name") %>'></asp:Label>,
                                <asp:Label ID="lblEntryByDesignation" runat="server" Text='<%# Bind("EntryByDesignation") %>'></asp:Label>,
                                 Date :
                                <asp:Label ID="lblInspectionDate" runat="server" Text='<%# Eval("InspectionDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </span>
                            <br />
                            <b>Inspection Status : </b>
                            <asp:Label ID="lblInspectionStatus" runat="server" Text='<%# Bind("InspectionStatus") %>'></asp:Label>
                            <br />
                            <br />
                            <div class="row">
                                <asp:Repeater ID="rtImage" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-3">
                                            <asp:Label ID="lblImageID" runat="server" Text='<%# Bind("ImageID") %>' Visible="false"></asp:Label>
                                            <asp:ImageButton ID="ibImage" runat="server" AlternateText="No Image" ImageUrl='<%# GetImage(Eval("Image")) %>' Height="200px" Width="100%" OnClick="ibImage_Click" CssClass="rounded" />
                                            <b>Comment (
                                                <asp:Label ID="lblEntryBy" runat="server" Text='<%# Bind("Name") %>'></asp:Label>,
                                                <asp:Label ID="lblCommentByDesignation" runat="server" Text='<%# Bind("CommentByDesignation") %>'></asp:Label>) : </b>
                                            <asp:Label ID="lblComment" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                                            <br />
                                            <asp:LinkButton ID="btnAddComment" runat="server" Text="Add Comment" OnClick="btnAddComment_Click" /><br />
                                            <asp:LinkButton ID="lbTotalComments" runat="server" Text='<%# Bind("stTotalComment") %>' OnClick="lbTotalComments_Click" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <asp:LinkButton Text="" ID="lnkFake" runat="server" />
    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="Panel1" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
        <asp:Image ID="imgMP" runat="server" CssClass="img-FullScr" /><br />
        <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-primary btn-sm" />
    </asp:Panel>
    <!-- ModalPopupExtender -->

    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="mpComment" runat="server" PopupControlID="pnlComment" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlComment" runat="server" CssClass="modalPopup" align="center" Style="display: none">
        <div class="row p-5">
            <div class="col-md-12 p-2">
                <b>Comment</b>
            </div>

            <div class="col-md-12 p-2">
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5"></asp:TextBox>
                <asp:Label ID="lblMessageComment" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                <asp:Label ID="lblImageID" runat="server" Text="" Visible="false"></asp:Label>
            </div>
            <div class="col-md-12 p-2">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-primary btn-sm" OnClick="btnSave_Click" />
                <asp:Button ID="btnCommentClose" runat="server" Text="Close" CssClass="btn btn-primary btn-sm" />
            </div>
        </div>

    </asp:Panel>
    <!-- ModalPopupExtender -->

    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="mpCommentView" runat="server" PopupControlID="pnlCommentView" TargetControlID="lnkFake"
        CancelControlID="btnClose" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlCommentView" runat="server" ScrollBars="Auto" CssClass="modalPopup" align="center" Style="display: none">
        <div class="row p-5">
            <div class="col-md-12 p-2">
                <b>Comments</b>
            </div>
            <div class="col-md-12 p-2">
                <asp:GridView ID="gvComment" runat="server" AutoGenerateColumns="false" CssClass="tableCust">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblCommentID" runat="server" Text='<%# Bind("CommentID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comment">
                            <ItemTemplate>
                                <asp:Label ID="lblComment" runat="server" Text='<%# Bind("Comment") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comment by">
                            <ItemTemplate>
                                <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label> 
                                (<asp:Label ID="lblEntryByDesig" runat="server" Text='<%# Bind("EntryByDesig") %>'></asp:Label>)
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comment Date">
                            <ItemTemplate>
                                <asp:Label ID="lblEntryDt" runat="server" Text='<%# Eval("EntryDt", "{0:dd MMM yyyy hh:mm tt }") %>' /></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div class="col-md-12">
                <asp:Button ID="Button1" runat="server" Text="Close" CssClass="btn btn-primary btn-sm" />
            </div>
        </div>
    </asp:Panel>
    <!-- ModalPopupExtender -->
</asp:Content>

