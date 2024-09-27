<%@page import="fullstack7.member.MemberDAO"%>
<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<div>
	<table border="1">
	    <thead>
	        <tr>
	            <th>id</th>
	            <th>na</th>
	            <th>pw</th>
	            <th>jm</th>
	            <th>add1</th>
	            <th>add2</th>
	            <th>bd</th>
	            <th>jc</th>
	            <th>ma</th>
	            <th>ms</th>
	            <th>rd</th>
	            <th>ld</th>
	            <th>pd</th>
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
	                <td><%= mem.getJumin() %></td>
	                <td><%= mem.getAddr1() %></td>
	                <td><%= mem.getAddr2() %></td>
	                <td><%= mem.getBirthday() %></td>
	                <td><%= mem.getJobCode() %></td>
	                <td><%= mem.getMileage() %></td>
	                <td><%= mem.getMemberState() %></td>
	                <td><%= mem.getRegDate() %></td>
	                <td><%= mem.getLeaveDate() %></td>
	                <td><%= mem.getPwdChangeDate() %></td>
	            </tr>
	            <%
	        }
	        %>
	    </tbody>
	</table>
</div>

</body>
</html>