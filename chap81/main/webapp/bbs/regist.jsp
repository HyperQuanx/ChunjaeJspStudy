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
	width:120px;
	height:20px;
	backgroud-color:#333333;
}
.input_col {
	width:400px;
	height:20px;
}
.input_box {
	width:300px;
	height:20px;
	margin:2px;
}
.input_box_title {
	width:200px;
	height:20px;
	margin:2px;
}

.input_box_content {
	width:500px;
	height:500px;
	margin:2px;
}

</style>

</head>
<body>
<h2>게시판 등록</h2>

<form name="frmRegist" id="frmRegist" action="regist_ok.jsp" method="POST">
<table>
<tbody>
<tr>
	<th class="input_title">제목 : </td>
	<td class="input_col">
		<input type="text" name="title" id="title" value="" 
						maxlength="100" class="input_box_title"/>
	</td>
</tr>
<tr>
	<th class="input_title">노출일 : </td>
	<td class="input_col">
		<input type="date" name="displayDate" id="displayDate" value="" maxlength="10" />
	</td>
</tr>
<tr>
	<th class="input_title">글 내용 : </td>
	<td class="input_col">
		<textarea name="content" id="content" class="input_box_content"></textarea>
	</td>
</tr>
<tr>
	<th colspan="4" class="align_center"> 
		<input type="submit" id="btnRegist" value="등록" />
		<input type="button" id="btnCancel" value="취소" />
		<input type="button" id="btnToList" value="목록으로" />
	</td>
</tr>
</tbody>
</table>
</form>


</body>
</html>