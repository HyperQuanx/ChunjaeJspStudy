<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	
	<h2>include 액션 태그</h2>
	
	<%
	String param1 = "부모에서 선언";
	%>
	
	<h3>include 지시어로 포함</h3>
	<%@ include file="includeAction3.jsp" %>
	<p>지시어 자식 페이지에서 선언한 변수 : <%= param2 %> </p>
	<hr />
	
	<h3>include 액션태그로 포함</h3>
	<%	
	String pageUrl = "includeAction2.jsp";
	%>
	
	<jsp:include page="includeAction2.jsp" />
	<jsp:include page= "<%= pageUrl %>" />
	
	<p>액션태그 자식 페이지에서 선언한 변수 : <%= param2 %> </p>
</body>
</html>