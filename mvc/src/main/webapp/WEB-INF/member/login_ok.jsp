<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
    <% String name = (String) request.getSession().getAttribute("name"); %>
    <script>
        alert("로그인되었습니다.\n <%= name %>님 환영합니다!");
        window.location.href = "<%= request.getContextPath() %>/bbs/list.do";
    </script>
</body>
</html>
