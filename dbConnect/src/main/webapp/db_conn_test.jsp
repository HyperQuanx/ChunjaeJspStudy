<%@ page import="common.JDBConnect" %>  <!-- common 패키지에 있는 JDBConnect 클래스를 가져옴 (DB 연결 클래스) -->
<%@ page import="java.sql.*" %>         <!-- JDBC 관련 클래스들을 가져옴 (Connection, Statement, ResultSet 등) -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  <!-- JSP 페이지 설정: 언어, 컨텐츠 타입, 인코딩 지정 -->
<%@ page trimDirectiveWhitespaces="true" %> <!-- 불필요한 공백을 제거하여 응답 속도를 향상시킴 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DefaultTitle</title>
<style>
	
</style>
</head>
<body>
	<h2>tbl_bbs와 tbl_member 테이블 조회 결과</h2>
	
	<%
	JDBConnect dbConnect = new JDBConnect();
	
	try {
		// 첫 번째 테이블(tbl_bbs)에서 데이터 조회하기
		dbConnect.stmt = dbConnect.con.createStatement(); // Statement 객체 생성 (SQL 쿼리 실행 준비)
		String query1 = "SELECT idx, title, memberId, regDate FROM tbl_bbs"; // tbl_bbs 테이블에서 필요한 컬럼들 선택
		dbConnect.rs = dbConnect.stmt.executeQuery(query1); // SQL 쿼리를 실행하고 결과를 ResultSet에 저장
		
		out.println("<h3>tbl_bbs 데이터:</h3>");  // tbl_bbs 테이블의 데이터를 출력할 영역 표시
        out.println("<table border='1'><tr><th>idx</th><th>title</th><th>memberId</th><th>regDate</th></tr>");  // 표의 헤더 출력
        while (dbConnect.rs.next()) { // ResultSet에 다음 행이 있을 때까지 반복
        	out.println("<tr>");  // 새로운 행 출력
            out.println("<td>" + dbConnect.rs.getInt("idx") + "</td>");  // idx 값 출력
            out.println("<td>" + dbConnect.rs.getString("title") + "</td>");  // title 값 출력
            out.println("<td>" + dbConnect.rs.getString("memberId") + "</td>");  // memberId 값 출력
            out.println("<td>" + dbConnect.rs.getTimestamp("regDate") + "</td>");  // regDate 값 출력
            out.println("</tr>");
        }
        out.println("</table>");  // tbl_bbs 데이터의 표 출력 완료
        
     // 두 번째 테이블(tbl_member)에서 데이터 조회
        String query2 = "SELECT memberId, name, regDate FROM tbl_member";  // tbl_member 테이블에서 필요한 컬럼들 선택
        dbConnect.rs = dbConnect.stmt.executeQuery(query2);  // SQL 쿼리를 실행하고 결과를 ResultSet에 저장

        out.println("<h3>tbl_member 데이터:</h3>");  // tbl_member 테이블의 데이터를 출력할 영역 표시
        out.println("<table border='1'><tr><th>memberId</th><th>name</th><th>regDate</th></tr>");  // 표의 헤더 출력
        while (dbConnect.rs.next()) {  // ResultSet에 다음 행이 있을 때까지 반복
            out.println("<tr>");  // 새로운 행 출력
            out.println("<td>" + dbConnect.rs.getString("memberId") + "</td>");  // memberId 값 출력
            out.println("<td>" + dbConnect.rs.getString("name") + "</td>");  // name 값 출력
            out.println("<td>" + dbConnect.rs.getTimestamp("regDate") + "</td>");  // regDate 값 출력
            out.println("</tr>");
        }
        out.println("</table>");  // tbl_member 데이터의 표 출력 완료
        
	} catch (Exception e) {  // 예외가 발생할 경우
        out.println("데이터 조회 중 오류 발생: " + e.getMessage());  // 오류 메시지 출력
    } finally {
        // 자원 정리: ResultSet, Statement, Connection 닫기
        dbConnect.close();
    }
	%>
</body>
</html>