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
	%>
		<script> alert('회원가입 실패'); window.history.back(); </script>
	<%
	} else {
	%>
		<script> alert('회원가입 성공'); window.history.back(-2); </script>
	<%
	}
	%>
</body>