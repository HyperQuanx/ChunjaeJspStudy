<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
</head>
<body>
    <h1>게시글 목록</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bbs" items="${list}">
                <tr>
                    <td>${bbs.idx}</td>
                    <td><a href="view.do?idx=${bbs.idx}">${bbs.title}</a></td>
                    <td>${bbs.memberId}</td>
                    <td>${bbs.regDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
