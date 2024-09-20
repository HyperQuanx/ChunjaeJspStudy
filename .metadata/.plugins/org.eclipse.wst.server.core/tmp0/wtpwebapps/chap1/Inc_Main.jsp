<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ include file="IncPage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>include 지시어</h2>
	
	<%
	out.println("오늘 날짜 : " + today);
	out.println("<br>");
	out.println("내일 시간 : " + tomorrow);
	%>
</body>
</html>