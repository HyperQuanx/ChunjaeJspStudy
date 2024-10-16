<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Alert</title>
</head>
<body>
	<script>
        window.onload = function() {
            alert('<%= request.getAttribute("successMsg") %>');
            window.location.href = "<%= request.getAttribute("uri") %>";
        };
    </script>
</body>
</html>