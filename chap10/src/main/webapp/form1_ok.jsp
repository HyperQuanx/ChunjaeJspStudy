<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>

<h2>EL - form 값 처리</h2>

<%
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String school = request.getParameter("school");
String[] hobby = request.getParameterValues("hobby");
%>

<h3>기존 처리 방법</h3>
<ul>
	<li>이름 : <%= name %></li>
	<li>성별 : <%= gender %></li>
	<li>학력 : <%= school %></li>
	<li>
	취미 : <% for(String a : hobby) {
		out.println(a);
	}%>
	</li>
</ul>

<h3>EL 처리 방법</h3>
<ul>
	<li>이름 : ${param.name}</li>
	<li>성별 : ${param.gender}</li>
	<li>학력 : ${param.school}</li>
	<li>취미 : 
	${paramValues.hobby[0]}&nbsp;${paramValues.hobby[1]}&nbsp;${paramValues.hobby[2]}&nbsp;${paramValues.hobby[3]}
	</li>
</ul>

<button onclick="history.back()">돌아가기</button>


</body>
</html>