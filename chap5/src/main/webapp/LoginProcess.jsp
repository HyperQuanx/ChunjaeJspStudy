<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="common.JDBConnect" %>
<%
    // 입력된 로그인 정보 가져오기
    String userId = request.getParameter("user_id");
    String userPw = request.getParameter("user_pw");

    // 에러 메시지를 담을 변수
    String loginErrMsg = null;

    if (userId == null || userId.trim().isEmpty() || userPw == null || userPw.trim().isEmpty()) {
        loginErrMsg = "아이디와 패스워드를 입력하세요.";
        request.setAttribute("LoginErrMsg", loginErrMsg);
        request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
        return;
    }

    JDBConnect dbConn = new JDBConnect();

    try {
        String query = "SELECT memberId, pwd FROM tbl_member WHERE memberId = ? AND pwd = ?";
        
        PreparedStatement pstmt = dbConn.con.prepareStatement(query);
        pstmt.setString(1, userId);
        pstmt.setString(2, userPw);
        
        ResultSet rs = pstmt.executeQuery();
        
        if (rs.next()) {
            session.setAttribute("UserId", userId);
            session.setAttribute("UserName", rs.getString("memberId")); // 사용자 이름 대신 ID를 세션에 저장
            response.sendRedirect("LoginForm.jsp"); // 성공 후 이동할 페이지
        } else {
            loginErrMsg = "아이디 또는 패스워드가 잘못되었습니다.";
            request.setAttribute("LoginErrMsg", loginErrMsg);
            request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
        }
    } catch (Exception e) {
        e.printStackTrace();
        loginErrMsg = "로그인 처리 중 오류가 발생했습니다.";
        request.setAttribute("LoginErrMsg", loginErrMsg);
        request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
    } finally {
        // DB 리소스 해제
        dbConn.close();
    }
%>
