<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300;400;700&display=swap" rel="stylesheet">
<title>게시판 목록 조회</title>
<meta charset="UTF-8">
<style>
	body {
        font-family: "Dongle", sans-serif;
  		font-weight: 400;
  		font-style: normal;
        background-color: #f0f4f8;
        color: #333;
        margin: 0;
        font-size: 30px;
    }
	
	.center {
		width:100vw;
	}
	
	.cCenter {
		font-size:40px;
		display: flex;
  		justify-content: center;
	}
	
	table {
		border-collapse: collapse;
		width: 100%;
		max-width: 800px;
		margin: 20px auto;
		font-family: Arial, sans-serif;
	}
	th {
		border-top: 1px solid #333;
		padding: 10px;
		text-align: center;
		background-color: #f2f2f2;
		font-weight: bold;
		font-family: "Dongle", sans-serif;
  		font-weight: 400;
  		font-style: normal;
	}
	td {
		border-bottom: 1px solid #F4F4F4;
		padding: 10px;
		text-align: center;
		background-color: #fafafa;
		width: 250px;
		height: 30px;
		font-family: "Dongle", sans-serif;
  		font-weight: 400;
  		font-style: normal;
	}
	.input_title {
		width: 120px;
		font-weight: bold;
	}
	.input_col input {
		width: 95%;
		padding: 5px;
		border: 1px solid #ccc;
		border-radius: 4px;
	}
	input[type="button"] {
		background-color: #478abc;
		color: white;
		border: none;
		padding: 10px 20px;
		cursor: pointer;
		font-size: 14px;
		margin-right: 10px;
		border-radius: 4px;
	}
	input[type="button"]:hover {
		background-color: #5b9fd6;
	}
	td[colspan="4"] {
		text-align: center;
		font-size: 14px;
		color: #555;
		padding: 15px 0;
		padding-right: 0px;
	}
	@media screen and (max-width: 800px) {
		table {
			width: 100%;
		}
		.input_title {
			font-size: 14px;
		}
		.input_col input {
			width: 100%;
		}
		input[type="button"] {
			width: 100%;
			margin-bottom: 10px;
		}
		td[colspan="4"] {
			font-size: 12px;
		}
	}
	a {
		text-decoration: none;
		color: #478abc;
	}
	a:hover {
		font-size: 20px;
		font-weight: bold;
	}
	#pageArr a {
		text-decoration: none;
		color: black;
	}
	#pageArr a:hover {
		font-size: 20px;
		font-weight: bold;
	}
</style>
</head>
<body>
<div>

	<%
		BbsDAO dao = new BbsDAO();
		BbsDTO dto = new BbsDTO();
		
		String pageParam = request.getParameter("page");
		String searchTypeParam = request.getParameter("searchType");
		if (searchTypeParam == null || searchTypeParam.isEmpty()) {
		    searchTypeParam = "memberId";
		}
		
		String searchValueParam = (searchTypeParam != null) ? request.getParameter(searchTypeParam) : "";
		
		Integer pageNum = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
		Integer nowPageNum = (pageNum - 1) * 50;
		
		List<BbsDTO> searchList = dao.searchBoard(searchTypeParam, searchValueParam);
		int count = searchList.size();
		int startIdx = nowPageNum;
        int endIdx = Math.min(nowPageNum + 50, count);
        
        List<BbsDTO> paginatedList = searchList.subList(startIdx, endIdx);
        dao.close();
	%>
	
	<div class="center">
		<div class="cCenter">
			<h3>현재 <%= pageNum %> 페이지</h3>
		</div>
		<div class="cCenter">
			<h2>게시판 검색</h2>
		</div>
	</div>
	<table>
		<thead>
			<tr>
				<th colspan="2">글제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<%
			for (BbsDTO search : paginatedList) {
			%>
			<tr>
				<td><%= search.getIdx() %></td>
				<td><a href="view_list.jsp?idx=<%= search.getIdx() %>"><%= search.getTitle() %></a></td>
				<td><%= search.getMemberId() %></td>
				<td><%= search.getRegDate() %></td>
				<td><%= search.getReadCnt() %></td>
			</tr>
			<%
			}
			%>	
			<tr>
				<td colspan="5" style="text-align: center">
					<div id="pageArr"></div>
				</td>
			</tr>
			<tr>
				<td colspan="5">
					<a href="list.jsp?page=1">메인으로 돌아가기</a>
				</td>
			</tr>
		</tbody>
	</table>
	
	<script>
		let pageTotal = <%= count %>;
		let pageCnt = Math.ceil(pageTotal / 50);
		
		let pageArr = document.querySelector("#pageArr");
		
		for (let i = 1; i <= pageCnt; i++) {
			let span = document.createElement("span");
			span.innerHTML = '<a href="?page=' + i + '" id="btnPage' + i + '">[' + i + ']</a>&nbsp;';
			pageArr.appendChild(span);
		}
		
		let nowPage = document.querySelector('#btnPage' + <%= pageNum %>);
		if (nowPage) {
			nowPage.style.color = "#478abc";
		}
	</script>
</div>
</body>
</html>
