<%@ Page Title="" Language="C#" MasterPageFile="~/AE/AEMaster.master" AutoEventWireup="true" CodeFile="TubewellInspectionDetails.aspx.cs" Inherits="AE_TubewellInspectionDetails" %>

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
        <span class="font-weight-bold small">Tube well Inpection Detail</span>
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
                Tubewell Status :
                        <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
            </div>
        </div>

        <div class="col-md-12 p-2">
            <asp:GridView ID="gvInspection" runat="server" AutoGenerateColumns="False" CssClass="table table-sm" GridLines="None"
                HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found" DataKeyNames="InpectionID" ShowHeader="false" OnRowDataBound="gvInspection_RowDataBound">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <span style="font-size: 15px; font-weight: bold; color: blue; padding-bottom: 8px"><%#Container.DataItemIndex+1 %>.
                               Inspection By : 
                                <asp:Label ID="lblEntryByDesignation" runat="server" Text='<%# Bind("EntryByDesignation") %>'></asp:Label>,
                                 Date :
                                <asp:Label ID="lblInspectionDate" runat="server" Text='<%# Eval("InspectionDate", "{0:dd/MM/yyyy}") %>'></asp:Label>
                            </span>
                            <div class="row">
                                <asp:Repeater ID="rtImage" runat="server">
                                    <ItemTemplate>
                                        <div class="col-md-3">
                                            <asp:Label ID="lblImageID" runat="server" Text='<%# Bind("ImageID") %>' Visible="false"></asp:Label>,
                                            <asp:ImageButton ID="ibImage" runat="server" AlternateText="No Image" ImageUrl='<%# GetImage(Eval("Image")) %>' Height="200px" OnClick="ibImage_Click" CssClass="rounded" />
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
</asp:Content>

