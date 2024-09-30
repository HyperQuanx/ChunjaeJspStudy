<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Include & Forward 예제</title>
</head>
<body>
    <h2>Include 지시어, Include 액션 태그, Forward 예제</h2>

    <!-- 1. pageContext.setAttribute로 변수 설정 (page 범위) -->
    <%
        // pageContext 범위: 이 JSP 페이지 내에서만 유효
        pageContext.setAttribute("pageScopeMessage", "이 메시지는 page 범위에서만 유효합니다.");
    %>

    <!-- 2. request.setAttribute로 변수 설정 (request 범위) -->
    <%
        // request 범위: 동일한 요청 내의 다른 JSP나 서블릿에도 전달 가능
        request.setAttribute("requestScopeMessage", "이 메시지는 request 범위에서 여러 페이지 간에 전달됩니다.");
    %>

    <h3>1. Include 지시어 예제</h3>
    <p>Include 지시어는 페이지 로딩 시 파일을 소스 코드에 포함합니다. 페이지 간 변수가 전달되지 않습니다.</p>
    <%@ include file="includeDirective.jsp" %> <!-- Include 지시어 사용 -->

    <h3>2. Include 액션 태그 예제</h3>
    <p>Include 액션 태그는 요청 시 파일을 동적으로 포함하며, request 범위의 변수를 전달할 수 있습니다.</p>
    <jsp:include page="includeAction.jsp" /> <!-- Include 액션 태그 사용 -->

    <h3>3. Forward 예제</h3>
    <p>Forward는 현재 요청을 다른 페이지로 완전히 넘기며, 요청 범위의 변수가 전달됩니다.</p>
    <form method="get" action="forwardedPage.jsp">
        <input type="submit" value="Forward로 이동하기" />
    </form>

</body>
</html>
