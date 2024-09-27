<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>로그인 페이지</h2>
	<span style="color: red; font-size: 1.2em;">
		<%= request.getAttribute("LoginErrMsg") == null ? 
			"" : request.getAttribute("LoginErrMsg")
		%>
	</span>
		<%
		if (session.getAttribute("UserId") == null) {
			
		%>
		<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
		</script>
		<form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
			아이디 : <input type="text" name="user_id" /><br />
			패스워드 : <input type="password" name="user_pw" id="pwView"/><input type="checkbox" id="ck" value="F"/><br />
			<input type="submit" value="로그인하기" />
		</form>
		<%
		} else {
		%>
			<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
			<a href="Logout.jsp">[로그아웃]</a>
		<%
		}
		%>
		
		<%
		    String message = request.getParameter("message");
		    if ("logout".equals(message)) {
		%>
		    <p style="color: #478abc;">로그아웃이 완료되었습니다.</p>
		<%
		    }
		%>
	<script>
		let bol = false;
		const pwView = document.querySelector("#pwView").type;
		
		document.querySelector("#ck").addEventListener('change', function() {
			if (this.checked) {
				pwView = "text";
				console.log("체크됨");
			} else {
				pwView = "password";
				console.log("앙대영");
			}
		});
	</script>
</body>
</html>