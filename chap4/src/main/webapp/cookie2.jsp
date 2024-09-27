<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>

<%! 
    public Cookie setCok(String name, String value) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(3600);
        return cookie;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<h2>1. 쿠키(Cookie) 설정</h2>
	<%
	Cookie newCookie = setCok("username", "qwer");
    
	%>
	<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
	<%
	Cookie[] cookies = request.getCookies(); // 요청 헤더의 모든 쿠키 얻기
	%>
	
	<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
	<a href="cookieResult.jsp">
		다음 페이지에서 쿠키값 확인하기
	</a>
</body>
</html>