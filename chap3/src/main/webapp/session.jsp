<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
List<String> lists = new ArrayList<String>();
lists.add("조수진");
lists.add("송수미");
lists.add("최사랑");
session.setAttribute("lists", lists);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>session 영역</h2>
	
	<%
	List<String> lists2 = (List<String>)session.getAttribute("lists");
	for(String str : lists2) {
		out.print("str : " + str + "<br />");
	}
	%>
	
	<a href="session2.jsp">페이지 이동 후 session 영역 조회</a>
</body>
</html>