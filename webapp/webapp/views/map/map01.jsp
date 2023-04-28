<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #map01 > #map{
        width:400px;
        height:400px;
        border:2px solid red;
    }

</style>

<script>
   let map01={
       mapdata:null,
       init:function(){
           var mapContainer = document.querySelector('#map');
           var mapOption = {
               center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
               level: 3 // 지도의 확대 레벨
           };
          map = new kakao.maps.Map(mapContainer, mapOption);

           var markerPosition  = new kakao.maps.LatLng(33.450701, 126.570667);

           var marker = new kakao.maps.Marker({
               position: markerPosition
           });

           marker.setMap(map);


           // 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
           var iwContent = '<img src="/img/b.jpg" style="width:80px"><div style="padding:5px;">Hello World!</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다

           var infowindow = new kakao.maps.InfoWindow({
               content : iwContent
           });

           kakao.maps.event.addListener(marker, 'mouseover', function() {
               infowindow.open(map, marker);
           });

           kakao.maps.event.addListener(marker, 'mouseout', function() {
               infowindow.close();
           });

           kakao.maps.event.addListener(marker, 'click', function() {
               location.href='http://www.nate.com';
           });


       }

   };
    $(function(){
        map01.init();

    })

</script>

<div class="col-sm-8 text-left">
  <div class="container">
      <h3 >MAP01</h3>
      <div id = "map"></div>


  </div>
</div>