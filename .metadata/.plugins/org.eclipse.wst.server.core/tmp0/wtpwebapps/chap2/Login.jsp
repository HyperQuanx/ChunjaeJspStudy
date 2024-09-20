<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>로그인</h2>
	<form name="frmLogin" method="post" action="login_ok.jsp">
		<span for=user_id>아이디 : </span>
		<input type="text" name="user_id" id="user_id" value="user1" />
		<br/>
		<span for=user_id>비밀번호 : </span>
		<input type="password" name="pwd" id="pwd" value="1234" />
	</form>
</body>
</html>