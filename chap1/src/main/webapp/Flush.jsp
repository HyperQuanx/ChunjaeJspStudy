<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page buffer="1kb" autoFlush="true" %>
<!-- ↑거의 사용할 일 없다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>page 지시어 - butter, autoFlush 속성</h2>
	<%
	for (int i = 1; i <= 1000; i++) {
		out.println("1234567890");
	}
	%>
</body>
</html>