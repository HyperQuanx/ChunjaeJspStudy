<%@page import="java.sql.PreparedStatement"%>
<%@page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 다중 삭제 처리</title>
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
        <h2>회원 다중 삭제 처리 결과</h2>
        <div class="message">
            <%
            String memberId = request.getParameter("delId");
            if (memberId == null || memberId.isEmpty()) {
                out.println("빈 값이거나 잘못된 값을 입력하였습니다.");
            } else {
                JDBConnect jdbc = new JDBConnect();
                
                try {
                    String sql = "DELETE FROM tbl_member WHERE memberId = ?";
                    PreparedStatement pstmt = jdbc.con.prepareStatement(sql);
                    pstmt.setString(1, memberId);

                    int result = pstmt.executeUpdate();
                    
                    if (result > 0) {
                        out.println("회원 삭제가 성공적으로 완료되었습니다.");
                    } else {
                        out.println("회원 삭제에 실패했습니다.");
                    }
                    
                } catch (Exception e) {
                    out.println("오류가 발생했습니다: " + e.getMessage());
                } finally {
                    jdbc.close();
                }
            }
            %>
        </div>
        <a href="newMList.jsp">회원 목록으로 돌아가기</a>
    </div>
</body>
</html>
