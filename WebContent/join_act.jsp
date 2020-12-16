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
	String name = request.getParameter("userName");

	Member m = new Member(id, pw, name);

	if (dao.JoinUser(m) == -1) {
		//회원가입 실패할떄 액션 추가해야됨
		response.sendRedirect("join.jsp");
	} else {
		//성공할때 액션 추가해야됨
		response.sendRedirect("main.jsp");
	}
	%>
</body>