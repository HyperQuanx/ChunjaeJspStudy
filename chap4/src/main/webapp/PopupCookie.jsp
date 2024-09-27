<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String chkVal = request.getParameter("inactiveToday"); // inactiveToday의 매개변수 값 얻기

// 값이 1이면 쿠키를 생성해 응답 객체에 추가
if (chkVal != null && chkVal.equals("1")) {
	Cookie cookie = new Cookie("PopupClose", "OFF"); // 쿠키 생성
	cookie.setPath(request.getContextPath()); // 경로 설정
	cookie.setMaxAge(20); // 유지 기간 설정
	response.addCookie(cookie); // 응답 객체에 추가
	out.println("20초동안 열지 않음");
}
%>
