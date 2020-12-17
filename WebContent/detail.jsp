<%@page import="dto.Comment"%>
<%@page import="java.util.ArrayList"%>
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

.detail_container{
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
.comment_container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin-bottom: 200px;
}
.input_name {
	min-width: 150px;
	width: 15%
}
.input_submit {
	min-width: 100px;
	width: 10%
}
</style>
</head>
<body>
	<jsp:include page="nav.jsp"></jsp:include>
	
	<%
		int id = Integer.parseInt(request.getParameter("id"));
		RestaurantRepository dao = RestaurantRepository.getInstance();
		Restaurant restaurant = dao.getById(id);
		
		ArrayList<Comment> comments = new ArrayList<>();
		comments.add(new Comment("ㅇㅇ", "제육 맛집"));
		comments.add(new Comment("ㅇㅇ", "맛없음"));
	%>
	
	<div class="jumbotron">
		<div class="mainTitle">
			<h4 class="display-3">음식점 정보</h4>
			<div style="font-weight: bold; font-size: 20px; margin-top: 20px;"><%=restaurant.getName() %></div>
			<div><h3><span class="badge bg-info text-white"><%=restaurant.getCategory() %></span></h3></div>
		</div>
	</div>
	
	<div class="container detail_container">
		<div id="map" style="width: 400px; height: 400px;"></div>	
		<div class="contents">
			<div><h3>이름 : <%=restaurant.getName() %></h3></div>
			<div>카테고리 : <span class="badge bg-info text-white"><%=restaurant.getCategory() %></span></div>
			<div>주소(도로명주소) : <%= restaurant.getStreetName() %> <%= restaurant.getDetailAddr() %></div>
			<div>전화번호 : <%= restaurant.getPhoneNumber().isEmpty() ? "전화번호 없음" : restaurant.getPhoneNumber() %></div>
			<div>우편번호 : <%=restaurant.getZipCode() %>
			<div>위도 : <%=restaurant.getLatitude() %></div>
			<div>경도 : <%=restaurant.getLongitude() %></div>
			<br>
			<form method="post" action="naverInfo.jsp" accept-charset="utf-8">
				<input type="hidden" id="id" name="id" value=<%=restaurant.getId() %>>
				<button type="submit" class="btn btn-primary">네이버 지도에서 보기</button>	
			</form>	
		</div>
	</div>
	</div>
	
	<div class="container comment_container">
		<form action="CommentServlet" method="post" style="display: flex; width: 100%; margin-top: 10px;">
			<input type="text" name="comment" class="form-control" maxlength="50" placeholder="댓글을 입력하세요.">
			<input type="hidden" name="id" value="<%=id%>">
			<input type="submit" style="width: 80px; margin-left: 10px;" class="btn btn-primary" value="등록">
		</form>
		<table class="table comments">
			<tbody>
				<%
					for (Comment cmt : comments) {
				%>
					<tr>
						<td class="input_name"><%=cmt.getUsername() %></td>
						<td class="input_comment"><%=cmt.getComment() %></td>
					</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=6oe2c5j1oe&callback=initMap"></script>
    <script type="text/javascript">
        var map = null;

        function initMap() {
            map = new naver.maps.Map('map', {
                center: new naver.maps.LatLng(<%=restaurant.getLatitude() %>, <%=restaurant.getLongitude() %>),
                zoom: 15
            });
            var marker = new naver.maps.Marker({
                position: new naver.maps.LatLng(<%=restaurant.getLatitude() %>, <%=restaurant.getLongitude() %>),
                map: map
            });
            var contentString = [
                '<div class="iw_inner">',
                '   <h4><%=restaurant.getName() %></h4>',
                '   <p><%= restaurant.getStreetName() %> <%= restaurant.getDetailAddr() %><br />',
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