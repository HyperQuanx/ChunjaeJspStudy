<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.*, java.lang.reflect.Method" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>2. 클라이언트 요청 매개변수 조회</h2>
	<ul>
		<li>아이디 : <%=request.getParameter("user_id2") %></li>
		<li>비밀번호 : <%=request.getParameter("pwd2") %></li>
		<li>주소1 : <%=request.getParameter("addr1") %></li>
		<li>상세주소 : <%=request.getParameter("addr2") %></li>
		<li>좋아하는 스포츠 : <%=request.getParameter("favorite") %></li>
		<li>관심사항 : <%= request.getParameterValues("interest") != null ? Arrays.toString(request.getParameterValues("interest")) : "선택된 관심사항이 없습니다" %></li>
		<li>소개 : <%=request.getParameter("introduce") %></li>
	</ul>
	<h2>3. Request 객체의 메서드명 출력</h2>
	<ul>
		<%
		// request 객체의 클래스를 가져와 메서드 목록 출력
		Class<?> reqClass = request.getClass();
		Method[] arrMethods = reqClass.getMethods();
		for (Method m : arrMethods) {
			// 메서드명을 출력
			out.println("<li>메서드명 : " + m.getName() + "</li>");
		}
		%>
	</ul>
</body>
</html>
