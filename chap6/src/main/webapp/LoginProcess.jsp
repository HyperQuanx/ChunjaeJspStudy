<%@ page import="fullstack7.member.MemberDTO" %>
<%@ page import="fullstack7.member.MemberDAO" %>
<%@ page import="common.DBConnPool" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String userId = request.getParameter("user_id");
    String userPw = request.getParameter("user_pw");
    String idSave = request.getParameter("idSave");

    String loginErrMsg = null;

    if (userId == null || userId.trim().isEmpty() || userPw == null || userPw.trim().isEmpty()) {
        loginErrMsg = "아이디와 패스워드를 입력하세요.";
        request.setAttribute("LoginErrMsg", loginErrMsg);
        request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
        return;
    }

    // DAO 객체를 사용하여 회원 정보를 조회
    MemberDAO dao = new MemberDAO();
    MemberDTO memberDTO = dao.getMemberInfo(userId, userPw);

    if (memberDTO != null) {
        // 로그인 성공 시 세션에 정보 저장
        session.setAttribute("UserId", memberDTO.getMemberId());
        session.setAttribute("UserName", memberDTO.getName());

        // 아이디 저장이 체크되어 있으면 쿠키에 저장
        if ("on".equals(idSave)) {
            Cookie userIdCookie = new Cookie("userId", memberDTO.getMemberId());
            userIdCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(userIdCookie);
        } else {
            // 체크되지 않았으면 쿠키 삭제
            Cookie userIdCookie = new Cookie("userId", null);
            userIdCookie.setMaxAge(0); // 쿠키 삭제
            response.addCookie(userIdCookie);
        }

        // 로그인 성공 후 메인 페이지로 이동
        response.sendRedirect("LoginForm.jsp");
    } else {
        // 로그인 실패 시
        loginErrMsg = "아이디 또는 패스워드가 잘못되었습니다.";
        request.setAttribute("LoginErrMsg", loginErrMsg);
        request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
    }
%>
