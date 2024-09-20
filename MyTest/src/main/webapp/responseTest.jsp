<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // CORS 허용 설정
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type");
    response.setHeader("Access-Control-Expose-Headers", "CurrentTime, Message, User-Name, Num");

    // 헤더 설정
    String currentTime = new java.util.Date().toString();
    String name = "한덕용";
    String message = "왜 안와 씨";
    String num = "18181818";  // 숫자를 문자열로 설정

    // 응답 헤더에 값 추가
    response.setHeader("CurrentTime", currentTime);
    response.setHeader("Message", message);
    response.setHeader("User-Name", name);
    response.setHeader("Num", num);  // 문자열로 숫자 헤더 설정
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 헤더 테스트</title>
</head>
<body>
    <h2>응답 헤더에 값 추가 완료</h2>

    <!-- JSP에서 설정한 헤더 값 출력 -->
    <p>현재 시간: <%= currentTime %></p>
    <p>사용자 이름: <%= name %></p>
    <p>Message: <%= message %></p>
</body>
</html>
