<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@page import="fullstack7.member.MemberDAO"%>
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
	        MemberDAO dao = new MemberDAO();
	        List<MemberDTO> memList = dao.getMemberList();
	        
	        for (MemberDTO mem : memList) {
	            %>
	            <tr>
	                <td><%= mem.getMemberId() %></td>
	                <td><%= mem.getName() %></td>
	                <td><%= mem.getPwd() %></td>
	                <td><%= mem.getRegDate() %></td>
	            </tr>
	            <%
	        }
	        %>	
			<tr>
				<td colspan="4">페이지영역 &lt;1&rt; &lt;2&rt; &lt;3&rt;</td>
			</tr>
		</tbody>
	</table>
</body>
</html>