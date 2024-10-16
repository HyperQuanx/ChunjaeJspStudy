<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
	<%
	    session.removeAttribute("UserName");
	    session.invalidate();
	%>
	<script>
	    alert("로그아웃 되었습니다.");
	    window.location.href = "list.jsp";
	</script>
</body>
</html>