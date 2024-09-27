<%@page import="dto.StudentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>request forward 로 전달된 페이지</h2>
	
	<%
	Object req1 = request.getAttribute("req1");
	Object reqStudent = pageContext.getAttribute("reqStudent");
	%>
	
	
	<ul>
		<li><%=(req1 != null ? req1.toString() : "") %></li>
		<li>학생정보 : 
		<%
		if (reqStudent != null) {
			StudentDTO pageStudent2 = (StudentDTO)reqStudent;
		%>
		<ul>
			<li><%= pageStudent2.getNo() %></li>
			<li><%= pageStudent2.getName() %></li>
			<li><%= pageStudent2.getAge() %></li>
			<li><%= pageStudent2.getDept() %></li>
			<li><%= pageStudent2.getGrade() %></li>
		</ul>
		<%} %>
		</li>
	</ul>
	
	<%
	if (reqType.equalsIgnoreCase("send")) {
		response.sendRedirect("req2.jsp?user_id=user1&pwd=1234");
	} else if(reqType != null && reqType.equalsIgnoreCase("req")) {
	request.getRequestDispatcher("req2.jsp?user_id=user1&pwd=1234").forward(request, response);
	}
	%>
	
	
</body>
</html>