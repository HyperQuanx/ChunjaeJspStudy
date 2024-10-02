<%@page import="net.fullstack7.member.MemberDTO"%>
<%@page import="net.fullstack7.member.MemberDAO"%>
<%@page import="net.fullstack7.bbs.BbsDAO"%>
<%@page import="net.fullstack7.bbs.BbsDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공? or 실패?</title>
</head>
<body>
<%
    String memberId = request.getParameter("memberId");
    String pwd = request.getParameter("pwd");
    String idSave = request.getParameter("idSave");
    String message = "";
	boolean bol = false;
    String loginErrMsg = null;

    if (memberId == null || memberId.trim().isEmpty() || pwd == null || pwd.trim().isEmpty()) {
        loginErrMsg = "아이디와 패스워드를 입력하세요.";
        request.setAttribute("LoginErrMsg", loginErrMsg);
        request.getRequestDispatcher("signUp.jsp").forward(request, response);
        return;
    }
	
    try {
	    MemberDAO dao = new MemberDAO();
	    MemberDTO loginSuccess = dao.getMemberInfo(memberId, pwd);
	    
	    if (loginSuccess != null) {
	        session.setAttribute("UserId", loginSuccess.getMemberId());
	        session.setAttribute("UserName", loginSuccess.getName());
	        
	     	// 아이디 저장이 체크되어 있으면 쿠키에 저장
	        if ("on".equals(idSave)) {
	            Cookie userIdCookie = new Cookie("userId", loginSuccess.getMemberId());
	            userIdCookie.setMaxAge(60 * 60 * 24);
	            response.addCookie(userIdCookie);
	        } else {
	            // 체크되지 않았으면 쿠키 삭제
	            Cookie userIdCookie = new Cookie("userId", null);
	            userIdCookie.setMaxAge(0); // 시간 0초로 만들어서 쿠키 부셔버리기
	            response.addCookie(userIdCookie);
	        }
    	    message = "어서오세요 " + loginSuccess.getName() + "님! ^_^ ♨";
    	    bol = !bol;
	        dao.close();
	    }
    } catch(Exception e) {
    	e.getStackTrace();
    }
%>
    <script>
        alert("<%= message %>");
        <% if (bol) { %>
            window.location.href = "list.jsp";
        <% } %>
    </script>
</body>
</html>
