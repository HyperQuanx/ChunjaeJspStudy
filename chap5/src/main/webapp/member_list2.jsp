<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
<style>
table, thead, tbody, th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>

</head>
<body>
	<h2>회원 목록 조회(statement)</h2>
	

	<%
	JDBConnect jdbc = new JDBConnect();
	String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member";
	Statement stmt = jdbc.con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	%>
	
	<table>
		<thead>
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>비밀번호</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<%
			while (rs.next()) {
			%>
			<tr>
				<td><%= rs.getString(1) %></td>
				<td><%= rs.getString(2) %></td>
				<td><%= rs.getString(3) %></td>
				<td><%= rs.getString(4) %></td>
			</tr>
			<%
			}
			%>	
			<tr>
				<td colspan="4">페이지영역 &lt;1&rt; &lt;2&rt; &lt;3&rt;</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" id="btnRegist" value="회원등록"/>
					<input type="button" id="btnDelete" value="회원삭제"/>
				</td>
			</tr>
		</tbody>
	</table>
	
	
	<script>
		const btnRegist = document.querySelector("#btnRegist");
		btnRegist.addEventListener("click", () => {
			location.href="member_regist.jsp"
		})
	</script>
</body>
</html>