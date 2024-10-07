<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>

<h2>표현 언어(EL) - 내장 객체</h2>
<h3>액션 태그 - forward</h3>

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

</body>
</html>