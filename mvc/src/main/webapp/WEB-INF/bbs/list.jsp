<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 목록</title>
    <style>
		body {
		    font-family: 'Roboto', sans-serif;
		    background-color: #f4f7f9;
		    color: #333;
		    margin: 0;
		    padding: 20px;
		}
		
		h1 {
		    text-align: center;
		    color: #333;
		    font-size: 2.5rem;
		    margin-bottom: 20px;
		}
		
		/* 테이블 스타일 */
		table {
		    width: 100%;
		    border-collapse: collapse;
		    background-color: #fff;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    margin-bottom: 30px;
		}
		
		table thead {
		    background-color: #007bff;
		    color: white;
		}
		
		table th, table td {
		    padding: 15px;
		    text-align: center;
		    border-bottom: 1px solid #ddd;
		}
		
		table th {
		    font-size: 1.2rem;
		    font-weight: bold;
		}
		
		table td {
		    font-size: 1rem;
		    color: #333;
		}
		
		table tr:hover {
		    background-color: #f1f1f1;
		    cursor: pointer;
		}
		
		/* 페이지네이션 스타일 */
		div {
		    text-align: center;
		    margin-top: 20px;
		}
		
		div a {
		    display: inline-block;
		    padding: 10px 15px;
		    margin: 0 5px;
		    font-size: 1rem;
		    color: #007bff;
		    text-decoration: none;
		    border-radius: 5px;
		    transition: background-color 0.3s ease, color 0.3s ease;
		    border: 1px solid #007bff;
		}
		
		div a:hover {
		    background-color: #007bff;
		    color: white;
		}
		
		div strong {
		    display: inline-block;
		    padding: 10px 15px;
		    margin: 0 5px;
		    font-size: 1rem;
		    background-color: #007bff;
		    color: white;
		    border-radius: 5px;
		}
		
		.loginButton {
			display: flex;
			justify-content: space-between;
			margin-top: 20px;
			margin-right: 30px;
		}
    	
    </style>
</head>
<body>
    <div class="loginButton">
	    <div>
	    	<span></span>
			<a href="<%= request.getContextPath() %>/bbs/regist.do" id="registPost">글 등록</a>
	    </div>
		<div>
			<span id="userName"></span>
			<a href="#" id="logBtn">로그인</a>
		</div>
	</div>
    <h1>게시글 목록</h1>
    <table border="1">
        <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="bbs" items="${list}">
                <tr>
                    <td>${bbs.idx}</td>
                    <td>${bbs.title}</td>
                    <td><a href="view.do?idx=${bbs.idx}">${bbs.memberId}</a></td>
                    <td>${bbs.regDate}</td>
                    <td>${bbs.readCnt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <!-- 페이지네이션 -->
    <div>
        <c:if test="${totalPages > 1}">
            <c:forEach var="page" begin="1" end="${totalPages}">
                <c:choose>
                    <c:when test="${page == currentPage}">
                        <strong>${page}</strong>
                    </c:when>
                    <c:otherwise>
                        <a href="?page=${page}">${page}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </c:if>
    </div>
    <script>
	    const name = "<%= (String) request.getSession().getAttribute("name") %>";
	    console.log(name);
	    const logBtn = document.querySelector("#logBtn");
	    const userName = document.querySelector("#userName");
	
	    document.querySelector("#registPost").addEventListener("click", (e) => {
	        if (name == "null") {
	            e.preventDefault();
	            alert("로그인 이후 사용할 수 있습니다.");
	            window.location.href = "<%= request.getContextPath() %>/member/login.do";
	        }
	    });
		
	    if (name == "null") {
	    	logBtn.textContent = "로그인";
	        logBtn.href = "<%= request.getContextPath() %>/pagem.do?ove=mb-login";
	    } else {
	        logBtn.textContent = "로그아웃";
	        userName.textContent = "<%= (String) request.getSession().getAttribute("name") %>";
	        logBtn.href = "#";
	        logBtn.addEventListener("click", (e) => {
	            e.preventDefault();
	            alert("로그아웃되었습니다.");
	            window.location.href = "<%= request.getContextPath() %>/member/logout.do";
	        });
	    }
	</script>
</body>
</html>
