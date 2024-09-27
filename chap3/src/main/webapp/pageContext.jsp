<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>page 영역 속성값 처리</h2>
	
	<%
	pageContext.setAttribute("pageStNo", "20240101");
	pageContext.setAttribute("pageStName", "홍길동");
	pageContext.setAttribute("pageStAge", 20);
	pageContext.setAttribute("pageStDept", "전자공학");
	pageContext.setAttribute("pageStGrade", 1);
	pageContext.setAttribute("pageStudent", new StudentDTO("20240101", "홍길순", 20, "화공과", 1));
	%>
	
	<%
	String no2 = (String)pageContext.getAttribute("pageStNo"); // or .toString()
	String name2 = (String)pageContext.getAttribute("pageStName"); // or .toString()
	int age2 = (Integer)pageContext.getAttribute("pageStAge");
	String dept2 = (String)pageContext.getAttribute("pageStDept"); // or .toString()
	int grade2 = (Integer)pageContext.getAttribute("pageStGrade");
	StudentDTO pageStudent2 = (StudentDTO)pageContext.getAttribute("pageStudent");
	%>
	
	<ul>
		<li>1. : <%= no2 %></li>
		<li>2. : <%= name2 %></li>
		<li>3. : <%= age2 %></li>
		<li>4. : <%= dept2 %></li>
		<li>5. : <%= grade2 %></li>
	</ul>
	
	
	<h2>page 영역의 속성값 읽기</h2>
	
	<%@ include file="page_include.jsp" %>
	
	<h2>페이지 이동 후 page 영역 값 조회</h2>
	
	<a href="pageContext2.jsp">이동하기</a>
</body>
</html>