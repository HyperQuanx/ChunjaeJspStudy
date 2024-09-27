<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String popupMode = "ON";

Cookie[] cookies = request.getCookies();
if (cookies != null) {
	for (Cookie c : cookies) {
		String cookieName = c.getName();
		String cookieValue = c.getValue();
		if (cookieName.equals("PopupClose")) {
			popupMode = cookieValue;
		}
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
<style>
	div#popup {
		position: absolute;
		top: 100px;
		left: 50px;
		color: yellow;
		width: 270px;
		height: 200px;
		background-color: gray;
		font-size: 10px;
	}
	div#popup>div {
		position: relative;
		background-color: #ffffff;
		top: 0px;
		border: 1px solid gray;
		padding: 10px;
		color: black;
	}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
	$(function() {
		$('#closeBtn').click(function() {
			$('#popup').hide();
			var chkVal = $("input:checkbox[id=inactiveToday]:checked").val();
			if(chkVal == 1) {
				$.ajax({
					url : './PopupCookie.jsp',
					type : 'get',
					data : {inactiveToday : chkVal},
					dataType : "text",
					success : function(resData) {
						if (resData != '') location.reload();
					}
				});
			}
		});
	});
</script>
</head>
<body>
	<h2>팝업 메인 페이지(v1)</h2>
	<%
		for (int i = 1; i <= 10; i++) {
			out.print("POPUP : " + popupMode + "<br />");
		}
	
	if (popupMode.equals("ON")) {
		%>
		<div id="popup">
			<h2 align="center">너에게 날 맞추진 마<br />나에게 더 바라지마<br />버블처럼 커진맘이<br />버블버블버블팝<br />버블버블팝팝</h2>
			<div align="right">
				<form name="popFrm">
					<input type="checkbox" id="inactiveToday" value="1" />
					30초 다운
					<input type="button" value="닫기" id="closeBtn" />
				</form>
			</div>
		</div>
		<%
	}
	%>
</body>
</html>