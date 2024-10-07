<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
table,thead,tbody,th,tr,td {
	border:1px solid black;
	border-collapse:collapse;
}
th {
	text-align:center;
	width:150px;
	height:40px;
	backgroud-color:#333333;
}
</style>


</head>
<body>
<h2>게시판 목록</h2>

<table>
	<thead>
		<tr>
			<th>선택</th>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>조회수</th>
			<th>등록일</th>
			<th>삭제</th>
		</tr>
	</thead>
	<tbody>
	<form id="frmList" name="frmList" method="post">
		<tr>
			<td><input type="checkbox" id="bbs_idx" name="bbs_idx" value=""/></td>
			<td>1</td>
			<td><a href="view.jsp?idx=">글제목</a></td>
			<td>글쓴이 이름</td>
			<td>조회수</td>
			<td>등록일</td>
			<td><input type="button" id="btnDeleteOne" value="글삭제" /></td>
		</tr>
		<tr>
			<td colspan="7">등록된 게시물이 존재하지 않습니다.</td>
		</tr>
		<tr>
			<td colspan="7" class="align_center"> << 1 | 2 | 3 >> </td>
		</tr>
		<tr>
			<td colspan="7" class="align_center"> 
				<input type="button" id="btnRegist" value="글등록" />
				<input type="button" id="btnDelete" value="선택글삭제" />
			</td>
		</tr>
		</form>
	</tbody>
</table>




</body>
</html>