<%@ page contentType="text/html; charset=utf-8"%>

<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="vendor/css/blog-home.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
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
			<div class="row">
				<div class="col-md-12">
					<fieldset>
						<div class="checkbox">
							<input id="checkbox1" class="styled" type="checkbox"> <label
								for="checkbox1"> Default </label>
						</div>
						<div class="checkbox checkbox-primary">
							<input id="checkbox2" class="styled" type="checkbox" checked>
							<label for="checkbox2"> Primary </label>
						</div>
						<div class="checkbox checkbox-success">
							<input name="RememberMe" type="hidden" value="false"> <input
								class="styled" data-val="true"
								data-val-required="Требуется поле Remember me?." id="RememberMe"
								name="RememberMe" type="checkbox" value="true"> <label
								for="RememberMe"> Success2 </label>
						</div>
						<div class="checkbox checkbox-success">
							<input id="checkbox3" class="styled" type="checkbox"> <label
								for="checkbox3"> Success </label>
						</div>
						<div class="checkbox checkbox-info">
							<input id="checkbox4" class="styled" type="checkbox"> <label
								for="checkbox4"> Info </label>
						</div>
						<div class="checkbox checkbox-warning">
							<input id="checkbox5" type="checkbox" class="styled" checked>
							<label for="checkbox5"> Warning </label>
						</div>
						<div class="checkbox checkbox-danger">
							<input id="checkbox6" type="checkbox" class="styled" checked>
							<label for="checkbox6"> Check me out </label>
						</div>
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