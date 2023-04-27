<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    let chart01 = {
        init: function () {




// Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
            Highcharts.chart('container', {
                chart: {
                    type: 'spline'
                },
                title: {
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                        'target="_blank">Wikipedia.com</a>'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                        'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                    accessibility: {
                        description: 'Months of the year'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Temperature'
                    },
                    labels: {
                        formatter: function () {
                            return this.value + '°';
                        }
                    }
                },
                tooltip: {
                    crosshairs: true,
                    shared: true
                },
                plotOptions: {
                    spline: {
                        marker: {
                            radius: 4,
                            lineColor: '#666666',
                            lineWidth: 1
                        }
                    }
                },
                series: [{ //데이터
                    name: 'Tokyo',
                    marker: {
                        symbol: 'square'
                    },
                    data: [5.2, 5.7, 8.7, 13.9, 18.2, 21.4, 25.0, 26 , 22.8, 17.5, 12.1, 7.6]

                }, {
                    name: 'Bergen',
                    marker: {
                        symbol: 'diamond'
                    },
                    data: [ 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
                },{
                    name: 'Korea',
                    marker: {
                        symbol: 'diamond'
                    },
                    data: [ 2.6, 3.7, 5.9, 10.5, 18.5, 19.5, 20.4, 21.5, 8.7, 3.7, 7.6]
                }
                ]
            });

        }
    };

    $(function(){
        chart01.init()

    })

</script>

<div class="container-fluid">

    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Dashboards</h1>
    <p class="mb-4">Chart.js is a third party plugin that is used to generate the charts in this theme.
        The charts below have been customized - for further customization options, please visit the <a
                target="_blank" href="https://www.chartjs.org/docs/latest/">official Chart.js
            documentation</a>.</p>

    <!-- Content Row -->
    <div class="row">

        <div class="col-xl-4 col-lg-5">
            <div class="card shadow mb-4">


                <div class="container">
                    <h6 class="m-0 font-weight-bold text-primary">Test Chart</h6>

                    <div id = "container">
                    </div>
                </div>
            </div>
        </div>




    </div>

    <!-- Donut Chart -->
    <div class="col-xl-4 col-lg-5">
        <div class="card shadow mb-4">
            <!-- Card Header - Dropdown -->
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Test Chart</h6>
            </div>
            <!-- Card Body -->
            <div class="card-body">
                <div class="chart-pie pt-4">
                    <canvas id="myPieChart"></canvas>
                </div>
                <hr>
                Styling for the donut chart can be found in the
                <code>/js/demo/chart-pie-demo.js</code> file.
            </div>
        </div>
    </div>
</div>

</div>
