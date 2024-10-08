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
	<h2>redirect 연습</h2>
		<br />
		<c:set var="req" value="보낸 값 2" scope="request" />
		<c:redirect url="ImportRain.jsp">
			<c:param name="par1" value="파라미터11" />
			<c:param name="par2" value="파라미터22" />
		</c:redirect>
</body>
</html>