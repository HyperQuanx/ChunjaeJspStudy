<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>로그인 처리</h2>
	<%
	String user_id = request.getParameter("user_id");
	String pwd = request.getParameter("pwd");
	if (user_id.equals("user1") && pwd.equalsIgnoreCase("1234")){
		response.sendRedirect("이동할 URL");
	}
	else {
		request.getRequestDispatcher("에러처리URL").forward(request, response);
	}
	%>
</body>
</html>