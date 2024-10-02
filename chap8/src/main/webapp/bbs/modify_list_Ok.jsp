<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
</head>
<body>
<%
    String memberId = request.getParameter("memberId");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String idx = request.getParameter("idx");
    String message = "";
    BbsDTO dto = null;

    try {
    	BbsDAO dao = new BbsDAO();
    	dto = dao.modifyBoard(memberId, title, content);
        dao.close();
        message = "글 수정 성공 ^_^ ♨";
    } catch(Exception e) {
        message = "글 등록 실패 ↙↙ ㅠ_ㅠ ↘↘ : " + e.getMessage();
    }
%>
    <script>
        alert("<%= message %>");
        <% if ("글 수정 성공 ^_^ ♨".equals(message)) { %>
            window.location.href = "view_list.jsp?idx=<%= idx %>";
        <% } %>
    </script>
</body>
</html>
