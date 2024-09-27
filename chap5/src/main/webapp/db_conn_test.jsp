<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="common.JDBConnect" %>
<%@ page import="common.DBConnPool" %> <!-- DBConnPool 클래스 임포트 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>JDBC 테스트1</h2>
	<%
	JDBConnect jdbc1;
	try {
		jdbc1 = new JDBConnect();
		out.print("=========================<br>");
		out.print("DB 접속 성공(기본생성자)<br>");
		out.print("jdbc1 : " + jdbc1 + "<br>");
		out.print("=========================<br>");
		jdbc1.close();
	} catch(Exception e) {
		out.print("=========================<br>");
		out.print("DB 접속 에러(기본생성자)<br>");
		out.print("에러메세지 : " + e.getMessage() + "<br>");
		out.print("=========================<br>");
	}
	%>
	
	<h2>JDBC 테스트2</h2>
	<%
	String driver = application.getInitParameter("MariaDriver");
	String url = application.getInitParameter("MariaURL");
	String id = application.getInitParameter("dbId");
	String pwd = application.getInitParameter("dbPwd");
	JDBConnect jdbc2;
	try {
		jdbc2 = new JDBConnect(driver, url, id, pwd);
		out.print("=========================<br>");
		out.print("DB 접속 성공(매개변수 생성자)<br>");
		out.print("jdbc2 : " + jdbc2 + "<br>");
		out.print("=========================<br>");
		jdbc2.close();
	} catch(Exception e) {
		out.print("=========================<br>");
		out.print("DB 접속 에러(매개변수 생성자)<br>");
		out.print("에러메세지 : " + e.getMessage() + "<br>");
		out.print("=========================<br>");
	}
	%>

	<h2>JDBC 테스트3</h2>
	<%
	JDBConnect jdbc3;
	try {
		jdbc3 = new JDBConnect(application);
		out.print("=========================<br>");
		out.print("DB 접속 성공(매개변수 생성자)<br>");
		out.print("jdbc3 : " + jdbc3 + "<br>");
		out.print("=========================<br>");
		jdbc3.close();
	} catch(Exception e) {
		out.print("=========================<br>");
		out.print("DB 접속 에러(매개변수 생성자)<br>");
		out.print("에러메세지 : " + e.getMessage() + "<br>");
		out.print("=========================<br>");
	}
	%>

	<!-- 추가된 DBConnPool을 사용한 테스트 -->
	<h2>JDBC 테스트4 (DBConnPool 사용)</h2>
	<%
	DBConnPool pool;
	try {
		pool = new DBConnPool();  // DBConnPool을 사용해 DB 연결
		out.print("=========================<br>");
		out.print("DB 접속 성공(DBConnPool)<br>");
		out.print("pool : " + pool + "<br>");
		out.print("=========================<br>");
		pool.close();  // 연결 종료
	} catch (Exception e) {
		out.print("=========================<br>");
		out.print("DB 접속 에러(DBConnPool)<br>");
		out.print("에러메세지 : " + e.getMessage() + "<br>");
		out.print("=========================<br>");
	}
	%>

</body>
</html>
