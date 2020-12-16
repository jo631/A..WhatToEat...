<head>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.RestaurantRepository"%>
<%@ page import="dto.Member"%>
</head>

<body>
	<%
	RestaurantRepository dao = RestaurantRepository.getInstance();
	String id = request.getParameter("userID");
	String pw = request.getParameter("userPassword");
	
	Member m = dao.loginUser(id, pw);

	if (m == null) {
		//로그인 실패할 때 액션 추가해야됨
		response.sendRedirect("login.jsp");
	} else {
		//성공할때 액션 추가해야됨
		session.setAttribute("name",m.getName());
		response.sendRedirect("main.jsp");
	}
	%>
</body>