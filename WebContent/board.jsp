<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<!-- Navigation -->
	<jsp:include page="nav.jsp"></jsp:include>

	<div style="display: flex; justify-content: center; align-items: center; padding: 0 300px;">
	
		<table class="table-dark table-striped table-hover" style="width: 100%; ">
			<thead class="table-dark">
				<tr>
					<th scope="col" class="table-dark">사진</th>
					<th class="table-dark">닉네임</th>
					<th class="table-dark">리뷰</th>
					<th class="table-dark">상세페이지</th>
				</tr>
			</thead>		
			<tr class="table-info">
				<td class="table-info text-dark">
					<img
				     	style="width: 150px; height: 150px;"
					 	src="https://firebasestorage.googleapis.com/v0/b/react-firebase-image-fd030.appspot.com/o/image%2F1.jpeg?alt=media&token=8872cb14-abd9-4340-8cdf-55f1cacc421f" />
				</td>
				<th style="font-size:20px;" class="table-info text-dark">닉네임이 오는 곳</th>
				<td class="table-info text-dark">리뷰내용이 오는곳 </td>
				<td class="table-info text-dark">
					<button onclick="alert(test);" class="btn btn-primary">상세페이지</button>
				</td>
			</tr>
		</table>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 