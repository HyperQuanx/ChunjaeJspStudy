<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 페이지</title>
</head>
<body>
	<form name="frmRegist" id="frmRegist" method="POST" action="./regist.do" enctype="multipart/form-data">
		<table>
			<tbody>
				<tr>
					<th>제목 : </th>
					<td><input type="text" name="title" id="title" value="글 제목" maxlength="100" /></td>
				</tr>
				<tr>
					<th>작성자 : </th>
					<td><input type="text" name="memberid" id="memberid" value="user1" maxlength="20" /></td>
				</tr>
				<tr>
					<th>노출일 : </th>
					<td><input type="date" name="displaydate" id="displaydate" value="2024-10-14" maxlength="100" /></td>
				</tr>
				<tr>
					<th>글 내용 : </th>
					<td><textarea name="content" id="content" /></textarea>
				</tr>
				<tr>
					<th>파일 종류 : </th>
					<td>
						<input type="checkbox" name="filecategory" id="filecategory_0" value="문서" />문서
						<input type="checkbox" name="filecategory" id="filecategory_1" value="이미지" />이미지
						<input type="checkbox" name="filecategory" id="filecategory_2" value="압축파일" />압축파일
					</td>
				</tr>
				<tr>
					<th>첨부파일 : </th>
					<td><input type="file" name="file1" id="file1" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="등록" />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>