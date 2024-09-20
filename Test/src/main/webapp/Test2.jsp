<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<%
	Date today = new Date();
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	String today2 = dateFormat.format(today);
	out.println("오늘 날짜 : " + today + "<br>");
	out.println("오늘 날짜 : " + today2);
	%>
	
	
	<p>오늘 날짜 : <span id="today1"></span></p>
	<script>
		let now = new Date();
		let year = now.getFullYear();
		let month = now.getMonth() + 1;
		let day = now.getDate();
		document.querySelector("#today1").textContent = String(year) + "년 " + String(month) + "월 " + String(day) + "일";
		
	</script>
</body>
</html>