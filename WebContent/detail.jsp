<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Restaurant" %>
<%@ page import="dao.RestaurantRepository" %>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">
<meta charset="UTF-8">
<title>음식점 상세정보</title>
<style>
.mainTitle{
	text-align: center
}

.container{
	display: flex;
	align-items: center;
	justify-content: center;
}
.contents {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-left: 30px;
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<%
		//String id = request.getParameter("id");
		//RestaurantRepository dao = RestaurantRepository.getInstance();
		//Restaurant restaurant = dao.getProductById(id);
	%>
	
	<div class="jumbotron">
		<div class="mainTitle">
			<h4 class="display-3">음식점 정보</h4>
			<div style="font-weight: bold; font-size: 20px; margin-top: 20px;">음식점 이름 들어갈자리</div>
			<div><h3><span class="badge bg-info text-white">치킨</span></h3></div>
		</div>
	</div>
	
	<div class="container">
		<div id="map" style="width: 400px; height: 400px;"/>	
		</div>
		<div class="contents">
			<div><h3>이름 : </h3></div>
			<div>카테고리 : <span class="badge bg-info text-white">치킨</span></div>
			<div>주소(도로명주소) : </div>
			<div>전화번호 : </div>
			<div>우편번호 : </div>
			<div>위도 : </div>
			<div>경도 : </div>
		</div>
	</div>
	
	    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=6oe2c5j1oe&callback=initMap"></script>
    <script type="text/javascript">
        var map = null;

        function initMap() {
            map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(37.3595704, 127.105399),
                zoom: 15
            });
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(37.3595704, 127.105399),
                map: map
            });
            var contentString = [
                '<div class="iw_inner">',
                '   <h4>음식점 이름이 들어갈 자리</h4>',
                '   <p>주소가 들어갈 자리<br />',
                '   </p>',
                '</div>'
            ].join('');
            var infowindow = new naver.maps.InfoWindow({
            	content: contentString,
                maxWidth: 250,
                backgroundColor: "#eee",
                borderColor: "#353A3F",
                borderWidth: 5,
                anchorSize: new naver.maps.Size(30, 30),
                anchorSkew: true,
                anchorColor: "#eee",
                pixelOffset: new naver.maps.Point(20, -20)
            });

            naver.maps.Event.addListener(marker, "click", function(e) {
                if (infowindow.getMap()) {
                    infowindow.close();
                } else {
                    infowindow.open(map, marker);
                }
            });
        }
    </script>
	
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>