<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setHeader("Access-Control-Allow-Origin", "*");
    response.setHeader("Access-Control-Allow-Methods", "GET, POST, OPTIONS");
    response.setHeader("Access-Control-Allow-Headers", "Content-Type");
    response.setHeader("Access-Control-Expose-Headers", "CurrentTime, Eng, User-Name, Message, Num, Items");

    String currentTime = new java.util.Date().toString();
    String eng = "why";
    String name = "한덕용";
    String message = "왜 안와";
    Integer num = 18181818;
    String[] items = {"Apple", "Banana", "Cherry"};

    StringBuilder itemsJson = new StringBuilder("[");
    for (int i = 0; i < items.length; i++) {
        itemsJson.append("\"").append(items[i]).append("\"");
        if (i < items.length - 1) {
            itemsJson.append(",");
        }
    }
    itemsJson.append("]");

    response.setHeader("CurrentTime", currentTime);
    response.setHeader("Eng", eng);
    response.setHeader("User-Name", name);
    response.setHeader("Message", message);
    response.setIntHeader("Num", num);
    response.setHeader("Items", itemsJson.toString());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답 헤더 테스트</title>
</head>
<body>
    <h2>응답 헤더에 값 추가 완료</h2>

    <p>현재 시간: <%= currentTime %></p>
    <p>사용자 이름: <%= name %></p>
    <p>Message: <%= message %></p>
    <p>Items 배열: <%= itemsJson %></p>
</body>
</html>
