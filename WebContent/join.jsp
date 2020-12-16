<head>
<%@ page contentType="text/html; charset=utf-8"%>
<!-- Bootstrap core CSS -->
<link href="vendor/css/blog-home.css" rel="stylesheet">
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>

	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>

	<div class="container">
		<div class="col-lg-10"></div>
		<div class="col-lg-10">
			<div class="jumbotron" style="padding-top: 10px;">
				<form method="post" action="join_act.jsp">
					<h3 style="text-align: center;">회원가입</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID"
							name="userID" maxlength="20">
					</div>
					<!-- id 창 만들기 form-control을 사용하므로 Bootstrap 자체만의 스타일로 컨트롤이 표시됨 -->
					<div class="form-group">
						<input type="password" class="form-control" placeholder="비밀번호"
							name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<!-- 입력 항목의 그룹화 -->
						<input type="text" class="form-control" placeholder="이름"
							name="userName" maxlength="20">
					</div>

					<input type="submit" class="btn btn-warning form-control"
						value="회원가입">
				</form>
			</div>
		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>