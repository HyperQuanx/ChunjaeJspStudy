<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 삭제</title>
</head>
<body>
<%
    int idx = Integer.parseInt(request.getParameter("idx"));
    String message = "";
    BbsDTO dto = null;

    try {
    	BbsDAO dao = new BbsDAO();
    	dto = dao.deleteBoard(idx);
        dao.close();
        message = "글 삭제 성공 ^_^ ♨";
    } catch(Exception e) {
        message = "글 삭제 실패 ↙↙ ㅠ_ㅠ ↘↘ : " + e.getMessage();
    }
%>
    <script>
        alert("<%= message %>");
        <% if ("글 삭제 성공 ^_^ ♨".equals(message)) { %>
            window.location.href = "list.jsp";
        <% } %>
    </script>
</body>
</html>
