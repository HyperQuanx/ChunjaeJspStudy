<%@page import="fullstack7.member.MemberDTO"%>
<%@page import="fullstack7.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
<%
    String memberId = request.getParameter("id");
    String message = "";

    try {
        MemberDAO dao = new MemberDAO();
        MemberDTO dto = dao.setMemberDelete(memberId);
        message = "성공 ㅠ";
    } catch(Exception e) {
        message = "실패 ㅠ : " + e.getMessage();
    }
%>
    <script>
        alert("<%= message %>");
        <% if ("성공 ㅠ".equals(message)) { %>
            window.location.href = "LoginForm.jsp";
        <% } %>
    </script>
</body>
</html>
