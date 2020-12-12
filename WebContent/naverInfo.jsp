<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>네이버 지도</title>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>
	<%
	
	int id = Integer.parseInt(request.getParameter("id"));
	RestaurantRepository dao = RestaurantRepository.getInstance();
	Restaurant restaurant = dao.getById(id);
	
	request.setCharacterEncoding("utf-8");
	String name = restaurant.getName();
	String street = restaurant.getStreetName();
	
	String url = URLEncoder.encode(street+" "+name,java.nio.charset.StandardCharsets.UTF_8.toString());
	response.sendRedirect("http://map.naver.com/?query="+url);
	%>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>