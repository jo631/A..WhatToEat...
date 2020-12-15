<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Restaurant"%>
<%@ page import="dao.RestaurantRepository"%>

<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-home.css" rel="stylesheet">
<title>상품</title>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>
	<%
		request.setCharacterEncoding("UTF-8");
		RestaurantRepository dao = RestaurantRepository.getInstance();
		String foodName = request.getParameter("value");
		
		float latitude=(float)37.3422, longitude=(float)126.7280; //산기대 좌표
		
		if(!request.getParameter("latitude").isEmpty() && !request.getParameter("longitude").isEmpty()){
			latitude = Float.parseFloat(request.getParameter("latitude"));
			longitude = Float.parseFloat(request.getParameter("longitude"));
		}
		int range = Integer.parseInt(request.getParameter("range"));
		ArrayList<Restaurant> list = dao.getByCategory(foodName,range,latitude,longitude);
		
	%>
	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<%
				for (Restaurant r : list) {
			%>
			<div class="col-4">
				<p></p>
				<div class="card">
					<img class="card-img-top" src="resource/japan.jpg"
						alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title"><%=r.getName()%>
						</h2>
						<p class="card-text"><%=r.getStreetName() %></p>
						<a href="./detail.jsp?id=<%=r.getId() %>"
				class = "btn btn-primary" role="button"> 여기로 할래요 &rarr;></a>

					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<br><br><br><br>
	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Bootstrap core JavaScript -->
	<script src="./resources/css/jquery.min.js"></script>
	<script src="./resources/css/bootstrap.bundle.min.js"></script>

</body>
</html>