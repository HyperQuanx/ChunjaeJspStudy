<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>out 객체 사용</h2>
	<%
	// 버퍼 내용 삭제
	out.println("출력되지 않는 텍스트");
	out.clearBuffer();
	
	out.print("<h2>out 내장 객체</h2>");
	
	// 버퍼의 크기
	out.print("출력 버퍼 크기 : " + out.getBufferSize() + "<br />");
	out.print("남은 버퍼 크기 : " + out.getRemaining() + "<br />");
	
	// 버퍼의 내용을 출력 스트림으로 전달
	out.flush();
	out.println("flush 후 버퍼 크기 : " + out.getRemaining() + "<br />");
	%>
</body>
</html>