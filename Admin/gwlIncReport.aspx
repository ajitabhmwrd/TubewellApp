<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Master.master" AutoEventWireup="true" CodeFile="gwlIncReport.aspx.cs" Inherits="Admin_gwlIncReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../myContent/chartJs293/Chart.css" rel="stylesheet" />
    <link href="../myContent/chartJs293/Chart.min.css" rel="stylesheet" />
    <script src="../myContent/chartJs293/Chart.js"></script>
    <script src="../myContent/chartJs293/Chart.min.js"></script>
    <script src="../myContent/JS/utils.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width: 75%; margin:auto">
        <canvas id="canvas"></canvas>
    </div>
    <br>
    <br>
    <%--<button id="randomizeData">Randomize Data</button>
    <button id="addDataset">Add Dataset</button>
    <button id="removeDataset">Remove Dataset</button>
    <button id="addData">Add Data</button>
    <button id="removeData">Remove Data</button>--%>
    <script>
        var MONTHS = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
        var config = {
            type: 'bar',
            data: {
                labels: <% =string.Join(", ", getlabels()) %>,
                datasets: [{
                    label: 'Patna',
                    backgroundColor: window.chartColors.blue,
                    borderColor: window.chartColors.blue,
                    data: [<% =string.Join(", ", getData()) %>],
                    fill: false,
                }//,
                    //{
                    //label: 'My Second dataset',
                    //fill: false,
                    //backgroundColor: window.chartColors.blue,
                    //borderColor: window.chartColors.blue,
                    //data: [
                    //    randomScalingFactor(),
                    //    randomScalingFactor(),
                    //    randomScalingFactor(),
                    //    randomScalingFactor(),
                    //    randomScalingFactor(),
                    //    randomScalingFactor(),
                    //    randomScalingFactor()
                    //],
                    //}
                ]
            },
            options: {
                responsive: true,
                title: {
                    display: true,
                    text: 'Ground water label Chart'
                },
                tooltips: {
                    mode: 'index',
                    intersect: false,
                },
                hover: {
                    mode: 'nearest',
                    intersect: true
                },
                scales: {
                    xAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Date'
                        }
                    }],
                    yAxes: [{
                        display: true,
                        scaleLabel: {
                            display: true,
                            labelString: 'Ground Water Label'
                        }
                    }]
                }
            }
        };

        window.onload = function () {
            var ctx = document.getElementById('canvas').getContext('2d');
            window.myLine = new Chart(ctx, config);
        };

        document.getElementById('randomizeData').addEventListener('click', function () {
            config.data.datasets.forEach(function (dataset) {
                dataset.data = dataset.data.map(function () {
                    return randomScalingFactor();
                });

            });

            window.myLine.update();
        });

        var colorNames = Object.keys(window.chartColors);
        document.getElementById('addDataset').addEventListener('click', function () {
            var colorName = colorNames[config.data.datasets.length % colorNames.length];
            var newColor = window.chartColors[colorName];
            var newDataset = {
                label: 'Dataset ' + config.data.datasets.length,
                backgroundColor: newColor,
                borderColor: newColor,
                data: [],
                fill: false
            };

            for (var index = 0; index < config.data.labels.length; ++index) {
                newDataset.data.push(randomScalingFactor());
            }

            config.data.datasets.push(newDataset);
            window.myLine.update();
        });

        document.getElementById('addData').addEventListener('click', function () {
            if (config.data.datasets.length > 0) {
                var month = MONTHS[config.data.labels.length % MONTHS.length];
                config.data.labels.push(month);

                config.data.datasets.forEach(function (dataset) {
                    dataset.data.push(randomScalingFactor());
                });

                window.myLine.update();
            }
        });

        document.getElementById('removeDataset').addEventListener('click', function () {
            config.data.datasets.splice(0, 1);
            window.myLine.update();
        });

        document.getElementById('removeData').addEventListener('click', function () {
            config.data.labels.splice(-1, 1); // remove the label first

            config.data.datasets.forEach(function (dataset) {
                dataset.data.pop();
            });

            window.myLine.update();
        });
    </script>
</asp:Content>

