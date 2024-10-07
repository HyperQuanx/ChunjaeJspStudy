<%@page import="net.fullstack7.common.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<%
CookieManager.addCookie(response, "Hi", "ㅎㅇ", 20);
%>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>

<h3>쿠키값 읽기</h3>
<p>ELCookie값 : ${ cookie.Hi.value }</p>

<h3>HTTP 헤더 읽기</h3>
<ul>
	<li>host : ${ header.host }</li>
	<li>user-agent : ${header['user-agent'] }</li>
	<li>cookie : ${ header.cookie }</li>
</ul>

<h3>컨텍스트 초기화 매개변수 읽기</h3>
<p>OracleDriver : ${ initParam.OracleDriver }</p>

<h3>컨텍스트 루트 경로 읽기</h3>
<p>${ pageContext.request.contextPath }</p>

</body>
</html>