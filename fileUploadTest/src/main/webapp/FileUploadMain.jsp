<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>FileUpload</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h3 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }

        form {
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            box-sizing: border-box;
        }

        form span {
            color: red;
            font-size: 14px;
            display: block;
            text-align: center;
            margin-bottom: 10px;
        }

        form input[type="text"],
        form input[type="file"] {
            width: calc(100% - 10px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
        }

        form input[type="checkbox"] {
            margin-right: 5px;
            accent-color: #007BFF; /* 체크박스 색상 변경 */
        }

        form label {
            display: inline-block;
            margin-right: 10px;
            font-size: 14px;
            color: #555;
        }

        form input[type="submit"] {
            background: #007BFF;
            color: #fff;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        form input[type="submit"]:hover {
            background: #0056b3;
        }

        form .checkbox-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<script>
    function validateForm(form) { 
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.ofile.value == "") {
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<body>
    <form name="fileForm" method="post" enctype="multipart/form-data"
          action="UploadProcess.do" onsubmit="return validateForm(this);">        
        <h3>파일 업로드</h3>
        <span>${errorMessage}</span>
        
        제목 : <input type="text" name="title" placeholder="제목을 입력하세요" /><br />

        <div class="checkbox-group">
            카테고리(선택사항) : 
            <br />
            <label><input type="checkbox" name="cate" value="사진" />사진</label>
            <label><input type="checkbox" name="cate" value="워드" />워드</label>
            <label><input type="checkbox" name="cate" value="영상" />영상</label>
            <label><input type="checkbox" name="cate" value="문서" />문서</label>
            <label><input type="checkbox" name="cate" value="음원" />음악</label>
        </div>
        
        첨부파일 : <input type="file" name="ofile" /><br />
        
        <input type="submit" value="전송하기" />
    </form>
</body>
</html>
