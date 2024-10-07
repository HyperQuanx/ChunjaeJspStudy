<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>게시판 조회</h2>
<form name="frmView" id="frmView" method="POST">
<table>
<tbody>
<tr>
	<th class="input_title">제목 : </td>
	<td class="input_col">글 제목</td>
</tr>
<tr>
	<th class="input_title">노출일 : </td>
	<td class="input_col">2024-09-30</td>
</tr>
<tr>
	<th class="input_title">글 내용 : </td>
	<td class="input_col">작성된 글내용</td>
</tr>
<tr>
	<th colspan="4" class="align_center"> 
		<input type="button" id="btnModify" value="수정" />
		<input type="button" id="btnDelete" value="삭제" />
		<input type="button" id="btnToList" value="목록으로" />
	</td>
</tr>
</tbody>
</table>
</form>

</body>
</html>