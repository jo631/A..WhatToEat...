<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<link href="./resources/css/blog-home.css" />
<link href="./resources/css/bootstrap.css" rel="stylesheet" />
<title>상품</title>
<style>
p {
	margin: 20px 0px;
}
</style>
</head>

<body>
	<!-- Navigation -->
		<jsp:include page="nav.jsp"></jsp:include>
	



	<div class="container">
		<div class="row">
			<!-- Blog Entries Column -->
			<%
				for (int i = 0; i < 9; i++) {
			%>
			<div class="col-4">
				<p></p>
				<div class="card">
					<img class="card-img-top" src="http://placehold.it/750x300"
						alt="Card image cap">
					<div class="card-body">
						<h2 class="card-title"><%=i + 1%>번째
						</h2>
						<p class="card-text">ㅇㄹㅇㄹㅇㄹ</p>
						<a href="#" class="btn btn-primary">Read More &rarr;</a>
					</div>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Bootstrap core JavaScript -->
	<script src="./resources/css/jquery.min.js"></script>
	<script src="./resources/css/bootstrap.bundle.min.js"></script>

</body>
</html>