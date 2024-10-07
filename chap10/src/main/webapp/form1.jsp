<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>

<h2>EL - form 값 전송</h2>

<form name="frm" id="frm" action="form1_ok.jsp" method="post">
	<span for="name">이름 : </span>
	<input type="text" name="name" id="name" value="" />
	<br>
	<span for="gender">성별</span>
	<input type="radio" name="gender" id="gender_0" value="남자" /> 남자
	<input type="radio" name="gender" id="gender_1" value="여자" /> 여자
	<br>
	<span for="school">학력</span>
	<select name="school" id="school">
		<option value="초졸">초졸</option>
		<option value="중졸">중졸</option>
		<option value="고졸">고졸</option>
		<option value="대졸">대졸</option>
	</select>
	<br>
	<span for="hobby_0">취미</span>
	<input type="checkbox" name="hobby" id="hobby_0" value="축구" /> 축구
	<input type="checkbox" name="hobby" id="hobby_1" value="농구" /> 농구
	<input type="checkbox" name="hobby" id="hobby_2" value="배구" /> 배구
	<input type="checkbox" name="hobby" id="hobby_3" value="야구" /> 야구
	<br>
	<br>
	<input type="submit" value="확인" />
</form>

</body>
</html>