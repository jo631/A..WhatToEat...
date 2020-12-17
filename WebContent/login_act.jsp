<%@page import="dao.SHA256"%>
<head>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.RestaurantRepository"%>
<%@ page import="dto.Member"%>
</head>

<body>
	<%
	RestaurantRepository dao = RestaurantRepository.getInstance();
	String id = request.getParameter("userID");
	String rawpw = request.getParameter("userPassword");
	String pw = SHA256.cvt(rawpw);
	
	Member m = dao.loginUser(id, pw);

	if (m == null) {
	%>
		<script> alert('로그인 실패'); window.history.back(); </script>
	<%
	} else {
		//성공할때 액션 추가해야됨
		session.setAttribute("name",m.getName());
		session.setAttribute("num", m.getNum());
	%>
		<script> alert('로그인 성공'); window.history.go(-2); </script>
	<%
	}
	%>
</body>