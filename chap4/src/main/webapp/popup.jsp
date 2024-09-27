<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%!
	public Cookie setCok(String name, String value) {
    Cookie cookie = new Cookie(name, value);
    cookie.setMaxAge(3600);
    return cookie;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
<script src="/js/jquery-3.7.1.slim.min.js"></script>
<style>
	div#divPop1 {
		width: 300px;
		height: 100px;
		background-color: yellow;
	}
	div#divPop1>div{
		margin-top: 80px
	}
</style>
</head>
<body>
	<h2>팝업창 페이지</h2>
	
	<div id="divPop1">
		<h2>공지사항 팝업</h2>
		<div align="right">
			<form name="frmPop1" id="frmPop1">
				<input type="checkbox" id="pop_flag" value="Y" /> 하루 끄기
				<input type="button" id="btnClose" value="닫기" />
			</form>
		</div>
	</div>
	<script>
		$(() => {
			$("#btnClose").click(() => {
				$("#divPop1").hide(); // document.getElementById("divPop1").style.display = "none"; 과 같다
				var popValue = $("input:checkbox[id=popFlag]:checked").val();
				if (popValue == "Y") {
					$.ajax({
						url : './set_popupp_cookie.jsp',
						type : 'get',
						data : {pop_flag : popValue}
						dataType : "text",
						success : (resData) => {
							if (resData != '') {
								location.reload();
							}
						}
					})
				}
			});
		});
	</script>
</body>
</html>