<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="vendor/css/blog-home.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	>
<link
	href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/3.2.1/css/font-awesome.min.css"
	rel="stylesheet" />


<title>메인</title>
</head>

<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>


	<div class="container">
		<h3>이거는 오늘 안땡겨요</h3>
		<form role="form">
			<div class="row justify-content-center align-items-center">
				<div class="col-md-12">
					<fieldset>
						<%
							for (int i = 1; i < 10; i++) {
								String id = "inlineCheckbox"+i+"sm";
								String value = "option" + i;
								String label = "inlineCheckbox"+i+"sm";
								String name = i+"번쨰";
						%>
						<div class="checkbox checkbox-inline checkbox-circle checkbox-sm">
							<input type="checkbox" class="styled" id=<%=id %>
								value=<%=value %>> <label for=<%=label %>>
								<%=name %> </label>
						</div>
						<%
							}
						%>
					</fieldset>
				</div>
			</div>
		</form>
	</div>


	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
</html>