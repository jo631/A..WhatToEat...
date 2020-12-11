<%@page import="java.util.ArrayList"%>
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
	<br><br><br>
	<%
		request.setCharacterEncoding("UTF-8");
		RestaurantRepository dao = RestaurantRepository.getInstance();
		String foodName = request.getParameter("value");
		ArrayList<Restaurant> list = dao.getByCategory(foodName);
		
		
		for(Restaurant a : list){
			System.out.println(a.getName());
		}
		
		
		float latitude=0,longitude=0;
		
		if(!request.getParameter("latitude").isEmpty() && !request.getParameter("longitude").isEmpty()){
			latitude = Float.parseFloat(request.getParameter("latitude"));
			longitude = Float.parseFloat(request.getParameter("longitude"));
		}
		
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
						<a href="#" class="btn btn-primary">Read More &rarr;</a>

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