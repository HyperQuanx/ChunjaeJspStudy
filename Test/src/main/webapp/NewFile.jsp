<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
Integer abc1 = 1;
Integer abc2 = 2;
out.println(abc1 + abc2);
%>
<!-- ↑페이지 지시어 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="Styles.css" />
</head>
<body>
	<%
	String str1 = "JSP";
	String str2 = "Hello World";
	%>
	
	<h2><%=str1 %>테스트 페이지 입니다.</h2>
	
	<p>
	
	<!-- JSP 스크립틀릿(Scriptlet) -->

	<%
	out.println(str2 + " " + str1);
	%>
	</p>
	<p class="colorChange">
		컬러바꾸기
	</p>
	<div style="display:flex; justify-content: center; width: 100vw; gap: 100px">
		<div style="width: 125px; 
		height: 125px;
		border: 1px solid black;
		background-color: red;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center">
		박스 만들기 1
		</div>
		<div style="width: 125px;
		height: 125px;
		border: 1px solid black;
		background-color: blue;
		color: white;
		display: flex;
		justify-content: center;
		align-items: center">
		박스 만들기 2
		</div>
	</div>
	
	<h2>단순 연산하기</h2>
	
	<div class="marginTop80">
		<h3>덧셈</h3>
		<input type="text" id="a" value="" oninput="calculateSum()"/>
		<input type="text" id="b" value="" oninput="calculateSum()"/>
	</div>
	<div>
		<p><span id="inA">ｘ</span> + <span id="inB">ｘ</span> = <span id="result1">ｘ</span></p>
	</div>
	<div class="marginTop80">
		<h3>뺄셈</h3>
		<input type="text" id="c" value="" oninput="calculateMinus()"/>
		<input type="text" id="d" value="" oninput="calculateMinus()"/>
	</div>
	<div>
		<p><span id="inC">ｘ</span> - <span id="inD">ｘ</span> = <span id="result2">ｘ</span></p>
	</div>
	<div class="marginTop80">
		<h3>곱셈</h3>
		<input type="text" id="e" value="" oninput="calculateMulti()"/>
		<input type="text" id="f" value="" oninput="calculateMulti()"/>
	</div>
	<div>
		<p><span id="inE">ｘ</span> * <span id="inF">ｘ</span> = <span id="result3">ｘ</span></p>
	</div>
	<div class="marginTop80">
		<h3>나눗셈</h3>
		<input type="text" id="g" value="" oninput="calculateDivision()"/>
		<input type="text" id="h" value="" oninput="calculateDivision()"/>
	</div>
	<div>
		<p><span id="inG">ｘ</span> / <span id="inH">ｘ</span> = <span id="result4">ｘ</span></p>
	</div>
	<div class="marginTop80">
		<h3>제곱</h3>
		<input type="text" id="i" value="" oninput="calculateSquare()"/>
		<input type="text" id="j" value="" oninput="calculateSquare()"/>
	</div>
	<div>
		<p><span id="inI">ｘ</span><sup><span id="inJ">ｘ</span></sup> = <span id="result5">ｘ</span></p>
	</div>
	<div class="marginTop80">
		<h3>나머지</h3>
		<input type="text" id="k" value="" oninput="calculateRemainder()"/>
		<input type="text" id="l" value="" oninput="calculateRemainder()"/>
	</div>
	<div>
		<p><span id="inK">ｘ</span> % <span id="inL">ｘ</span> = <span id="result6">ｘ</span></p>
	</div>
	<script>
	let calculateSum = () => {
		let aValue = parseFloat(document.querySelector("#a").value) || 0;
		let bValue = parseFloat(document.querySelector("#b").value) || 0;

		let sum = aValue + bValue;

		document.querySelector("#inA").textContent = aValue;
		document.querySelector("#inB").textContent = bValue;
		document.querySelector("#result1").textContent = sum;
	}
	
	let calculateMinus = () => {
		let cValue = parseFloat(document.querySelector("#c").value) || 0;
		let dValue = parseFloat(document.querySelector("#d").value) || 0;

		let min = cValue - dValue;
		
		document.querySelector("#inC").textContent = cValue;
		document.querySelector("#inD").textContent = dValue;
		document.querySelector("#result2").textContent = min;
	}
	
	let calculateMulti = () => {
		let eValue = parseFloat(document.querySelector("#e").value) || 0;
		let fValue = parseFloat(document.querySelector("#f").value) || 0;

		let mul = eValue * fValue;

		document.querySelector("#inE").textContent = eValue;
		document.querySelector("#inF").textContent = fValue;
		document.querySelector("#result3").textContent = mul;
	}
	
	let calculateDivision = () => {
		let gValue = parseFloat(document.querySelector("#g").value) || 0;
		let hValue = parseFloat(document.querySelector("#h").value) || 0;

		let div = gValue / hValue;

		document.querySelector("#inG").textContent = gValue;
		document.querySelector("#inH").textContent = hValue;
		document.querySelector("#result4").textContent = div;
	}
	
	let calculateSquare = () => {
		let iValue = parseFloat(document.querySelector("#i").value) || 0;
		let jValue = parseFloat(document.querySelector("#j").value) || 0;

		let squ = iValue ** jValue;

		document.querySelector("#inI").textContent = iValue;
		document.querySelector("#inJ").textContent = jValue;
		document.querySelector("#result5").textContent = squ;
	}
	
	let calculateRemainder = () => {
		let kValue = parseFloat(document.querySelector("#k").value) || 0;
		let lValue = parseFloat(document.querySelector("#l").value) || 0;

		let mod = kValue % lValue;

		document.querySelector("#inK").textContent = kValue;
		document.querySelector("#inL").textContent = lValue;
		document.querySelector("#result6").textContent = mod;
	}
		
	</script>
</body>
</html>