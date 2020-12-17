<%@page import="dao.SHA256"%>
<head>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.RestaurantRepository"%>
<%@ page import="dto.Member"%>
</head>

<body>
	<%
	RestaurantRepository dao = RestaurantRepository.getInstance();
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("userID");
	String rawpw = request.getParameter("userPassword");
	String pw = SHA256.cvt(rawpw);
	String name = request.getParameter("userName");

	Member m = new Member(id, pw, name);

	if (dao.JoinUser(m) == -1) {
	%>
		<script> alert('회원가입 실패'); window.history.back(); </script>
	<%
	} else {
	%>
		<script> alert('회원가입 성공'); window.history.go(-2); </script>
	<%
	}
	%>
</body>