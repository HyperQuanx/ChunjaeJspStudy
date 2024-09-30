<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forward된 페이지</title>
</head>
<body>
    <h2>Forward로 이동된 페이지</h2>

    <!-- Forward는 request 범위의 변수를 전달함 -->
    <p>request 범위 변수: <%= (String) request.getAttribute("requestScopeMessage") %></p>

    <!-- Forward 시에는 pageContext 변수는 전달되지 않음 -->
    <p>pageContext 범위 변수 (사용 불가): <%= (String) pageContext.getAttribute("pageScopeMessage") %></p>
</body>
</html>
