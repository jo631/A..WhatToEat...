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
		<table class="table-dark table-striped table-hover" style="width: 100%; ">
			<thead class="table-dark">
				<tr>
					<th class="table-dark">닉네임</th>
					<th class="table-dark">리뷰</th>
					<th class="table-dark">상세페이지</th>
				</tr>
			</thead>		
			<%for (Comment c : comments) { %>
			<tr class="table-info">
				<th style="font-size:20px;" class="table-info text-dark"><%=c.getUsername() %></th>
				<td class="table-info text-dark"><%=c.getComment() %> </td>
				<td class="table-info text-dark">
					<button onclick="location='detail.jsp?id=<%=c.getResNum()%>'" class="btn btn-primary">상세페이지</button>
				</td>
			</tr>
			<%} %>
		</table>
	</div>


	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> 