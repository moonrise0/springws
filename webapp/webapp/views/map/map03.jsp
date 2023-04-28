<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    #map {
        width:600px;
        height:400px;
        border: 2px solid red;
    }
</style>
<script>
    let map03 = {
        map: null,
        init: function () {
            this.display();
            $('#s_btn').click(function(){
                map03.go(37.572209, 126.976814, 's');
            });
            $('#b_btn').click(function(){
                map03.go(35.157439, 129.059139, 'b');
            });
            $('#j_btn').click(function(){
                map03.go(33.361666, 126.529166, 'j');
            });
        },
        display: function() {
            let mapContainer = document.querySelector('#map03 > #map');
            let mapOption = {
                center: new kakao.maps.LatLng(37.544969, 127.056497), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };
            //지도생성
            map = new kakao.maps.Map(mapContainer, mapOption);
            //우측상단 옵션 추가
            var mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            var zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
            // 마커생성
            var markerPosition  = new kakao.maps.LatLng(37.544969, 127.056497);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
        },
        go: function(lat, lng, loc) {

            let mapContainer = document.querySelector('#map03 > #map');
            let mapOption = {
                center: new kakao.maps.LatLng(37.544969, 127.056497), // 지도의 중심좌표
                level: 4 // 지도의 확대 레벨
            };
            //지도생성
            map = new kakao.maps.Map(mapContainer, mapOption);

            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
                  var zoomControl = new kakao.maps.ZoomControl();
                map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // // 이동할 위도 경도 위치를 생성합니다
            // var moveLatLon = new kakao.maps.LatLng(lat, lng);
            // // 지도 중심을 부드럽게 이동시킵니다
            // // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
            // map.panTo(moveLatLon);

            var markerPosition  = new kakao.maps.LatLng(lat, lng);
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);
            map03.markers(loc);
        },
        markers: function(loc){
            $.ajax({
                url:'/markers',
                data:{'loc':loc},
                success:function(data){
                    map03.displaymarkers(data);
                }
            });
        },
        displaymarkers: function(positions) {
            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
            for (var i = 0; i < positions.length; i ++) {
                var imageSize = new kakao.maps.Size(20, 30);
                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);
                var marker = new kakao.maps.Marker({
                    map: map,
                    position: markerPosition,
                    title : positions[i].title,
                    image : markerImage
                });
                // infoWindow
                var iwContent = '<h2>'+positions[i].title+'</h2>';
                iwContent += '<img src="/uimg/'+positions[i].img+'" style="width:50px">';
                var infowindow = new kakao.maps.InfoWindow({
                    position : markerPosition,
                    content : iwContent
                });
                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));
                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));
                function mouseoverListener(marker, infowindow) {
                    return function(){
                        infowindow.open(map, marker);
                    };
                }
                function mouseoutListener(marker, infowindow) {
                    return function(){
                        infowindow.close();
                    };
                }
                function mouseclickListener(target) {
                    return function(){
                        location.href = target;
                    };
                }
            } // end for
        }
    };
    $(function() {
        map03.init();
    })
</script>

<div class="col-sm-8 text-left">
    <div id="map03">
        <h3>MAP03</h3><br/>
        <button type="button" class="btn btn-primary" id="s_btn">Seoul</button>
        <button type="button" class="btn btn-primary" id="b_btn">Busan</button>
        <button type="button" class="btn btn-primary" id="j_btn">Jeju</button>
        <div id="map">

        </div>
    </div>
</div>




<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<style>--%>
<%--    #map {--%>
<%--        width:600px;--%>
<%--        height:400px;--%>
<%--        border: 2px solid red;--%>
<%--    }--%>
<%--</style>--%>
<%--<script>--%>
<%--    let map03 = {--%>
<%--        map: null,--%>
<%--        init: function () {--%>
<%--            this.display();--%>
<%--            $('#s_btn').click(function(){--%>
<%--                map03.go(37.572209, 126.976814, 's');--%>
<%--            });--%>
<%--            $('#b_btn').click(function(){--%>
<%--                map03.go(35.157439, 129.059139, 'b');--%>
<%--            });--%>
<%--            $('#j_btn').click(function(){--%>
<%--                map03.go(33.361666, 126.529166, 'j');--%>
<%--            });--%>
<%--        },--%>
<%--        display: function() {--%>
<%--            let mapContainer = document.querySelector('#map');--%>
<%--            let mapOption = {--%>
<%--                center: new kakao.maps.LatLng(37.572209, 126.976814), // 지도의 중심좌표--%>
<%--                level: 4 // 지도의 확대 레벨--%>
<%--            };--%>
<%--            //지도생성--%>
<%--            map = new kakao.maps.Map(mapContainer, mapOption);--%>
<%--            //우측상단 옵션 추가--%>
<%--            var mapTypeControl = new kakao.maps.MapTypeControl();--%>
<%--            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);--%>
<%--            var zoomControl = new kakao.maps.ZoomControl();--%>
<%--            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);--%>
<%--            // 마커생성--%>
<%--            var markerPosition  = new kakao.maps.LatLng(36.244969, 127.156497);--%>
<%--            var marker = new kakao.maps.Marker({--%>
<%--                position: markerPosition--%>
<%--            });--%>
<%--            marker.setMap(map);--%>
<%--        },--%>
<%--        go: function(lat, lng, loc) {--%>
<%--            // 이동할 위도 경도 위치를 생성합니다--%>
<%--            var moveLatLon = new kakao.maps.LatLng(lat, lng);--%>

<%--            // 지도 중심을 부드럽게 이동시킵니다--%>
<%--            // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다--%>
<%--            map.panTo(moveLatLon);--%>

<%--            var markerPosition  = new kakao.maps.LatLng(lat, lng);--%>
<%--            var marker = new kakao.maps.Marker({--%>
<%--                position: markerPosition--%>
<%--            });--%>
<%--            marker.setMap(map);--%>
<%--            map03.markers(loc);--%>
<%--        },--%>
<%--        markers: function(loc){--%>
<%--            $.ajax({--%>
<%--                url:'/markers',--%>
<%--                data:{'loc':loc},--%>
<%--                success:function(data){--%>
<%--                    map03.displaymarkers(data);--%>
<%--                }--%>
<%--            });--%>
<%--        },--%>
<%--        displaymarkers: function(positions) {--%>

<%--            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";--%>
<%--            for (var i = 0; i < positions.length; i ++) {--%>
<%--                var imageSize = new kakao.maps.Size(20, 30);--%>
<%--                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);--%>
<%--                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);--%>

<%--                var marker = new kakao.maps.Marker({--%>
<%--                    map: map,--%>
<%--                    position: markerPosition,--%>
<%--                    title : positions[i].title,--%>
<%--                    image : markerImage--%>
<%--                });--%>
<%--                // infoWindow--%>
<%--                var iwContent = '<h2>'+positions[i].title+'</h2>';--%>
<%--                iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';--%>

<%--                var infowindow = new kakao.maps.InfoWindow({--%>
<%--                    position : markerPosition,--%>
<%--                    content : iwContent--%>
<%--                });--%>

<%--                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));--%>
<%--                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));--%>
<%--                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));--%>


<%--                function mouseoverListener(marker, infowindow) {--%>
<%--                    return function(){--%>
<%--                        infowindow.open(map, marker);--%>
<%--                    };--%>
<%--                }--%>
<%--                function mouseoutListener(marker, infowindow) {--%>
<%--                    return function(){--%>
<%--                        infowindow.close();--%>
<%--                    };--%>
<%--                }--%>

<%--                function mouseclickListener(target) {--%>
<%--                    return function(){--%>
<%--                        location.href = target;--%>
<%--                    };--%>
<%--                }--%>

<%--            } // end for--%>
<%--        }--%>
<%--    };--%>

<%--    $(function() {--%>
<%--        map03.init();--%>
<%--    })--%>
<%--</script>--%>

<%--<div class="col-sm-8 text-left">--%>
<%--    <div id="map03">--%>
<%--        <h3>MAP03</h3><br/>--%>
<%--        <button type="button" class="btn btn-primary" id="s_btn">Seoul</button>--%>
<%--        <button type="button" class="btn btn-primary" id="b_btn">Busan</button>--%>
<%--        <button type="button" class="btn btn-primary" id="j_btn">Jeju</button>--%>
<%--        <div id="map">--%>

<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>






<%--&lt;%&ndash;<script>&ndash;%&gt;--%>
<%--&lt;%&ndash;    let map03 = {&ndash;%&gt;--%>
<%--&lt;%&ndash;        map: null,&ndash;%&gt;--%>
<%--&lt;%&ndash;        init: function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;            this.display();&ndash;%&gt;--%>
<%--&lt;%&ndash;            $('#s_btn').click(function(){&ndash;%&gt;--%>
<%--&lt;%&ndash;                map03.go(37.5418405  , 127.0576091, 's')&ndash;%&gt;--%>
<%--&lt;%&ndash;            });&ndash;%&gt;--%>
<%--&lt;%&ndash;            $('#b_btn').click(function(){&ndash;%&gt;--%>
<%--&lt;%&ndash;                map03.go(35.1938469  ,  129.1536102 , 'b')&ndash;%&gt;--%>
<%--&lt;%&ndash;            });&ndash;%&gt;--%>
<%--&lt;%&ndash;            $('#j_btn').click(function(){&ndash;%&gt;--%>
<%--&lt;%&ndash;                map03.go(32.6521163  ,  116.5895896, 'j')&ndash;%&gt;--%>
<%--&lt;%&ndash;            });&ndash;%&gt;--%>
<%--&lt;%&ndash;        },&ndash;%&gt;--%>
<%--&lt;%&ndash;        display: function () {&ndash;%&gt;--%>
<%--&lt;%&ndash;            var mapContainer = document.querySelector('#map');&ndash;%&gt;--%>
<%--&lt;%&ndash;            var mapOption = {&ndash;%&gt;--%>
<%--&lt;%&ndash;                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표&ndash;%&gt;--%>
<%--&lt;%&ndash;                level: 3 // 지도의 확대 레벨&ndash;%&gt;--%>
<%--&lt;%&ndash;            };&ndash;%&gt;--%>

<%--&lt;%&ndash;            map = new kakao.maps.Map(mapContainer, mapOption);&ndash;%&gt;--%>

<%--&lt;%&ndash;            var markerPosition  = new kakao.maps.LatLng(35.450701, 126.570667);&ndash;%&gt;--%>
<%--&lt;%&ndash;            var marker = new kakao.maps.Marker({&ndash;%&gt;--%>
<%--&lt;%&ndash;                position: markerPosition&ndash;%&gt;--%>
<%--&lt;%&ndash;            });&ndash;%&gt;--%>

<%--&lt;%&ndash;            marker.setMap(map);&ndash;%&gt;--%>
<%--&lt;%&ndash;        },&ndash;%&gt;--%>

<%--&lt;%&ndash;        go:function(lat,lng,loc){&ndash;%&gt;--%>
<%--&lt;%&ndash;            var moveLatLon = new kakao.maps.LatLng(lat,lng);&ndash;%&gt;--%>
<%--&lt;%&ndash;            map.panTo(moveLatLon);&ndash;%&gt;--%>

<%--&lt;%&ndash;            var markerPosition  = new kakao.maps.LatLng(lat,lng);&ndash;%&gt;--%>
<%--&lt;%&ndash;            var marker = new kakao.maps.Marker({&ndash;%&gt;--%>
<%--&lt;%&ndash;                position: markerPosition&ndash;%&gt;--%>
<%--&lt;%&ndash;            });&ndash;%&gt;--%>
<%--&lt;%&ndash;            marker.setMap(map);&ndash;%&gt;--%>
<%--&lt;%&ndash;            map03.markers(loc);&ndash;%&gt;--%>
<%--&lt;%&ndash;        },&ndash;%&gt;--%>
<%--&lt;%&ndash;          markers:function(loc){&ndash;%&gt;--%>
<%--&lt;%&ndash;           $.ajax({&ndash;%&gt;--%>
<%--&lt;%&ndash;               url:'/markers',&ndash;%&gt;--%>
<%--&lt;%&ndash;               date:{'loc':loc},&ndash;%&gt;--%>
<%--&lt;%&ndash;               success:function(data){&ndash;%&gt;--%>
<%--&lt;%&ndash;               map03.displaymarkers(data);&ndash;%&gt;--%>
<%--&lt;%&ndash;               }&ndash;%&gt;--%>
<%--&lt;%&ndash;           });&ndash;%&gt;--%>
<%--&lt;%&ndash;          },&ndash;%&gt;--%>

<%--&lt;%&ndash;        displaymarkers(positions){&ndash;%&gt;--%>

<%--&lt;%&ndash;            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";&ndash;%&gt;--%>
<%--&lt;%&ndash;            for (var i = 0; i < positions.length; i ++) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                var imageSize = new kakao.maps.Size(20, 30);&ndash;%&gt;--%>
<%--&lt;%&ndash;                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);&ndash;%&gt;--%>
<%--&lt;%&ndash;                var markerPosition = new kakao.maps.LatLng(positions[i].lat, positions[i].lng);&ndash;%&gt;--%>

<%--&lt;%&ndash;                var marker = new kakao.maps.Marker({&ndash;%&gt;--%>
<%--&lt;%&ndash;                    map: map,&ndash;%&gt;--%>
<%--&lt;%&ndash;                    position: markerPosition,&ndash;%&gt;--%>
<%--&lt;%&ndash;                    title : positions[i].title,&ndash;%&gt;--%>
<%--&lt;%&ndash;                    image : markerImage&ndash;%&gt;--%>
<%--&lt;%&ndash;                });&ndash;%&gt;--%>
<%--&lt;%&ndash;                // infoWindow&ndash;%&gt;--%>
<%--&lt;%&ndash;                var iwContent = '<h2>'+positions[i].title+'</h2>';&ndash;%&gt;--%>
<%--&lt;%&ndash;                iwContent += '<img src="/img/'+positions[i].img+'" style="width:50px">';&ndash;%&gt;--%>

<%--&lt;%&ndash;                var infowindow = new kakao.maps.InfoWindow({&ndash;%&gt;--%>
<%--&lt;%&ndash;                    position : positions[i].latlng,&ndash;%&gt;--%>
<%--&lt;%&ndash;                    content : iwContent&ndash;%&gt;--%>
<%--&lt;%&ndash;                });&ndash;%&gt;--%>

<%--&lt;%&ndash;                kakao.maps.event.addListener(marker, 'mouseover', mouseoverListener(marker, infowindow));&ndash;%&gt;--%>
<%--&lt;%&ndash;                kakao.maps.event.addListener(marker, 'mouseout', mouseoutListener(marker, infowindow));&ndash;%&gt;--%>
<%--&lt;%&ndash;                kakao.maps.event.addListener(marker, 'click', mouseclickListener(positions[i].target));&ndash;%&gt;--%>


<%--&lt;%&ndash;                function mouseoverListener(marker, infowindow) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    return function(){&ndash;%&gt;--%>
<%--&lt;%&ndash;                        infowindow.open(map, marker);&ndash;%&gt;--%>
<%--&lt;%&ndash;                    };&ndash;%&gt;--%>
<%--&lt;%&ndash;                }&ndash;%&gt;--%>
<%--&lt;%&ndash;                function mouseoutListener(marker, infowindow) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    return function(){&ndash;%&gt;--%>
<%--&lt;%&ndash;                        infowindow.close();&ndash;%&gt;--%>
<%--&lt;%&ndash;                    };&ndash;%&gt;--%>
<%--&lt;%&ndash;                }&ndash;%&gt;--%>
<%--&lt;%&ndash;                function mouseclickListener(target) {&ndash;%&gt;--%>
<%--&lt;%&ndash;                    return function(){&ndash;%&gt;--%>
<%--&lt;%&ndash;                        // location.href = '/shopdetail?id='+target;&ndash;%&gt;--%>
<%--&lt;%&ndash;                        location.href =target;&ndash;%&gt;--%>
<%--&lt;%&ndash;                    };&ndash;%&gt;--%>
<%--&lt;%&ndash;                }&ndash;%&gt;--%>

<%--&lt;%&ndash;            } // end for&ndash;%&gt;--%>

<%--&lt;%&ndash;        } // end function&ndash;%&gt;--%>







<%--&lt;%&ndash;        }&ndash;%&gt;--%>
<%--&lt;%&ndash;    };&ndash;%&gt;--%>

<%--&lt;%&ndash;    $(function(){&ndash;%&gt;--%>
<%--&lt;%&ndash;        map03.init();&ndash;%&gt;--%>
<%--&lt;%&ndash;    })&ndash;%&gt;--%>

<%--&lt;%&ndash;</script>&ndash;%&gt;--%>

<%--&lt;%&ndash;<div class="col-sm-8 text-left">&ndash;%&gt;--%>
<%--&lt;%&ndash;  <div class="container" id="map03">&ndash;%&gt;--%>
<%--&lt;%&ndash;      <h3 >MAP03</h3>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <button id="s_btn" type ="button" class="btn btn-primary">Seoul</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <button id="b_btn" type ="button" class="btn btn-primary">Busan</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;      <button id="j_btn" type ="button" class="btn btn-primary">Jeju</button>&ndash;%&gt;--%>

<%--&lt;%&ndash;      <div id="map" style="width:1000px;height:350px;"></div>&ndash;%&gt;--%>


<%--&lt;%&ndash;  </div>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>