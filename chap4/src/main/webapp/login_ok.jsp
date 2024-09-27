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
	asd
	</div>
	<script>
		function getCookie(name) {
		    let cookies = document.cookie.split(';');
		    
		    for(let i = 0; i < cookies.length; i++) {
		        let cookie = cookies[i].trim();
		        
		        if (cookie.indexOf(name + '=') === 0) {
		            return cookie.substring(name.length + 1);
		        }
		    }
		    return null;
		}
		
		let idV = getCookie('id');
		let pwV = getCookie('pw');
		
		
		
		if (idV) {
			alert("어서오세요 " + idV + " 님");
			location.assign("login.jsp");
		} else {
			alert("다시 로그인해주세요");
			location.assign("login.jsp");
		}
	</script>
</body>
</html>