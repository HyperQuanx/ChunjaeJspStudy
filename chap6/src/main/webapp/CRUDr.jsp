<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="fullstack7.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
</head>
<body>
<%
String memberId = request.getParameter("id");
MemberDTO dto = null;

try {
    MemberDAO dao = new MemberDAO();
     dto = dao.getMember(memberId);

    if (dto != null) {
%>
    <div>ID : <%= dto.getMemberId() %></div>
    <div>이름 : <%= dto.getName() %></div>
    <div>PW : <%= dto.getPwd() %></div>
    <div>Birth : <%= dto.getBirthday() %></div>
<%
    } else {
%>
    <div>회원 정보를 찾을 수 없습니다.</div>
<%
    }
} catch (Exception e) {
    e.printStackTrace();
%>
    <div>오류 발생: <%= e.getMessage() %></div>
<%
}
%>
	<div>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>PW</th>
				<th>Birth</th>
			</tr>
			<tr>
				<td><%= dto != null ? dto.getMemberId() : "" %></td>
				<td><%= dto != null ? dto.getName() : "" %></td>
				<td><%= dto != null ? dto.getPwd() : "" %></td>
				<td><%= dto != null ? dto.getBirthday() : "" %></td>
			</tr>
		</table>
	</div>
</body>
</html>
