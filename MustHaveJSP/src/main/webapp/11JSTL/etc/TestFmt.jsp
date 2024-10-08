<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h4>숫자 포맷 설정</h4>
	<c:set var="number1" value="12345" />
	
	콤마 O :
	<fmt:formatNumber value="${ number1 }" />
	<br />
	
	콤마 X :
	<fmt:formatNumber value="${ number1 }" groupingUsed="false" />
	<br />
	
	<fmt:formatNumber value="${number1 }" type="currency" var="printNum1" />
	통화기호 : ${ printNum1 }
	<br />
	
	<fmt:formatNumber value="0.03" type="percent" var="printNum2" />
	퍼센트 : ${ printNum2 }

	<h4>문자열을 숫자로 변경</h4>
	<c:set var="number2" value="6,789.01" />
	<fmt:parseNumber value="${ number2 }" pattern="00,000.00"
		var="printNum3" />
	소수점까지 : ${ printNum3 }
	<br />
	<fmt:parseNumber value="${ number2 }" integerOnly="true"
		var="printNum4" />
	정수 부분만 : ${ printNum4 }

	<br />
	<br />
	<hr />
	<br />

	<c:set var="today" value="<%= new java.util.Date() %>" />

	<h4>날짜 포맷</h4>
	full :
	<fmt:formatDate value="${ today }" type="date" dateStyle="full" />
	<br /> short :
	<fmt:formatDate value="${ today }" type="date" dateStyle="short" />
	<br /> long :
	<fmt:formatDate value="${ today }" type="date" dateStyle="long" />
	<br /> default :
	<fmt:formatDate value="${ today }" type="date" dateStyle="default" />

	<h4>시간 포맷</h4>
	full :
	<fmt:formatDate value="${ today }" type="time" timeStyle="full" />
	<br /> short :
	<fmt:formatDate value="${ today }" type="time" timeStyle="short" />
	<br /> long :
	<fmt:formatDate value="${ today }" type="time" timeStyle="long" />
	<br /> default :
	<fmt:formatDate value="${ today }" type="time" timeStyle="default" />

	<h4>날짜/시간 표시</h4>
	<fmt:formatDate value="${ today }" type="both" dateStyle="full"
		timeStyle="full" />
	<br />
	<fmt:formatDate value="${ today }" type="both"
		pattern="yyyy-MM-dd hh:mm:ss" />

	<h4>타임존 설정</h4>
	<fmt:timeZone value="GMT">
		<fmt:formatDate value="${ today }" type="both" dateStyle="full"
			timeStyle="full" />
		<br />
	</fmt:timeZone>
	<fmt:timeZone value="America/Chicago">
		<fmt:formatDate value="${ today }" type="both" dateStyle="full"
			timeStyle="full" />
	</fmt:timeZone>

	<br />
	<br />
	<hr />
	<br />

	<h4>로케일 설정</h4>

	한글로 설정 :
	<fmt:setLocale value="ko_kr" />
	<fmt:formatNumber value="10000" type="currency" />
	/
	<fmt:formatDate value="${ today }" />
	<br /> 일어로 설정 :
	<fmt:setLocale value="ja_JP" />
	<fmt:formatNumber value="10000" type="currency" />
	/
	<fmt:formatDate value="${ today }" />
	<br /> 영어로 설정 :
	<fmt:setLocale value="en_US" />
	<fmt:formatNumber value="10000" type="currency" />
	/
	<fmt:formatDate value="${ today }" />
	<br />
</body>
</html>