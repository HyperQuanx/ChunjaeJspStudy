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
	int sts - response.getStatus();
	
	if (sts == 400) {
		out.print("404 에러 발생");
		out.print("<br /> 파일 경로를 확인해주세요.");
	}
	%>
</body>
</html>