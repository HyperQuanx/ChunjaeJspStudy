<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<div>
		<p>C</p>
		<form method="post" action="CRUDc.jsp">
		    <input type="text" name="id" id="id" value=""/>
		    <input type="text" name="name" id="name" value=""/>
		    <input type="password" name="pwd" id="pwd" value=""/>
		    <input type="text" name="birth" id="birth" value=""/>
		    <input type="submit" value="C"/>
		</form>
	</div>
	<div>
		<p>R</p>
		<form method="post" action="CRUDr.jsp">
		    <input type="text" name="id" id="id" value=""/>
		    <input type="submit" value="R"/>
		</form>
	</div>
	<div>
		<p>U</p>
		<form method="post" action="CRUDu.jsp">
		    <input type="text" name="id" id="id" value=""/>
		    <input type="submit" value="U"/>
		</form>
	</div>
	<div>
		<p>D</p>
		<form method="post" action="CRUDd.jsp">
		    <input type="text" name="id" id="id" value=""/>
		    <input type="submit" value="D"/>
		</form>
	</div>
	<script>
	
	</script>
</body>
</html>