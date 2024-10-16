<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
    <script>
        alert("회원가입이 완료되었습니다.");
        window.location.href = "<%= request.getContextPath() %>/pagem.do?ove=mb-login";
    </script>
</body>
</html>
