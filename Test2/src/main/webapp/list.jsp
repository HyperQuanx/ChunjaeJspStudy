<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 회원 조회</h2>
<%
String sql = "SELECT memberId, name, pwd FROM tbl_member";
JDBConnect jdbc = new JDBConnect();
PreparedStatement pstm = jdbc.con.prepareStatement(sql);
ResultSet rs = pstm.executeQuery() ;

String name ="";
String id ="";
String pwd ="";
if(rs != null){
	while(rs.next()){
		name = rs.getString(1);
		id = rs.getString(2);
		pwd = rs.getString(3);
		out.println(String.format("%s, %s, %s", id, name, pwd));
	}
	
	jdbc.close();
}


%>
</body>
</html>