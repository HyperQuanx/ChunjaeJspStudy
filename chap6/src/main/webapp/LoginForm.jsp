<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&display=swap" rel="stylesheet">
<title>로그인 페이지</title>
<style>
    body {
        font-family: "Dongle", sans-serif;
 		font-weight: 400;
  		font-style: normal;
        background-color: #f0f4f8;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-size: 20px;
        overflow: hidden;
        position: relative;
    }

    .login-container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        z-index: 1;
    }

    h2 {
        text-align: center;
        color: #478abc;
        margin-bottom: 20px;
    }

    form, .btnG {
        display: flex;
        flex-direction: column;
        margin-top: 20px
    }

    input[type="text"], input[type="password"] {
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1em;
    }

    input[type="submit"], #backBtn {
        padding: 10px;
        background-color: #478abc;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 1.1em;
        transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover, #backBtn:hover {
        background-color: #377a9f;
    }

    .checkbox-container {
        display: flex;
        align-items: center;
        margin: 10px 0;
    }

    .checkbox-container input[type="checkbox"] {
        margin-right: 10px;
    }

    .checkbox-container label {
        font-size: 0.9em;
        color: #555;
    }

    #errMsg {
        color: red;
        font-size: 1em;
        text-align: center;
        margin-top: 10px;
        font-weight: bold;
    }

    a {
        color: #478abc;
        text-decoration: none;
        display: block;
        text-align: center;
    }

    a:hover {
        text-decoration: underline;
    }

    /* 비 애니메이션 설정 */
    .rain {
        position: absolute;
        top: 0;
        left: 0;
        width: 100vw;
        height: 100vh;
        pointer-events: none;
        overflow: hidden;
        z-index: 0;
    }

    .drop {
        position: absolute;
        bottom: 100%;
        width: 2px;
        height: 30px;
        background: #478abc;
        border-radius: 20px;
        animation: fall linear infinite;
    }

    @keyframes fall {
        0% {
            transform: translateY(0);
            opacity: 1;
        }
        100% {
            transform: translateY(100vh);
            opacity: 0;
        }
    }
    button > a {
    	color: white;
    }
</style>
</head>
<body>
    <div class="rain">
        <%
            Random random = new Random();
            for (int i = 0; i < 100; i++) {
                double leftPosition = random.nextDouble() * 100;
                double duration = 1 + random.nextDouble() * 2;
                double delay = random.nextDouble() * 5;
        %>
            <div class="drop"
            	 style="left: <%= leftPosition %>vw;
            	 animation-duration: <%= duration %>s;
            	 animation-delay: <%= delay %>s;
            	 ">
            </div>
        <%
            }
        %>
    </div>
    
    <div class="login-container">
        <h2>로그인 페이지</h2>
        <%
        String savedUserId = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userId".equals(cookie.getName())) {
                    savedUserId = cookie.getValue();
                }
            }
        }
        %>

        <form action="LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
            아이디
            <input type="text" name="user_id" value="<%= savedUserId != null ? savedUserId : "" %>" />
            
            패스워드 
            <input type="password" name="user_pw" id="pwView" />
            
            <div class="checkbox-container">
                <input type="checkbox" name="idSave" id="idSave" <%= savedUserId != null ? "checked" : "" %> />
                <label for="idSave">아이디 저장</label>
            </div>

            <div class="checkbox-container">
                <input type="checkbox" id="ck" />
                <label for="ck">패스워드 보기</label>
            </div>

            <input type="submit" value="로그인하기" />
        </form>
        <div class="btnG">
	        <button onclick="mainPage()" id="backBtn"><a href="view.jsp">뷰</a></button>
        </div>
        
        <div class="btnG">
	        <button onclick="mainPage()" id="backBtn"><a href="CRUD.jsp">CRUD</a></button>
        </div>

        <%
        if (session.getAttribute("UserId") != null) {
        %>
            <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
            <a href="Logout.jsp">[로그아웃]</a>
        <%
        }
        %>
        
        <span id="errMsg">
            <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
        </span>
    </div>

    <script>
        function validateForm(form) {
            if (!form.user_id.value) {
                alert("아이디를 입력하세요.");
                return false;
            }
            if (form.user_pw.value == "") {
                alert("패스워드를 입력하세요.");
                return false;
            }
        }

        const pwView = document.querySelector("#pwView");

        document.querySelector("#ck").addEventListener('change', function() {
            if (this.checked) {
                pwView.type = "text";
            } else {
                pwView.type = "password";
            }
        });
    </script>
</body>
</html>
