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
	String param1 = "부모에서 설정한 변수1";
	String param2 = "부모에서 설정한 변수2";
	String param3 = "부모에서 설정한 변수3";
	
	pageContext.setAttribute("param1", param1);
	request.setAttribute("param1", param1);
	%>
	
	<h2>액션 태그의 포워딩</h2>
	
	<jsp:forward page="forward2.jsp?param2=<%=param2 %>">
		<jsp:param value="<%=param3 %>" name="param3"/>
	</jsp:forward>
</body>
</html>