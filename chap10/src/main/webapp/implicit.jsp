<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>

<%
pageContext.setAttribute("param1", "page 영역");
request.setAttribute("param1", "request 영역");
session.setAttribute("param1", "session 영역");
application.setAttribute("param1", "application 영역");
%>

<h2>표현 언어(EL) - 내장 객체</h2>

<ul>
	<li>page 영역 : ${pageScope.param1}</li>
	<li>request 영역 : ${requestScope.param1}</li>
	<li>session 영역 : ${sessionScope.param1}</li>
	<li>application 영역 : ${applicationScope.param1}</li>
</ul>

<hr>

<h3>영역 지정 없이 속성 값 조회</h3>
<!-- 영역 지정 없이 속성 값을 조회하면 크기가 작은 순서대로 출력됨. -->
<ul>
	<li>${param1}</li>
</ul>

<jsp:forward page="inc_forward.jsp" />

</body>
</html>