<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
</head>
<body>
	<h2>ㅎㅇ</h2>
	<p ></p>
	<script>
		function getCookie(name) {
		    // 쿠키 문자열을 '; '로 구분해서 배열로 만듦
		    let cookies = document.cookie.split(';');
		    
		    // 각 쿠키를 순회하면서 원하는 이름과 일치하는 값을 찾음
		    for(let i = 0; i < cookies.length; i++) {
		        let cookie = cookies[i].trim(); // 각 쿠키 앞뒤 공백 제거
		        
		        // 쿠키 이름이 일치하면 그 값을 반환
		        if (cookie.indexOf(name + '=') === 0) {
		            return cookie.substring(name.length + 1); // 쿠키의 값을 반환
		        }
		    }
		    return null; // 해당 이름의 쿠키가 없으면 null 반환
		}
		
		let cookieValue = getCookie('popFlag123');
		
		console.log(cookieValue);
		
		if (cookieValue == null) {
			(() => {
				window.onload = () => {
					window.open('pp.jsp', '_blank', 'width=700, height=600, top=50, left=50, scrollbars=yes');
				}
			})();
		}
	</script>
</body>
</html>
