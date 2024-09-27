<%@page import="utils.JSFunction"%>
<%@page import="utils.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
// request.getParameter : HTTP 요청으로 전달된 파라미터 값을 가져오는 역할
// 주로 HTML 폼에서 사용자가 입력한 데이터를 서버 측에서 처리할 때 사용된다.
// request 객체는 클라이언트가 서버로 보낸 요청에 대한 정보를 담고 있다.
String user_id = request.getParameter("user_id");
String user_pw = request.getParameter("user_pw");
String save_check = request.getParameter("save_check");

if ("must".equals(user_id) && "1234".equals(user_pw)) { // 사용자 인증
	// 로그인 성공
	if (save_check != null && save_check.equals("Y")) { // 아이디 저장하기 체크 확인
		CookieManager.makeCookie(response, "loginId", user_id, 86400); // 쿠키 생성
	}
	else {
		CookieManager.deleteCookie(response, "loginId"); // 쿠키 삭제
	}

	JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
	
} else {
	// 로그인 실패
	JSFunction.alertBack("로그인에 실패했습니다.", out);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	
</body>
</html>