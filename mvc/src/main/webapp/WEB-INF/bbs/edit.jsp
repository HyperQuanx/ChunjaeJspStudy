<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
    <c:set var="idx" value="${idx}" />

    <script>
        alert("성공하였습니다.");
        window.location.href = "/mvc/bbs/view.do?idx=${idx}";
    </script>
</body>
</html>
