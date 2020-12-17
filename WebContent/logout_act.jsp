<head>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dao.RestaurantRepository"%>
<%@ page import="dto.Member"%>
</head>

<body>
<% 	
	if(session.getAttribute("name") != null){
		//로그아웃 성공했을떄
		session.setAttribute("name",null);
%>
		<script> alert('로그아웃 되었습니다.'); window.history.back(); </script>
<%
	} else{
		//세션이 없을떄(로그인이 안되어있을떄)
		%>			
		<script> alert('로그인이 되어있지 않습니다'); window.history.back(); </script>
		<%
	}
%>	
</body>