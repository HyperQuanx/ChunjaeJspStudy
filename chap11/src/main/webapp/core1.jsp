<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>

<c:set var="num1" value="10" />
<c:set var="num2" value="${ num1 mod 5 }" />
<c:set var="date1" value="<%= new Date() %>" />
<c:set var="str1">문자열 값 지정</c:set>
<%!
// ↑ 이거와 같다.
// int num1 = 10;
%>

<h3>EL 을 이용하여 출력</h3>
<ul>
	<li>num1 : ${ pageScope.num1 }</li>
	<li>num2 : ${ num2 }</li>
	<li>date1 : ${ date1 }</li>
	<li>str1 : ${ str1 }</li>
</ul>

<h3>자바 객체(자바빈즈) 사용</h3>
</body>
</html>