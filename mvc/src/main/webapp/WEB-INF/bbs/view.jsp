<%@page import="net.fullstack7.cmt.CommentDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
<style>
	body {
	    font-family: Arial, sans-serif;
	    background-color: #f9f9f9;
	    color: #333;
	    margin: 0;
	    padding: 0;
	}
	
	h2 {
	    color: #478abc;
	    text-align: center;
	    padding: 20px 0;
	}
	
	.mainTop {
	    max-width: 800px;
	    background-color: white;
	    border: 1px solid #ddd;
	    border-radius: 8px;
	    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	    margin-top: 20px;
	}
	
	ul {
		list-style-type: none;
	    padding: 0;
	    margin: 0 auto;
	}
	
	ul li {
	    padding: 15px;
	    border-bottom: 1px solid #ddd;
	    text-align: left;
	    font-size: 16px;
	}
	
	ul li:last-child {
	    border-bottom: none;
	}
	
	ul li:first-child {
	    font-weight: bold;
	    color: #478abc;
	}
	
	ul li:nth-child(2) {
	    color: #666;
	}
	
	.button-group {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.button-group a, button, #postBtn{
	    text-decoration: none;
	    color: white;
	    background-color: #478abc;
	    padding: 10px 20px;
	    border-radius: 5px;
	    font-size: 14px;
	    margin: 5px;
	    display: inline-block;
	    transition: background-color 0.3s ease;
	    border: none;
	    cursor: pointer;
	}
	
	.button-group a:hover, button:hover, #postBtn:hover {
	    background-color: #356a99;
	}
	
	.contentBox {
		margin-top: 20px;
		padding: 20px;
	}
	
	.footer {
		padding: 20px;
	}
	
	@media screen and (max-width: 768px) {
	    .mainTop {
	        width: 95%;
	    }
	
	    h2 {
	        font-size: 18px;
	    }
	
	    ul li {
	        font-size: 14px;
	    }
	
	    .button-group a {
	        font-size: 12px;
	        padding: 8px 16px;
	    }
	    
	    .cCenter {
	    	width: 100%;
	    	display: flex;
	    	justify-content: center;
	    }
	    
	    #edit {
	    	position: relative;
	    }
	}
</style>
</head>
<body>
	<div id="view">
		<h2>게시글 상세</h2>

	    <%
	    BbsDTO dto = (BbsDTO) request.getAttribute("vL"); 
	    %>
	
	    <div class="cCenter">
			<div class="mainTop">
				<div>
					<p>인덱스 : <%= dto.getIdx() %></p>
					<p>아이디 : <%= dto.getMemberId() %></p>
					<p>제목 : <%= dto.getTitle() %></p>
					<div>
					    콘텐츠 : <%= dto.getContent() %>
					    <img src="<%= dto.getFilePath() != null ? request.getContextPath() + "/uploads/" + dto.getFileName() : request.getContextPath() + "/uploads/defaultImg.png" %>">
					</div>
					<p>노출일 : <%= dto.getDisplayDate() %></p>
					<p>등록일 : <%= dto.getRegDate() %></p>
					<p>수정일 : <%= dto.getModifyDate() %></p>
					<p>조회수 : <%= dto.getReadCnt() %></p>
					<p>파일 이름 : <%= dto.getFileName() %></p>
					<p>파일 카테고리 : <%= dto.getFileCategory() != null ? dto.getFileCategory() : "분류 안됨" %></p>
				</div>
			</div>
		</div>
		
	    <br/>
	    
	    <div class="comment-section">
        <h3>댓글</h3>
        <form action="<%= request.getContextPath() %>/cmt/comment.do" method="post">
            <input type="hidden" name="bbsIdx" value="<%= dto.getIdx() %>">
            <textarea name="commentContent" placeholder="댓글을 입력하세요" rows="4" cols="50" required></textarea>
            <br/>
            <input type="submit" value="댓글 작성" class="back-btn">
        </form>

        <hr/>

        <div class="comment-list">
		    <h4>댓글 목록</h4>
		    <ul>
		        <% 
		            List<CommentDTO> commentList = (List<CommentDTO>) request.getAttribute("commentList");
		            if (commentList != null && !commentList.isEmpty()) {
		                for (CommentDTO comment : commentList) {
		        %>
		            <li>
		                <strong><%= comment.getMemberId() %></strong>: <%= comment.getContent() %>
		                <br/>
		                <small>작성일: <%= comment.getRegDate() %></small>
		                <a href="<%= request.getContextPath() %>/comment/edit.do?idx=<%= comment.getIdx() %>">수정</a> |
		                <a href="<%= request.getContextPath() %>/comment/delete.do?idx=<%= comment.getIdx() %>&bbsIdx=<%= dto.getIdx() %>" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
		            </li>
		        <% 
		                }
		            } else { 
		        %>
		            <li>댓글이 없습니다.</li>
		        <% 
		            } 
		        %>
		    </ul>
		</div>
    
    	<br />
	    
	    <div class="button-group">
	    	<button class="back-btn" onClick="editBtn()">수정하기</button>
	    	<a class="back-btn" href="./list.do">메인으로 돌아가기</a>
	    	<button class="back-btn" onclick="confirmDelete(<%= dto.getIdx() %>)">삭제하기</button>
	    </div>
	</div>
	
	
	
	
	<div id="edit">
		<h2>게시글 수정</h2>
	
	    <div class="cCenter">
			<div class="mainTop">
				<form action="<%= request.getContextPath() %>/bbs/edit.do?idx=<%= dto.getIdx() %>" method="POST">
					<label for="title">제목: </label>
					<input type="text" id="title" name="title" value="<%= dto.getTitle() %>" /><br/>
				
					<label for="content">콘텐츠: </label>
					<textarea id="content" name="content"><%= dto.getContent() %></textarea><br/>
				
					<label for="displayDate">노출일: </label>
					<input type="date" id="displayDate" name="displayDate" value="<%= dto.getDisplayDate() %>" /><br/>
				
					<label for="fileName">파일 이름: </label>
					<input type="text" id="fileName" name="fileName" value="<%= dto.getFileName() %>" /><br/>
				
					<label for="fileCategory">파일 카테고리: </label>
					<input type="text" id="fileCategory" name="fileCategory" value="<%= dto.getFileCategory() != null ? dto.getFileCategory() : "분류 안됨" %>" /><br/>
					
					<div class="button-group">
						<input type="submit" value="수정하기" id="postBtn"/>
				    	<button class="back-btn" onClick="editBtn()">취소하기</button>	    	
					</div>
				</form>
			</div>
		</div>
	</div>
	
    
    <script>
		function confirmDelete(idx) {
		    let result = confirm("정말 삭제하시겠습니까?");
		    if (result) {
		        window.location.href = "./delete.do?idx=<%= dto.getIdx() %>";
		    } else {
		        alert("삭제가 취소되었습니다.");
		    }
		}
		
	</script>
</body>
</html>