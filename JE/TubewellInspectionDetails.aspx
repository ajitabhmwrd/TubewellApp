<%@ Page Title="" Language="C#" MasterPageFile="~/JE/JEMaster.master" AutoEventWireup="true" CodeFile="TubewellInspectionDetails.aspx.cs" Inherits="JE_TubewellInspectionDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
        <div class="col-md-12 p-2 table-responsive">
            <asp:Panel ID="pnlDetail" runat="server" CssClass="=row">
            </asp:Panel>
        </div>
    </div>
</asp:Content>

