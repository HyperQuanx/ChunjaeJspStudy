<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록 처리</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        text-align: center;
    }

    h2 {
        color: #478abc;
    }

    .message {
        font-size: 16px;
        margin-bottom: 20px;
    }

    a {
        color: #5b9fd6;
        text-decoration: none;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>회원 등록 처리 결과</h2>
        <div class="message">
            <%
            // 폼에서 전달된 데이터 받기
            String memberId = request.getParameter("member_id");
            String name = request.getParameter("name");
            String pwd = request.getParameter("pwd");
            String regDate = request.getParameter("regDate");

            if (memberId == null || memberId.isEmpty() || name == null || name.isEmpty() || pwd == null || pwd.isEmpty()) {
                out.println("모든 필드를 입력해야 합니다.");
            } else {
                // DB 연결
                JDBConnect jdbc = new JDBConnect();
                
                try {
                    // SQL 쿼리 준비
                    String sql = "INSERT INTO tbl_member (memberId, name, pwd, regDate) VALUES (?, ?, ?, ?)";
                    PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
                    pstmt.setString(1, memberId);
                    pstmt.setString(2, name);
                    pstmt.setString(3, pwd);
                    pstmt.setString(4, regDate);

                    // SQL 실행
                    int result = pstmt.executeUpdate();
                    
                    // 결과 확인
                    if (result > 0) {
                        out.println("회원 등록이 성공적으로 완료되었습니다.");
                    } else {
                        out.println("회원 등록에 실패했습니다.");
                    }
                    
                } catch (Exception e) {
                    out.println("오류가 발생했습니다: " + e.getMessage());
                } finally {
                    // DB 연결 닫기
                    jdbc.close();
                }
            }
            %>
        </div>
        <a href="newMList.jsp">회원 목록으로 돌아가기</a>
    </div>
</body>
</html>
