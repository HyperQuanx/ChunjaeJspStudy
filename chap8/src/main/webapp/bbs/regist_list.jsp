<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<style>
    /* 기본 바디 스타일 */
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        color: #333;
    }

    h2 {
        color: #478abc;
        text-align: center;
        padding: 20px;
        font-size: 28px;
        margin-top: 20px;
    }
	
	.err {
		color: #478abc;
        text-align: center;
        padding: 20px;
        font-size: 20px;
        margin-top: 20px;
	}
	
    form {
        width: 80%;
        max-width: 600px;
        margin: 20px auto;
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    }

    form input[type="text"],
    form textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
        font-size: 16px;
        box-sizing: border-box;
    }

    form input[type="text"]::placeholder,
    form textarea::placeholder {
        color: #bbb;
    }

    /* 텍스트박스와 텍스트에어리어 */
    form input[type="text"]:focus,
    form textarea:focus {
        outline: none;
        border-color: #478abc;
        box-shadow: 0 0 5px rgba(71, 138, 188, 0.5);
    }

    /* 텍스트에어리어 스타일 */
    form textarea {
        height: 150px;
        resize: vertical;
    }

    /* 버튼 스타일 */
    form input[type="submit"] {
        background-color: #478abc;
        color: white;
        border: none;
        padding: 12px 20px;
        font-size: 16px;
        border-radius: 5px;
        cursor: pointer;
        width: 100%;
    }

    form input[type="submit"]:hover {
        background-color: #356a99;
    }

    /* 반응형 스타일 */
    @media (max-width: 768px) {
        form {
            width: 90%;
        }

        h2 {
            font-size: 24px;
        }
    }
</style>
</head>
<body>
	<h2>글 작성</h2>
	<div class="err">존재하는 아이디를 넣으시길 바랍니다.</div>
	<form action="regist_list_Ok.jsp" method="post">
		<input type="text" name="memberId" id="memberId" placeholder="작성자 아이디" />
		<input type="text" name="title" id="title" placeholder="글 제목" />
		<textarea name="content" id="content" placeholder="글 내용을 입력하세요"></textarea>
		<input type="submit" value="글 등록" />
	</form>
</body>
</html>
