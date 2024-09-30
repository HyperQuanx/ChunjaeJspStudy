<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3>Include 지시어로 포함된 페이지</h3>

<!-- Include 지시어는 페이지 로딩 시 소스 코드에 포함됨 -->
<p>pageContext 범위 변수: <%= (String) pageContext.getAttribute("pageScopeMessage") %></p>
<p>request 범위 변수 (Include 지시어로는 전달되지 않음): <%= request.getAttribute("requestScopeMessage") %></p>
