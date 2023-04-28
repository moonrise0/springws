
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>

</style>

<script>
    let chart03 = {
        init:function(){
            this.getdata1();
            this.getdata2();
            this.getdata3();
        },
        getdata1:function(){
            $.ajax({
                    url:'/chart0301',
                    success:function(result){
                        chart03.display1(result);
                    }

                });

        },
        getdata2:function(){
            $.ajax({
                url:'/chart0302',
                success:function(result){
                    chart03.display2(result);
                }

            });


        },
        getdata3:function(){
            $.ajax({
                url:'/chart0301',
                success:function(result){
                    chart03.display3(result);
                }

            });

        },
        display1:function(result){
            Highcharts.chart('c1', {
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45
                    }
                },
                title: {
                    text: 'Beijing 2022 gold medals by country',
                    align: 'left'
                },
                subtitle: {
                    text: '3D donut in Highcharts',
                    align: 'left'
                },
                plotOptions: {
                    pie: {
                        innerSize: 100,
                        depth: 45
                    }
                },
                series: [{
                    name: 'Medals',
                    data: result
                }]
            });
        },
        display2:function(result){
            Highcharts.chart('c2', {
            chart: {
                type: 'cylinder',
                options3d: {
                    enabled: true,
                    alpha: 15,
                    beta: 15,
                    depth: 50,
                    viewDistance: 25
                }
            },
            title: {
                text: 'Number of confirmed COVID-19'
            },
            subtitle: {
                text: 'Source: ' +
                    '<a href="https://www.fhi.no/en/id/infectious-diseases/coronavirus/daily-reports/daily-reports-COVID19/"' +
                    'target="_blank">FHI</a>'
            },
            xAxis: {
                categories: ['0-9', '10-19', '20-29', '30-39', '40-49', '50-59', '60-69', '70-79', '80-89', '90+'],
                title: {
                    text: 'Age groups'
                }
            },
            yAxis: {
                title: {
                    margin: 20,
                    text: 'Reported cases'
                }
            },
            tooltip: {
                headerFormat: '<b>Age: {point.x}</b><br>'
            },
            plotOptions: {
                series: {
                    depth: 25,
                    colorByPoint: true
                }
            },
            series: [{
                data: result ,
                name: 'Cases',
                showInLegend: false
            }]
        });},
        display3:function(result){

            Highcharts.chart('c3', {
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
                    data: [{
                        y: 1.5,
                        marker: {
                            symbol: 'url(https://www.highcharts.com/samples/graphics/snow.png)'
                        },
                        accessibility: {
                            description: 'Snowy symbol, this is the coldest point in the chart.'
                        }
                    }, 1.6, 3.3, 5.9, 10.5, 13.5, 14.5, 14.4, 11.5, 8.7, 4.7, 2.6]
                }]
            });




        }
    };
    $(function(){
        chart03.init();




    })

</script>

<div class="col-sm-8 text-left">
  <div class="container">
      <h3 >CHART03</h3>
      <div class="row">
          <div class="col-sm-4" id="c1"></div>
          <div class="col-sm-4" id="c2"></div>
          <div class="col-sm-4" id="c3"></div>

      </div>
  </div>
</div>