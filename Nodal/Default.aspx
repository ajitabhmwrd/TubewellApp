<%@ Page Title="" Language="C#" MasterPageFile="~/Nodal/Nodal.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Nodal_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../myContent/chartJs293/Chart.css" rel="stylesheet" />
    <link href="../myContent/chartJs293/Chart.min.css" rel="stylesheet" />
    <script src="../myContent/chartJs293/Chart.js"></script>
    <script src="../myContent/chartJs293/Chart.min.js"></script>
    <script src="../myContent/JS/utils.js"></script>
    <script src="../myContent/chartJs293/chartjs-plugin-labels.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
    <style>
        .cadrdWidth {
            width: 250px;
            padding: 10px;
        }

        .card {
            overflow: hidden;
        }

        .card-body .rotate {
            z-index: 8;
            float: right;
            height: 100%;
        }

            .card-body .rotate i {
                color: rgba(20, 20, 20, 0.15);
                position: absolute;
                left: 0;
                left: auto;
                right: -10px;
                bottom: 0;
                display: block;
                -webkit-transform: rotate(-44deg);
                -moz-transform: rotate(-44deg);
                -o-transform: rotate(-44deg);
                -ms-transform: rotate(-44deg);
                transform: rotate(-44deg);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4 class="text-center mt-2">Dashboard</h4>
    <hr />
    <%--<div style="width: 250px">
        <div class="card bg-primary text-white m-2">
            <div class="card-body font-weight-bold">
                Total Tubewell -
                10240
            </div>
        </div>
    </div>--%>

    <div class="mr-5 ml-5">
        <div class="row">
            <%--<div class="col-md-4 text-center">
                <canvas id="cFunNonFun"></canvas>
                <asp:Label ID="lblTTubewell" runat="server" Text=""></asp:Label><br />
                <a href="rptTubewellHandover.aspx">View all</a>
            </div>--%>
            <div class="cadrdWidth">
                <div class="card text-white" style="background-color: deepskyblue">
                    <div class="card-body">
                        <div class="rotate">
                            <i class="fas fa-tint fa-4x"></i>
                        </div>
                        <h6 class="font-weight-bold">Total Tube Well</h6>
                        <h4 class="font-weight-bold">
                            <asp:Label ID="lblTTubewell" runat="server" Text=""></asp:Label></h4>
                    </div>
                </div>
            </div>

            <div class="cadrdWidth">
                <div class="card text-white" style="background-color: darkseagreen">
                    <div class="card-body ">
                        <div class="rotate">
                            <i class="fas fa-tint fa-4x"></i>
                        </div>
                        <h6 class="font-weight-bold">Functional</h6>
                        <h4 class="font-weight-bold">
                            <asp:Label ID="lblFun" runat="server" Text=""></asp:Label></h4>
                    </div>
                </div>
            </div>
            <div class="cadrdWidth">
                <div class="card text-white" style="background-color: indianred">
                    <div class="card-body ">
                        <div class="rotate">
                            <i class="fas fa-tint-slash fa-4x"></i>
                        </div>
                        <h6 class="font-weight-bold">Non Functional</h6>
                        <h4 class="font-weight-bold">
                            <asp:Label ID="lblNonFun" runat="server" Text=""></asp:Label></h4>
                    </div>
                </div>
            </div>

            <%--<div class="cadrdWidth" >
                <div class="card text-white"  style="background-color:burlywood">
                    <div class="card-body">
                        <div class="rotate">
                            <i class="fas fa-tint fa-4x"></i>
                        </div>
                        <h6 class="font-weight-bold">Percentage (Functional)</h6>
                        <h4 class="font-weight-bold">
                            <asp:Label ID="lblPercent" runat="server" Text="50%"></asp:Label></h4>
                    </div>
                </div>
            </div>--%>

            <div class="cadrdWidth">
                <div class="card text-white" style="background-color: darkseagreen">
                    <div class="card-body ">
                        <div class="rotate">
                            <i class="fas fa-tint fa-4x"></i>
                        </div>
                        <h6 class="font-weight-bold">Functional (24 hr)</h6>
                        <h4 class="font-weight-bold">
                            <asp:Label ID="lblFunLastDay" runat="server" Text=""></asp:Label></h4>
                    </div>
                </div>
            </div>
            <div class="cadrdWidth">
                <div class="card text-white" style="background-color: indianred">
                    <div class="card-body ">
                        <div class="rotate">
                            <i class="fas fa-tint-slash fa-4x"></i>
                        </div>
                        <h6 class="font-weight-bold">Non Functional (24 hr)</h6>
                        <h4 class="font-weight-bold">
                            <asp:Label ID="lblNonFunLastDay" runat="server" Text=""></asp:Label></h4>
                    </div>
                </div>
            </div>

        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="button" id="btnClps" class="btn btn-link float-right">Collapse All</button>
                <b>Reports :</b> 
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 p-1">
                <div id="accordion">
                    <div class="card">
                        <a class="card-link" data-toggle="collapse" href="#TubDetail">
                            <div class="card-header text-white font-weight-bold" style="padding:4px;background-color:#008fcc;">
                                Tube well
                            </div>
                        </a>
                        <div id="TubDetail" class="clToggle collapse show">
                            <div class="card-body">                                
                                <a href="rptTubewellCompleteList.aspx">Tube Well List </a><br />
                                
                                <a href="rptTubewellHandover.aspx">Tube Well Functional Count Report</a><br />
                                <a href="rptTubewellFunctionalDatewise.aspx">Tube Well Change in Functional Date-wise Report</a><br />
                                <a href="TubewellCompleteDetailRpt.aspx">Tube well Complete Detail Report</a><br />
                            </div>
                        </div>
                    </div>
                </div>
                <div id="accordion">
                    <div class="card">
                        <a class="card-link" data-toggle="collapse" href="#TubIrrigation">
                            <div class="card-header text-white font-weight-bold"  style="padding:4px;background-color:#008fcc;">
                                Irrigation
                            </div>
                        </a>
                        <div id="TubIrrigation" class="clToggle collapse show">
                            <div class="card-body">
                                <a href="RptTwIrrigationDistWise.aspx">Tube well Irrigation Report District-Wise</a><br />
                                <a href="RptTubewellIrrigationTubewellwise.aspx">Tube well-wise Irrigation Report</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="accordion">
                    <div class="card">
                        <a class="card-link" data-toggle="collapse" href="#TubInspection">
                            <div class="card-header text-white font-weight-bold"  style="padding:4px;background-color:#008fcc;">
                                Inspection
                            </div>
                        </a>
                        <div id="TubInspection" class="clToggle collapse show">
                            <div class="card-body">
                                <a href="TubewellInpectionCountDistRpt.aspx">Inspection District-wise Report</a><br />
                                <a href="rptTubewellInspectionList.aspx">Tube well-wise Inspection Report</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 p-1">                
                <div id="accordion">
                    <div class="card">
                        <a class="card-link" data-toggle="collapse" href="#TubCritical">
                            <div class="card-header text-white font-weight-bold"  style="padding:4px;background-color:#008fcc;">
                                Critical Reports (Ground Water Label)
                            </div>
                        </a>
                        <div id="TubCritical" class="clToggle collapse show">
                            <div class="card-body">
                                <a href="rptCriticalZoneTubewellDistwiseReport.aspx">Tube Well District-wise Critical-Zone Report</a><br />
                                <a href="rptCriticalityTubewellwise.aspx">Tube Well-wise Critical-Zone Report</a>   <br />
                                <a href="rptCriticalBlock.aspx">Tube well Critical Block</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="accordion">
                    <div class="card">
                        <a class="card-link" data-toggle="collapse" href="#TubAllotments">
                            <div class="card-header text-white font-weight-bold"  style="padding:4px;background-color:#008fcc;">
                                Allotments
                            </div>
                        </a>
                        <div id="TubAllotments" class="clToggle collapse show">
                            <div class="card-body">
                                <a href="TubewellAllotmentRpt.aspx">Tube Well Allotment Report</a><br />
                                <a href="TubewellwiseAllotmentRpt.aspx">Tube Well Wise Allotment Report</a> <br />
                                <a href="rptTwDistwisePlanHeadHQ.aspx">Tube Well District-wise Plan Head Report (HQ)</a><br />
                                <a href="rptTwDistwiseNonPlanHead.aspx">Tube Well District-wise Non-Plan Head Report</a><br />
                                <a href="RptTwEstimatedCost.aspx">Tube well Estimated Cost</a><br>
                                <a href="RptTwPysicalFinProgress.aspx">Tube well Physical and Financial Progress</a>
                            </div>
                        </div>
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
    <%--<script>
        var configFunnonFun = {
            type: 'pie',
            data: {
                datasets: [{
                    data: [
                        <% =string.Join(", ", getFunctional()) %>
                    ],
                    backgroundColor: [
                        window.chartColors.grey,
                        window.chartColors.yellow
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    'Non-functional',
                    'Functional',
                ]
            },
            options: {
                responsive: true
            }
        };

        window.onload = function () {
            var cFunNonFun = document.getElementById('cFunNonFun').getContext('2d');
            window.myPie = new Chart(cFunNonFun, configFunnonFun);
        };
    </script>--%>
</asp:Content>

