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
	%>
		<script> alert('로그인 실패'); window.history.back(); </script>
	<%
	} else {
		//성공할때 액션 추가해야됨
		session.setAttribute("name",m.getName());
	%>
		<script> alert('로그인 성공'); window.history.back(-2); </script>
	<%
	}
	%>
</body>