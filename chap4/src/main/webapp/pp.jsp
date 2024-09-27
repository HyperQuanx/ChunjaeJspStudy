<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<div id="divPop1">
		<h2>팝팝 버블팝</h2>
		<div align="right">
			<form name="frmPop1" id="frmPop1">
				<input type="checkbox" id="pop_flag" value="Y" /><span>1분 숨기기</span>
				<input type="button" id="btnClose" value="닫기" onclick="closeAndSetCookie()" />
			</form>
		</div>
	</div>
	<script>
		function setCookie(name, value, maxAge) {
			document.cookie = name + "=" + value + "; Max-Age=" + maxAge + "; path=/";
		}

		function closeAndSetCookie() {
			let isChecked = document.getElementById("pop_flag").checked;

			if (isChecked) {
				setCookie('popFlag123', 'Y', 60);
			}
			
			window.close();
		}
	</script>
</body>
</html>
