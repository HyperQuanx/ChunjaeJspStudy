<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page errorPage="errPage2.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>page 지시어 - errorPage, isErrorPage 속성</h2>
	
	<%
	try{
		int age = Integer.parseInt(request.getParameter("age")) + 10;
		out.println("현재 나이는 " + age + "입니다.");
	} catch (Exception e) {
		e.getStackTrace();
		out.println(e.getMessage() + "<br>" + e.getClass().getName());
	}
	%>
</body>
</html>