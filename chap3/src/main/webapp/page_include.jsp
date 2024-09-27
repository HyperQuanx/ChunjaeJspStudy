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
	<%
	pageContext.setAttribute("pageStNo", "20240101");
	pageContext.setAttribute("pageStName", "홍길동");
	pageContext.setAttribute("pageStAge", 20);
	pageContext.setAttribute("pageStDept", "전자공학");
	pageContext.setAttribute("pageStGrade", 1);
	pageContext.setAttribute("pageStudent", new StudentDTO("20240101", "홍길순", 20, "화공과", 1));
	%>
	<%
	String no3 = (String)pageContext.getAttribute("pageStNo"); // or .toString()
	String name3 = (String)pageContext.getAttribute("pageStName"); // or .toString()
	int age3 = (Integer)pageContext.getAttribute("pageStAge");
	String dept3 = (String)pageContext.getAttribute("pageStDept"); // or .toString()
	int grade3 = (Integer)pageContext.getAttribute("pageStGrade");
	StudentDTO pageStudent3 = (StudentDTO)pageContext.getAttribute("pageStudent");
	%>
	
	
	<ul>
		<li>1. : <%= no3 %></li>
		<li>2. : <%= name3 %></li>
		<li>3. : <%= age3 %></li>
		<li>4. : <%= dept3 %></li>
		<li>5. : <%= grade3 %></li>
		<li>
			<ul>
				<li><%= pageStudent3.getNo() %></li>
				<li><%= pageStudent3.getName() %></li>
				<li><%= pageStudent3.getAge() %></li>
				<li><%= pageStudent3.getDept() %></li>
				<li><%= pageStudent3.getGrade() %></li>
			</ul>
		</li>
	</ul>
	
</body>
</html>