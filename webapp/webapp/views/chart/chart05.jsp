<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
     let chart05 = {
         init:function(){
             $('#get_btn').click(function(){
                 var year = $('#sel1').val();
                 chart05.getdata(year);
             });
         },
         getdata:function(){
             $.ajax({
                   url:'/chart05',
                 data:{'year':year},
                 success:function (result){
                     chart05.display1(result);
                     chart05.display2(result);
                 }
                 });
         },

         display1:function(result){

             // Data retrieved https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature
             Highcharts.chart('c1', {
                 chart: {
                     type: 'spline'
                 },
                 title: {
                     text: 'Monthly Average Temperature'
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
                 series: [{
                     name: 'korea',
                     marker: {
                         symbol: 'square'
                     },
                     data: result

                 }]
             });

         },
         display2:function(result){


             Highcharts.chart('container', {
                 chart: {
                     type: 'column'
                 },
                 title: {
                     text: 'Monthly Average Rainfall'
                 },
                 subtitle: {
                     text: 'Source: WorldClimate.com'
                 },
                 xAxis: {
                     categories: [
                         'Jan',
                         'Feb',
                         'Mar',
                         'Apr',
                         'May',
                         'Jun',
                         'Jul',
                         'Aug',
                         'Sep',
                         'Oct',
                         'Nov',
                         'Dec'
                     ],
                     crosshair: true
                 },
                 yAxis: {
                     min: 0,
                     title: {
                         text: 'Rainfall (mm)'
                     }
                 },
                 tooltip: {
                     headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                     pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                         '<td style="padding:0"><b>{point.y:.1f} mm</b></td></tr>',
                     footerFormat: '</table>',
                     shared: true,
                     useHTML: true
                 },
                 plotOptions: {
                     column: {
                         pointPadding: 0.2,
                         borderWidth: 0
                     }
                 },
                 series: [{
                     name: 'Tokyo',
                     data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4,
                         194.1, 95.6, 54.4]

                 }, {
                     name: 'New York',
                     data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5,
                         106.6, 92.3]

                 }, {
                     name: 'London',
                     data: [48.9, 38.8, 39.3, 41.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3,
                         51.2]

                 }, {
                     name: 'Berlin',
                     data: [42.4, 33.2, 34.5, 39.7, 52.6, 75.5, 57.4, 60.4, 47.6, 39.1, 46.8,
                         51.1]

                 }]
             });


         }
     }
    $(function(){


    })

</script>

<div class="col-sm-8 text-left">
  <div class="container">
      <h3 >CHART05</h3>


      <div class="row">
       <div class="form-group col-sm-2" >
          <label for="sel1">Year:</label>
          <select class="form-control" id="sel1">
              <c:forEach begin="2010" end="2020" var="year">
                  <option value="${year}">${year}</option>
              </c:forEach>
          </select>
           <button id="get_btn">GET</button>

       </div>
      </div>

      <div class="row">
          <div class="col-sm-4" id="c1"></div>
          <div class="col-sm-4" id="c2"></div>
      </div>
  </div>
</div>