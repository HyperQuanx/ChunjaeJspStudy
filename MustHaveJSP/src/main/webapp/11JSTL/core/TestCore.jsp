<%@page import="java.util.ArrayList"%>
<%@page import="common.Person"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core Test</title>
</head>
<body>
	<h2>set 연습</h2>
	<br />

	<h3>일반 set</h3>
	<c:set var="w" value="일반 set" scope="page" />
	<p>${ w }</p>

	<br />

	<h3>자바 빈즈 생성(생성자 사용)</h3>
	<c:set var="person1" value='<%=new Person("덕용1", 26)%>' />
	<p>이름 : ${ person1.name }, 나이 : ${ person1.age }</p>

	<br />

	<h3>자바 빈즈 생성(target, property 사용)</h3>
	<c:set var="person2" value="<%=new Person()%>" />
	<c:set target="${ person2 }" property="name" value="덕용2" />
	<c:set target="${ person2 }" property="age" value="222" />
	<p>이름 : ${ person2.name }, 나이 : ${ person2.age }</p>

	<br />
	<hr />
	<br />

	<h2>if 연습</h2>
	<br />

	<c:set var="num" value="100" />
	<c:set var="num2" value="99" />
	<c:set var="str" value="Hi" />
	<p>num : ${num}</p>
	<p>num2 : ${num2}</p>
	<p>str : ${str}</p>

	<h3>홀/짝 판단</h3>
	<c:if test="${num % 2 == 0}" var="numBol">
		${num}은 짝수입니다.<br>
		결과 : ${numBol}
	</c:if>
	<br>
	<h3>문자열 비교</h3>
	<p>str은 Hello 인가요?</p>
	<c:if test="${str == 'Hello'}" var="strBol1">
		결과 : 네
	</c:if>
	<c:if test="${str != 'Hello'}" var="strBol2">
		결과 : 아니요
	</c:if>

	<br />
	<hr />
	<br />

	<h2>choose, when, otherwise 연습</h2>
	<br>
	<p>변수는 if와 같은거 씀</p>

	<h3>choose로 홀/짝 판단</h3>
	<p>num은 홀/짝?</p>
	<c:choose>
		<c:when test="${num % 2 == 0}">
			${num}은 짝수
		</c:when>
		<c:otherwise>
			${num}은 홀수
		</c:otherwise>
	</c:choose>
	<br>
	<p>num2는 홀/짝?</p>
	<c:choose>
		<c:when test="${num2 % 2 == 0}">
			${num2}는 짝수
		</c:when>
		<c:otherwise>
			${num2}는 홀수
		</c:otherwise>
	</c:choose>

	<br />
	<hr />
	<br />

	<h2>forEach 연습</h2>
	<br />

	<%
	List<Person> people = new ArrayList<Person>();
	people.add(new Person("한덕용", 26));
	people.add(new Person("한덕동", 27));
	people.add(new Person("한덕순", 28));
	%>

	<c:set var="ppp" value="<%=people%>" />
	<c:set var="pLength" value="<%=people.size()%>" />


	<h3>forEach 일반 for문</h3>
	<c:forEach var="p" begin="0" end="${ pLength - 1 }" step="1">
		<p>이름 : ${ ppp[p].name }, 나이 : ${ ppp[p].age }</p>
	</c:forEach>

	<br />

	<h3>forEach 향상 for문</h3>
	<c:forEach var="pp" items="${ ppp }">
		<p>이름 : ${ pp.name }, 나이 : ${ pp.age }</p>
	</c:forEach>

	<br />

	<h3>forEach 상태 알아보기(일반 for문)</h3>
	<c:forEach var="pppp" begin="1" end="3" step="1" varStatus="loopStatus">
		<h4>${ pppp }번째루프</h4>
		<ul>
			<li>current(현재 루프의 변숫값 반환) : ${ loopStatus.current }</li>
			<li>index(현재 루프의 변숫값 반환) : ${ loopStatus.index }</li>
			<li>count(실제 반복 횟수) : ${ loopStatus.count }</li>
			<li>first(루프의 처음일 때 true 반환) : ${ loopStatus.first }</li>
			<li>last(루프의 마지막일 때 true 반환) : ${ loopStatus.last }</li>
		</ul>
	</c:forEach>

	<br />

	<h3>forEach 상태 알아보기(향상 for문)</h3>
	<c:forEach var="ppppp" items="${ ppp }" varStatus="loopStatus2">
		<h4>${ ppppp }번째루프</h4>
		<ul>
			<li>current(현재 루프의 실제 요소를 반환) : ${ loopStatus2.current }</li>
			<li>index(현재 루프의 인덱스를 표시) : ${ loopStatus2.index }</li>
			<li>count(실제 반복 횟수) : ${ loopStatus2.count }</li>
			<li>first(루프의 처음일 때 true 반환) : ${ loopStatus2.first }</li>
			<li>last(루프의 마지막일 때 true 반환) : ${ loopStatus2.last }</li>
		</ul>
	</c:forEach>


	<h3>1 ~ 100 짝수의 합</h3>
	<c:forEach var="i" begin="0" end="100" step="2">
		<c:set var="sum" value="${ sum + i }" />
	</c:forEach>
	<p>짝수의 합 : ${ sum }</p>

	<br />
	<hr />
	<br />

	<h2>토큰 연습</h2>
	<br />

	<%
	String cars = "벤츠, 아우디, 쉐보레, 현대";
	%>

	<c:forTokens var="car" items="<%=cars%>" delims=",">
		<p>${ car }</p>
	</c:forTokens>

	<br />
	<hr />
	<br />

	<h2>import 연습</h2>
	<br />
	<c:set var="req" value="보낸 값" scope="request" />
	<c:import url="ImportRain.jsp" var="otherPage">
		<c:param name="par1" value="파라미터1" />
		<c:param name="par2" value="파라미터2" />
	</c:import>

	<h3>다른 문서 가져오기</h3>
	${otherPage}

	<h3>외부 자원 삽입</h3>
	<iframe src="http://localhost:8080/Buck/Index.jsp"
		style="width: 100%; height: 600px;"></iframe>

	<br />
	<hr />
	<br />

	<h2>redirect 연습</h2>
	<br />

	<p>RediTest.jsp 참조</p>

	<br />
	<hr />
	<br />

	<h2>url 연습</h2>
	<br />

	<h4>url 태그로 링크 걸기</h4>
	<c:url value="ImportRain.jsp" var="url">
		<c:param name="par1" value="url" />
		<c:param name="par2">연습</c:param>
	</c:url>
	<a href="${url }">OtherPage.jsp 바로가기</a>
	<p>왜 쓰는 거지?</p>

	<br />
	<hr />
	<br />

	<h2>out 연습</h2>
	<br />

	<c:set var="iTag">
        i 태그는 <i>기울임</i>을 표현합니다.
  </c:set>

	<h4>기본 사용</h4>
	<c:out value="${ iTag }" />

	<h4>escapeXml 속성</h4>
	<c:out value="${ iTag }" escapeXml="false" />

	<h4>default 속성</h4>
	<c:out value="${ param.name }" default="이름 없음" />
	<c:out value="" default="빈 문자열도 값입니다." />

	<br />
	<hr />
	<br />

	<h2>catch 연습</h2>
	<br />

	<h4>자바 코드에서의 예외</h4>
	<%
	int num1 = 100;
	%>
	<c:catch var="eMessage">
		<%
		int result = num1 / 0;
		%>
	</c:catch>
	예외 내용 : ${ eMessage }

	<h4>EL에서의 예외</h4>
	<c:set var="num2" value="200" />

	<c:catch var="eMessage">
        ${"일" + num2 }
	</c:catch>
	예외 내용 : ${ eMessage }
</body>
</html>