<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<style>
	body {
        font-family: 'Arial', sans-serif;
        background: linear-gradient(135deg, #ece9e6, #ffffff);
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
      }

      form {
        background-color: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        width: 300px;
      }

      h2 {
        text-align: center;
        color: #333;
      }

      label {
        font-size: 14px;
        color: #555;
      }

      input[type="text"],
      input[type="password"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0 20px 0;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
      }

      input[type="checkbox"] {
        margin-right: 5px;
      }

      input[type="submit"],
      button {
        width: 100%;
        padding: 10px;
        background-color: #478abc;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
      }

      input[type="submit"]:hover,
      button:hover {
        background-color: #45a049;
      }

      #hi {
        text-align: center;
        margin-top: 20px;
        color: #555;
      }

      button {
        background-color: #f44336;
        margin-top: 10px;
      }

      button:hover {
        background-color: #e41e0e;
      }

      span {
        font-size: 12px;
        color: #777;
      }

      p {
        text-align: center;
      }
</style>
</head>
<body>
	<div>
		<form name="frmLogin" id="frmLogin" action="login_ok.jsp" method="post">
	      <label for="id">로그인 : </label>
	      <input type="text" id="id" name="id" value=""/>
	      <input type="checkbox" id="saveId" value="N"/> <span for="saveId">아이디 저장</span>
	      <br />
	      <label for="pw">비밀번호 : </label>
	      <input type="password" id="pw" name="pw" value=""/>
	      <br />
	      <input type="submit" value="로그인" onclick="loginGo()"/>
	    </form>
	    <p id="hi"></p>
	    <button onclick="logOut()">로그아웃하기</button>
	</div>
    <script>
		function setCookie(name, value, maxAge) {
			document.cookie = name + "=" + value + "; Max-Age=" + maxAge + "; path=/";
		}
		
		
		function loginGo() {
			let ldVal = document.getElementById("id").value;
	    	let pwVal = document.getElementById("pw").value;
			let isChecked = document.getElementById("saveId").checked;
			
			if (isChecked) {
				setCookie('saveId', 'Y', 60);
			}
			
			setCookie("id", ldVal, 60);
			setCookie("pw", pwVal, 60);
		}
		
		function getCookie(name) {
		    let cookies = document.cookie.split(';');
		    
		    for(let i = 0; i < cookies.length; i++) {
		        let cookie = cookies[i].trim();
		        
		        if (cookie.indexOf(name + '=') === 0) {
		            return cookie.substring(name.length + 1);
		        }
		    }
		    return null;
		}
		
		let idV = getCookie('id');
		let pwV = getCookie('pw');
		let save = getCookie('saveId');

		if (save != null) {
		document.querySelector("#id").value = idV;
		document.querySelector("#saveId").checked = true;
		}
		
		if (idV != null) {
			document.querySelector("#hi").textContent = idV + " 님 어서오세요";
		} else {
			document.querySelector("#hi").textContent = "로그인 페이지";
		}
		
		function deleteCookie(name) {
		    document.cookie = name + "=; Max-Age=-1; path=/";
		}

		function logOut() {
		    deleteCookie('id');
		    deleteCookie('pw');
		    deleteCookie('saveId');

		    alert("로그아웃되었습니다.");
		    location.reload();
		}
		
	</script>
</body>
</html>