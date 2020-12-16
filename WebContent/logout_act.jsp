<head>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.RestaurantRepository"%>
<%@ page import="dto.Member"%>
</head>

<body>
<% 
	session.setAttribute("name",null);
	response.sendRedirect("main.jsp");
%>	
</body>