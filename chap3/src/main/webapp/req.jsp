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
	<h2>request 영역</h2>
	<%
	String reqType = 
	%>
	<%
	request.setAttribute("req1", "request 영역");
	request.setAttribute("reqStudent", new StudentDTO("20240102", "홍길순", 20, "화공과", 1));
	%>
	
	<%
	request.removeAttribute("req1");
	request.removeAttribute("req2");
	%>
	
	<h2>request 영역 속성값 조회</h2>
	<%
	Object req1 = request.getAttribute("req1");
	Object reqStudent = pageContext.getAttribute("reqStudent");
	%>
	
	
	
	<ul>
		<li>req 문자열 정보 : <%=(req1 != null ? req1.toString() : "") %></li>
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
		
		</li>
	</ul>
	
	
</body>
</html>