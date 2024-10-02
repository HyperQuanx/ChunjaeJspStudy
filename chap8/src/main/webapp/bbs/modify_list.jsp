<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
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
	
	/* 버튼 스타일 */
	.button-group {
	    text-align: center;
	    margin-top: 20px;
	}
	
	.button-group a {
	    text-decoration: none;
	    color: white;
	    background-color: #478abc;
	    padding: 10px 20px;
	    border-radius: 5px;
	    font-size: 14px;
	    margin: 5px;
	    display: inline-block;
	    transition: background-color 0.3s ease;
	}
	
	.button-group a:hover {
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
}
	
</style>
</head>
<body>
	<h2>유저 상세글</h2>
	<%
      String idx = request.getParameter("idx");
	  BbsDTO dto = null;
	  
      try {
    	BbsDAO dao = new BbsDAO();
    	dto = dao.getBoard(idx);
      	if (dto != null) {
    %>
	    <div class="cCenter">
		    <div class="mainTop">
			    <form action="modify_list_Ok.jsp" method="post">
				    <ul>
				    	<li><%= dto.getMemberId() %></li>
				    	<li>조회수 : <%= dto.getReadCnt() %></li>
				    </ul>
				    <div class="contentBox">
				    	<h3>제목</h3>
				    	<input type="text" name="title" id="title" value="<%= dto.getTitle() %>" />
				    	<h3>본문</h3>
				    	<textarea name="content" id="content"><%= dto.getContent() %></textarea>
				    </div>
				    <div class="footer">
				    	작성일 : <%= dto.getRegDate() %>
				    </div>
				    <input type="hidden" name="memberId" value="<%= dto.getMemberId() %>" />
    				<input type="hidden" name="idx" value="<%= dto.getIdx() %>" />
				    <input type="submit" value="수정" />
			    </form>
		    </div>
	    </div>
    <div class="button-group">
    	<a class="back-btn" href="javascript:history.back()">취소</a>
    </div>
    <%
      	}
      	dao.close();
      } catch(Exception e) {
    	  e.getMessage();
      }
    %>
	
</body>
</html>