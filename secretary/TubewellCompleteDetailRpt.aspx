<%@ Page Title="" Language="C#" MasterPageFile="~/secretary/Nodal.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="TubewellCompleteDetailRpt.aspx.cs" Inherits="Nodal_TubewellCompleteDetailRpt" %>
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
    <div class="container">
        <br />
        <div class="row">
            <div class="col-md-12">
                <span class="font-weight-bold small">Tube Well Complete Detail</span>
                <button type="button" id="btnClps" class="btn btn-link float-right">Collapse All</button>
                <hr />
            </div>
        </div>

        <div class="row">
            <div style="padding-left: 10px"></div>
            <div class="col-md-2 p-1">
                District               
                <asp:DropDownList ID="ddlDist" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlDist_SelectedIndexChanged">
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
                Financial Year
                <asp:DropDownList ID="ddlFinYear" runat="server" CssClass="form-control form-control-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFinYear_SelectedIndexChanged">
                    <asp:ListItem Value="0">Select</asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>
    </div>
    <div id="divDetail" runat="server" class="container">
        <div id="accordion">
            <div class="card">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#TubDetail">Tube well Detail
                    </a>
                </div>
                <div id="TubDetail" class="clToggle collapse show">
                    <div class="card-body">
                        <div class="row">

                            <div class="col-md-3 p-1">
                                Tubewell ID :
                                 <asp:Label ID="lblTubewellID" runat="server" Text="" ForeColor="Blue"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3 p-1">
                                Block :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblblock" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Panchyat :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblPanchayat" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Village :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblVillage" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>

                            <div class="col-md-3 p-1">
                                Tubewell Name :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblName" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Tubewell Status :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblStatus" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Tubewell Type :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblType" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Longitude :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblLong" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Latitude :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblLat" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Is Handed Over to Panchayat :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblIsHandOverPanchayat" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>

                            <div class="col-md-3 p-1">
                                Handed Over Date :
                            </div>

                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblHandOverDate" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Handed Over Block :
                            </div>

                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblHandOverBlock" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Handed Over Panchayat :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblHandOverPanchayat" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                CA Number :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblCANo" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Scada Status :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblScadaStatus" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#TubContact">Tube well Contacts
                    </a>
                </div>
                <div id="TubContact" class="clToggle collapse show">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3 p-1">
                                AE Name :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblAEName" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                AE Mobile :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblAEMobile" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                JE Name :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblJEName" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                JE Mobile :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblJEMobile" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Consern Farmer1 Name :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblFarName" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Consern Farmer1 Mobile :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblFarMobile" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Consern Farmer2 Name :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblFar2Name" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>
                            <div class="col-md-3 p-1">
                                Consern Farmer2 Mobile :
                            </div>
                            <div class="col-md-3 p-1">
                                <asp:Label ID="lblFar2Mob" runat="server" Font-Size="14px" ForeColor="Blue"></asp:Label>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#TubAllot">Tube well Allotment
                    </a>
                </div>
                <div id="TubAllot" class="clToggle collapse show">
                    <div class="card-body">                        
                        <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvAllot" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"  ShowFooter="true" FooterStyle-Font-Bold="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>                                       
                        <asp:TemplateField HeaderText="Financial Year">
                            <ItemTemplate>
                                <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Bind("FinancialYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Letter No">
                            <ItemTemplate>
                                <asp:Label ID="lblLetterNo" runat="server" Text='<%# Bind("LetterNo") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Letter Date" ItemStyle-Wrap="false" >
                            <ItemTemplate>
                                <asp:Label ID="lblLetterDate" runat="server" Text='<%# Bind("LetterDate","{0:dd-MM-yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Head" ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:Label ID="lblHeadType" runat="server" Text='<%# Bind("HeadType") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Estimated Cost (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblEstimatedCost" runat="server" Text='<%# Bind("EstimatedCost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Allotment (In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblAllotmentAmount" runat="server" Text='<%# Bind("AllotmentAmount") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#TubIrrigation">Tube well Irrigation
                    </a>
                </div>
                <div id="TubIrrigation" class="clToggle collapse show">
                    <div class="card-body">                        
                        <div class="col-md-12 p-2 table-responsive">
                <asp:GridView ID="gvIrrigation" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered table-sm" GridLines="None"
                    HeaderStyle-CssClass="customBgColor text-white" EmptyDataText="No Records Found"  ShowFooter="false" FooterStyle-Font-Bold="true">
                    <Columns>
                        <asp:TemplateField HeaderText="SNo">
                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>                                       
                        <asp:TemplateField HeaderText="Financial Year">
                            <ItemTemplate>
                                <asp:Label ID="lblFinancialYear" runat="server" Text='<%# Bind("FinancialYear") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Duration">
                            <ItemTemplate>
                                <asp:Label ID="lblHour" runat="server" Text='<%# Bind("Hour") %>'></asp:Label> Hour
                                <asp:Label ID="lblMinute" runat="server" Text='<%# Bind("Minute") %>'></asp:Label> Minute
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Irrigation Area">
                            <ItemTemplate>
                                <asp:Label ID="lblAreaDecimal" runat="server" Text='<%# Bind("AreaDecimal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Demand(In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueDemandRs" runat="server" Text='<%# Bind("RevenueDemandRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Collection(In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblRevenueCollectionRs" runat="server" Text='<%# Bind("RevenueCollectionRs") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Deposited In Bank(In Rs)">
                            <ItemTemplate>
                                <asp:Label ID="lblDepositedAmountInBank" runat="server" Text='<%# Bind("DepositedAmountInBank") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header">
                    <a class="card-link" data-toggle="collapse" href="#TubInspect">Tube well Inspection
                    </a>
                </div>
                <div id="TubInspect" class="clToggle collapse show">
                    <div class="card-body">
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
                                            <asp:ImageButton ID="ibImage" runat="server" AlternateText="No Image" ImageUrl='<%# GetImage(Eval("Image")) %>' Height="200px" Width="100%" OnClick="ibImage_Click" CssClass="rounded" />
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:LinkButton Text="" ID="lnkFake" runat="server" />
                        <!-- ModalPopupExtender -->
                        <cc1:modalpopupextender id="mp1" runat="server" popupcontrolid="Panel1" targetcontrolid="lnkFake"
                            cancelcontrolid="btnClose" backgroundcssclass="modalBackground">
                        </cc1:modalpopupextender>
                        <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none">
                            <asp:Image ID="imgMP" runat="server" CssClass="img-FullScr" /><br />
                            <asp:Button ID="btnClose" runat="server" Text="Close" CssClass="btn btn-primary btn-sm" />
                        </asp:Panel>
                        <!-- ModalPopupExtender -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#btnClps").click(function () {

            if ($(this).data("closedAll")) {
                $(".clToggle").collapse("show");
                $("#btnClps").text("Collapse All");

            }
            else {
                $(".clToggle").collapse("hide");
                $("#btnClps").text("Expand All");
            }

            // save last state
            $(this).data("closedAll", !$(this).data("closedAll"));
        });
    </script>
</asp:Content>

