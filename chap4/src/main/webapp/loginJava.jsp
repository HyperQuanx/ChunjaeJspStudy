<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
      <label for="id">로그인 : </label>
      <input type="text" id="id" name="id" value=""/>
      <input type="checkbox" id="saveId" value="N"/> <span for="saveId"></span>
      <br />
      <label for="pw">비밀번호 : </label>
      <input type="password" id="pw" name="pw" value=""/>
      <br />
      <input type="submit" value="로그인" onclick="loginGo()"/>
    </form>
    <p id="hi"></p>
    <button onclick="logOut()">로그아웃하기</button>
</body>
</html>