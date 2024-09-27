
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
	<h2>쿼리 연습</h2>
	<%
	try {
		JDBConnect jdbc = new JDBConnect();
		String sql = "SELECT * FROM tbl_member";
		PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()) {
	%>
		<table border="1">
			<tr>			
				<td> <%= rs.getString(1) %> </td>
				<td> <%= rs.getString(2) %> </td>
				<td> <%= rs.getString(3) %> </td>
				<td> <%= rs.getString(4) %> </td>
				<td> <%= rs.getString(5) %> </td>
				<td> <%= rs.getString(6) %> </td>
				<td> <%= rs.getString(7) %> </td>
				<td> <%= rs.getString(8) %> </td>
				<td> <%= rs.getString(9) %> </td>
				<td> <%= rs.getString(10) %> </td>
				<td> <%= rs.getString(11) %> </td>
				<td> <%= rs.getString(12) %> </td>
				<td> <%= rs.getString(13) %> </td>
			</tr>
		</table>
		<br/>
	<%
	}
	
	out.print(rs);
	}	catch(Exception e) {
		out.print(e.getMessage());
	}
	%>
</body>
</html>