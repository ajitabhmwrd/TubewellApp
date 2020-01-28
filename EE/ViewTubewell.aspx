<%@ Page Title="" Language="C#" MasterPageFile="~/EE/eeMaster.master" AutoEventWireup="true" CodeFile="ViewTubewell.aspx.cs" Inherits="EE_ViewTubewell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <div class="container">
        <span class="font-weight-bold small">View/ Lock Tube Well</span>
        <hr />
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-12 p-1">
                <a class="btn btn-primary btn-sm" href="TubewellDetail.aspx">Back</a>
            </div>
            <div class="col-md-12 p-1">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            </div>
            <div class="col-md-12 p-1">
                Tubewell ID =
                <asp:Label ID="lblTubewellID" runat="server" Text="" ForeColor="Blue" Font-Bold="true"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3 p-1">
                Block :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblblock" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Panchyat :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblPanchayat" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Village :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblVillage" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>

            <div class="col-md-3 p-1">
                Tubewell Name :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblName" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Status :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblStatus" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Tubewell Type :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblType" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Longitude :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblLong" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Latitude :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblLat" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Is Handed Over to Panchayat :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblIsHandOverPanchayat" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>

            <div class="col-md-3 p-1">
                Handed Over Date :
            </div>

            <div class="col-md-3 p-1">
                <asp:Label ID="lblHandOverDate" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Handed Over Block :
            </div>

            <div class="col-md-3 p-1">
                <asp:Label ID="lblHandOverBlock" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Handed Over Panchayat :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblHandOverPanchayat" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                CA Number :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblCANo" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Scada Status :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblScadaStatus" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Consern Farmer1 Name :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblFarName" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Consern Farmer1 Mobile :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblFarMobile" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Consern Farmer2 Name :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblFar2Name" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-3 p-1">
                Consern Farmer2 Mobile :
            </div>
            <div class="col-md-3 p-1">
                <asp:Label ID="lblFar2Mob" runat="server" Font-Bold="True" Font-Size="12px"></asp:Label>
            </div>
            <div class="col-md-12 p-1">
                <hr />
                <asp:Button ID="btnLock" runat="server" Text="Lock" class="btn btn-primary btn-sm" OnClick="btnLock_Click" />
            </div>
        </div>
    </div>

    <br />
</asp:Content>





