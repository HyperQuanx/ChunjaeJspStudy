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
        margin-top: 20px;
    }

    input[type="text"], input[type="password"] {
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 1em;
        transition: border-color 0.3s ease;
        margin-bottom: 30px;
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

    .validation-message {
        font-size: 0.9em;
        color: red;
        margin-top: -8px;
        margin-bottom: 10px;
        display: none;
    }

    .valid {
        color: #478abc;
        display: block;
        font-size: 15px;
        
    }

    .invalid {
        color: red;
        display: block;
        font-size: 15px;
    }

    button > a {
        color: white;
    }

    .login-container a {
        display: block;
        margin-top: 15px;
        color: #478abc;
        text-decoration: none;
        font-size: 14px;
        text-align: center;
    }
</style>
</head>
<body>
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

        <form action="signIn_Ok.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
            아이디
            <input type="text" name="memberId" id="memberId" oninput="validateUserId()" value="<%= savedUserId != null ? savedUserId : "" %>" />
            <span id="userIdMessage" class="validation-message">아이디는 4~10자 소문자 영문이어야 합니다.</span>
            
            패스워드 
            <input type="password" name="pwd" id="pwd" oninput="validatePassword()" />
            <span id="passwordMessage" class="validation-message">비밀번호는 8~20자 영문, 숫자, 특수문자를 포함해야 합니다.</span>
            
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
        <a href="signUp.jsp">Sign Up</a>
        <a href="forgotPassword.jsp">비밀번호를 잊으셨나요?</a>
        <a href="list.jsp">메인페이지로 돌아가기</a>

        <span id="errMsg">
            <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
        </span>
    </div>

    <script>
        const userIdInput = document.getElementById("memberId");
        const passwordInput = document.getElementById("pwd");

        const userIdMessage = document.getElementById("userIdMessage");
        const passwordMessage = document.getElementById("passwordMessage");

        const userIdPattern = /^[a-z]{4,10}$/;
        const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;

        function validateUserId() {
            if (userIdPattern.test(userIdInput.value)) {
                userIdMessage.textContent = "유효한 아이디입니다.";
                userIdMessage.classList.add("valid");
                userIdMessage.classList.remove("invalid");
            } else {
                userIdMessage.textContent = "아이디는 4~10자 소문자 영문이어야 합니다.";
                userIdMessage.classList.add("invalid");
                userIdMessage.classList.remove("valid");
            }
        }

        function validatePassword() {
            if (passwordPattern.test(passwordInput.value)) {
                passwordMessage.textContent = "유효한 비밀번호입니다.";
                passwordMessage.classList.add("valid");
                passwordMessage.classList.remove("invalid");
            } else {
                passwordMessage.textContent = "비밀번호는 8~20자 영문, 숫자, 특수문자를 포함해야 합니다.";
                passwordMessage.classList.add("invalid");
                passwordMessage.classList.remove("valid");
            }
        }

        function validateForm(form) {
            const userIdInput = form.memberId;
            const passwordInput = form.pwd;

            if (userIdInput.value.trim() === "") {
                alert("아이디를 입력하세요.");
                userIdInput.focus();
                return false;
            }

            if (!userIdPattern.test(userIdInput.value)) {
                alert("아이디는 4자 이상 10자 이하의 소문자 영문으로 입력하세요.");
                userIdInput.focus();
                return false;
            }

            if (passwordInput.value.trim() === "") {
                alert("비밀번호를 입력하세요.");
                passwordInput.focus();
                return false;
            }

            if (!passwordPattern.test(passwordInput.value)) {
                alert("비밀번호는 영문, 숫자, 특수문자를 포함하여 8~20자로 입력하세요.");
                passwordInput.focus();
                return false;
            }

            return true;
        }

        const pwView = document.querySelector("#pwView");
        document.querySelector("#ck").addEventListener('change', function() {
            if (this.checked) {
                passwordInput.type = "text";
            } else {
                passwordInput.type = "password";
            }
        });
    </script>
</body>
</html>
