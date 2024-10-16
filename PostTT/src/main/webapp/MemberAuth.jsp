<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<p>
        <strong>${ authMessage }</strong>
        <br />        
        <a href="./MemberAuth.mvc?id=admin&pwd=1234">회원인증(관리자)</a>
        <br />
        <a href="./MemberAuth.mvc?id=user1&pwd=1234">회원인증(회원)</a>
        <br />
        <a href="./MemberAuth.mvc?id=guest&pwd=1234">회원인증(비회원)</a>
        <br />
        <a href="signIn.jsp">로그인</a>
    </p>
</body>
</html>