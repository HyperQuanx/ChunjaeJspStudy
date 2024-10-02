<%@ page import="java.util.Random" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&display=swap" rel="stylesheet">
<title>회원가입 페이지</title>
<style>
    body {
        background-color: #f0f4f8;
        color: #333;
        display: flex;
        justify-content: center;
        align-items: center;
        margin: 0;
        font-size: 20px;
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
        <h2>회원가입 페이지</h2>

        <form action="signUp_Ok.jsp" method="post" name="loginFrm">
	        아이디
		    <input type="text" name="memberId" id="memberId" oninput="validateUserId()" value="" />
		    <span id="userIdMessage" class="validation-message">아이디는 2~12자 영문 또는 숫자여야 합니다.</span>
		    
		    이름
		    <input type="text" name="name" id="name" oninput="validateName()" />
		    <span id="nameMessage" class="validation-message">이름은 2~10글자 한글 또는 영문이어야 합니다.</span>
		    
		    패스워드 
		    <input type="password" name="pwd" id="pwd" oninput="validatePassword()" />
		    <span id="passwordMessage" class="validation-message">비밀번호는 8~20자 영문, 숫자, 특수문자를 포함해야 합니다.</span>

            <div class="checkbox-container">
                <input type="checkbox" id="ck" />
                <label for="ck">패스워드 보기</label>
            </div>
		    
		    주민번호
		    <input type="text" name="jumin" id="jumin" oninput="validateSSN()" />
		    <span id="ssnMessage" class="validation-message">주민번호는 13자리 숫자여야 합니다. (- 생략)</span>
		    
		    기본주소
		    <input type="text" name="addr1" id="addr1" />
		    
		    상세주소
		    <input type="text" name="addr2" id="addr2" />
		    
		    생일
		    <input type="date" name="birthday" id="birthday" oninput="validateBirthday()" />
		    <span id="birthdayMessage" class="validation-message" style="margin-top: 20px;">유효한 생년월일을 입력해 주세요.</span>


            <input type="submit" value="회원가입하기" style="margin-top: 40px;"/>
        </form>
        <a href="signIn.jsp">Sign In</a>
        <a href="https://policy.naver.com/rules/service.html">회원가입 약관</a>
        <a href="list.jsp">메인페이지로 돌아가기</a>

        <span id="errMsg">
            <%= request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg") %>
        </span>
    </div>

    <script>
        function validateUserId() {
            const userIdPattern = /^[a-zA-Z0-9]{2,12}$/;
            const userIdInput = document.getElementById("memberId");
            const userIdMessage = document.getElementById("userIdMessage");

            if (userIdPattern.test(userIdInput.value)) {
                userIdMessage.textContent = "유효한 아이디입니다.";
                userIdMessage.classList.add("valid");
                userIdMessage.classList.remove("invalid");
            } else {
                userIdMessage.textContent = "아이디는 2~12자 영문 또는 숫자여야 합니다.";
                userIdMessage.classList.add("invalid");
                userIdMessage.classList.remove("valid");
            }
        }


        function validatePassword() {
	        const passwordPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,20}$/;
	        const passwordInput = document.getElementById("pwd");
	        const passwordMessage = document.getElementById("passwordMessage");
	
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

        const pwView = document.querySelector("#pwd");
        
        document.querySelector("#ck").addEventListener('change', function() {
            if (this.checked) {
            	pwView.type = "text";
            } else {
            	pwView.type = "password";
            }
        });
        

        function validateName() {
		    const nameInput = document.getElementById("name");
		    const nameMessage = document.getElementById("nameMessage");
		    
		    const namePattern = /^[가-힣a-zA-Z]{2,10}$/;
		
		    if (namePattern.test(nameInput.value)) {
		        nameMessage.textContent = "유효한 이름입니다.";
		        nameMessage.classList.add("valid");
		        nameMessage.classList.remove("invalid");
		    } else {
		        nameMessage.textContent = "이름은 2~10글자 한글 또는 영문이어야 합니다.";
		        nameMessage.classList.add("invalid");
		        nameMessage.classList.remove("valid");
		    }
		}

        function validateSSN() {
        	const ssnPattern = /^\d{13}$/;
            const ssnInput = document.getElementById("jumin");
            const ssnMessage = document.getElementById("ssnMessage");
            
            if (ssnPattern.test(ssnInput.value)) {
                ssnMessage.textContent = "유효한 주민번호입니다.";
                ssnMessage.classList.add("valid");
                ssnMessage.classList.remove("invalid");
            } else {
                ssnMessage.textContent = "주민번호는 13자리 숫자여야 합니다.";
                ssnMessage.classList.add("invalid");
                ssnMessage.classList.remove("valid");
            }
        }

        function validateBirthday() {
            const birthdayPattern = /^\d{4}-\d{2}-\d{2}$/;
            const birthdayInput = document.getElementById("birthday");
            const birthdayMessage = document.getElementById("birthdayMessage");
            
            if (birthdayPattern.test(birthdayInput.value)) {
                birthdayMessage.textContent = "유효한 생일입니다.";
                birthdayMessage.classList.add("valid");
                birthdayMessage.classList.remove("invalid");
            } else {
                birthdayMessage.textContent = "유효한 생년월일을 입력해 주세요.";
                birthdayMessage.classList.add("invalid");
                birthdayMessage.classList.remove("valid");
            }
        }
    </script>
</body>
</html>
