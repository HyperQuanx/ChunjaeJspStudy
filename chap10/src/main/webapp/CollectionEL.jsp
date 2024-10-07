<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>List 컬렉션</h2>
<%
List<Object> aList = new ArrayList<Object>();
aList.add("탐정");
aList.add("홍길동");
pageContext.setAttribute("Hong", aList);
%>
<ul>
	<li>0번째 요소 : ${ Hong[0] }</li>
	<li>1번째 요소 : ${ Hong[1] }</li>
	<li>2번째 요소 : ${ Hong[2] }</li>
</ul>

<h2>Map 컬렉션</h2>
<%
Map<String, String> map = new HashMap<String, String>();
map.put("반말", "안녕");
map.put("존댓말", "안녕하세요");
pageContext.setAttribute("Korea", map);
%>

<ul>
	<li>반 : ${ Korea["반말"] }, ${ Korea["반말"] }, ${ Korea["반말"] }</li>
	<li>존 : ${ Korea["존댓말"] }, ${ Korea["존댓말"] }, \${ Korea["존댓말"] }</li>
</ul>
</body>
</html>