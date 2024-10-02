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
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");
    String jumin = request.getParameter("jumin");
    String addr1 = request.getParameter("addr1");
    String addr2 = request.getParameter("addr2");
    String birthday = request.getParameter("birthday");
    String message = "";

    String loginErrMsg = null;

    if (memberId == null || memberId.trim().isEmpty() || pwd == null || pwd.trim().isEmpty()) {
        loginErrMsg = "아이디와 패스워드를 입력하세요.";
        request.setAttribute("LoginErrMsg", loginErrMsg);
        request.getRequestDispatcher("signUp.jsp").forward(request, response);
        return;
    }
	
    try {
	    MemberDAO dao = new MemberDAO();
	    dao.setMemberRegist(memberId, name, pwd, jumin, addr1, addr2, birthday);
        message = "축하드립니다! 회원가입에 성공하셨습니다. ^_^ ♨";
        dao.close();
    } catch(Exception e) {
    	e.getStackTrace();
    }
%>
    <script>
        alert("<%= message %>");
        <% if ("축하드립니다! 회원가입에 성공하셨습니다. ^_^ ♨".equals(message)) { %>
            window.location.href = "signIn.jsp";
        <% } %>
    </script>
</body>
</html>
