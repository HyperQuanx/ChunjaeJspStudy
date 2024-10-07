<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>표현 언어(EL) - 객체 매개변수</h2>
	<%
	request.setAttribute("stringObj", "문자열");
	request.setAttribute("integerObj", Integer.valueOf(100));
	%>
	<jsp:forward page="objectForward_ok.jsp" >
		<jsp:param value="10" name="firstNum" />
		<jsp:param value="20" name="secondNum" />
	</jsp:forward>
</body>
</html>