<%@page import="dto.Comment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.RestaurantRepository"%>
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
	
	<%
		RestaurantRepository dao = RestaurantRepository.getInstance();
		
		ArrayList<Comment> comments = dao.reviewAllSearch();
	%>
	
	<div style="display: flex; justify-content: center; align-items: center; padding: 0 300px;">
		<table class="table" style="width: 100%">
			<thead class="table-dark">
				<tr>
					<th></th>
					<th class="table-dark">닉네임</th>
					<th class="table-dark" style="width: 400px">리뷰</th>
					<th class="table-dark" style="text-align: center;">상세페이지</th>
				</tr>
			</thead>		
			<%for (Comment c : comments) { %>
			<tr class="table-info table-striped">
				<td></td>
				<th style="font-size:20px;" class="table-info text-dark"><%=c.getUsername() %></th>
				<td class="table-info text-dark"><%=c.getComment() %> </td>
				<td class="table-info text-dark" style="text-align: center;">
					<button onclick="location='detail.jsp?id=<%=c.getResNum()%>'" class="btn btn-primary">상세페이지</button>
				</td>
			</tr>
			<%} %>
		</table>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 