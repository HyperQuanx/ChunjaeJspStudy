<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h3>Include 액션 태그로 포함된 페이지</h3>

<!-- Include 액션 태그는 요청 시 동적으로 포함됨 -->
<p>pageContext 범위 변수: <%= (String) pageContext.getAttribute("pageScopeMessage") %></p>
<p>request 범위 변수: <%= (String) request.getAttribute("requestScopeMessage") %></p>
