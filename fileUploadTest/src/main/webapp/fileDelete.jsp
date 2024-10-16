<%@page import="net.fullstack7.fileupload.MyFileDTO"%>
<%@page import="net.fullstack7.fileupload.MyFileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fileDeleteOk</title>
</head>
<body>
<%
String paramIdx = request.getParameter("idx");
int idx = Integer.parseInt(paramIdx);
String message = "";

try {
	MyFileDAO dao = new MyFileDAO();
	MyFileDTO dto = dao.delFile(idx);
	message = "삭제되었습니다.";
	dao.close();
} catch(Exception e) {
	message = "오류가 발생하였습니다. " + e.getMessage();
}
%>
	<script>
        alert("<%= message %>");
        <% if ("삭제되었습니다.".equals(message)) { %>
            window.location.href = "FileList.jsp";
        <% } else { %>
        	window.location.href = "FileList.jsp";
        <% } %>
    </script>
</body>
</html>