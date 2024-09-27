<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="dto.StudentDTO" %>
<%!
boolean rtnCheck(Object param, String rtnType) {

	
	return (param != null ? true : false);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>page 영역 속성값 처리</h2>
	
	
	<%
// 	String no1 = "";
// 	String name1 = "";
// 	int age1 = 0;
// 	String dept1 = "";
// 	int grade1 = 0;
// 	StudentDTO pageStudent1;
	
// 	if (pageContext.getAttribute("pageStNo") != null) {		
// 		no1 = (String)pageContext.getAttribute("pageStNo");
// 	}
// 	if (pageContext.getAttribute("pageStName") != null) {		
// 		name1 = (String)pageContext.getAttribute("pageStName");
// 	}
// 	if (pageContext.getAttribute("pageStAge") != null) {		
// 		age1 = (Integer)pageContext.getAttribute("pageStAge");
// 	}
// 	if (pageContext.getAttribute("pageStDept") != null) {		
// 		dept1 = (String)pageContext.getAttribute("pageStDept");
// 	}
// 	if (pageContext.getAttribute("pageStGrade") != null) {		
// 		grade1 = (Integer)pageContext.getAttribute("pageStGrade");
// 	}
// 	if (pageContext.getAttribute("pageStudent") != null) {
// 		pageStudent1 = (StudentDTO)pageContext.getAttribute("pageStudent");
// 	}
		Object no1 = (String)pageContext.getAttribute("pageStNo");
		Object name1 = (String)pageContext.getAttribute("pageStName");
		Object age1 = (Integer)pageContext.getAttribute("pageStAge");
		Object dept1 = (String)pageContext.getAttribute("pageStDept");
		Object grade1 = (Integer)pageContext.getAttribute("pageStGrade");
		Object pageStudent1 = (StudentDTO)pageContext.getAttribute("pageStudent");
	%>
	
	<ul>
		<li>1. : <%= (rtnCheck(no1, "int") ? no1 : "") %></li>
		<li>2. : <%= (rtnCheck(name1, "int") ? name1 : "") %></li>
		<li>3. : <%= (rtnCheck(age1, "int") ? age1 : "") %></li>
		<li>4. : <%= (rtnCheck(dept1, "int") ? dept1 : "") %></li>
		<li>5. : <%= (rtnCheck(grade1, "int") ? grade1 : "") %></li>
		<li>학생 정보 : 
			<%
			if (pageStudent1 != null) {
				StudentDTO pageStudent5 = (StudentDTO)pageStudent1;
			%>
			<ul>
				<li>1. : <%= pageStudent5.getNo() %></li>
				<li>2. : <%= pageStudent5.getName() %></li>
				<li>3. : <%= pageStudent5.getAge() %></li>
				<li>4. : <%= pageStudent5.getDept() %></li>
				<li>5. : <%= pageStudent5.getGrade() %></li>
			</ul>
			<%} %>
		</li>
	</ul>
	
	
	<h2>page 영역의 속성값 읽기</h2>
	
	<%@ include file="page_include.jsp" %>
	
	<h2>페이지 이동 후 page 영역 값 조회</h2>
	
	<a href="pageContext.jsp">이동하기</a>
</body>
</html>