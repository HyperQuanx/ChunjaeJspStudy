<%@page import="java.util.Collection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	long add_date = sf.parse(request.getParameter("add_date")).getTime();
	int add_int = Integer.parseInt(request.getParameter("add_int"));
	String name = request.getParameter("name");
	
	response.addDateHeader("birth_day", add_date);
	response.addIntHeader("no", add_int);
	response.addHeader("name", name);
	response.setHeader("name", "하니");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>응답 헤더 조회</h2>
	<ul>
	<%
	Collection<String> hNames = response.getHeaderNames();
	
	for(String hN : hNames) {
		String hValue = response.getHeader(hN);
		out.println("<li>" + hN + " : " + hValue + "</li>");
	}
	%>
	</ul>
	
	<h2>여러 개 추가된 헤더 값 출력</h2>
	<%
	Collection<String> hNos = response.getHeaders("no");
	for(String hN : hNos) {
		out.println("<li>no : " + hN + "</li>");
	}
	%>
	<script>
	let a = 
	</script>
</body>
</html>