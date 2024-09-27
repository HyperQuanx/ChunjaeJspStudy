package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
    public Statement stmt;
    public PreparedStatement pstm;
    public ResultSet rs; 
    
    public DBConnPool() {
    	try {
    		Context initCtx = new InitialContext();
    		Context ctx = (Context)initCtx.lookup("java:comp/env");
    		DataSource ds = (DataSource)ctx.lookup("jdbc_fullstack7");
    		con = ds.getConnection();
    		
    		System.out.println("=======================");
			System.out.println("DB 커넥션풀 접속 성공(커넥션풀)");
			System.out.println("con1 String : " + con);
			System.out.println("=======================");
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.out.println("=======================");
			System.out.println("DB 커넥션풀 접속 연결 실패(커넥션풀)");
			System.out.println(e.getMessage());
			System.out.println("=======================");
    	}
    }
    
    public void close() {
        try {
            // 6. ResultSet 객체 닫기 (쿼리 결과를 저장하던 객체)
            if (rs != null) rs.close();
            // 7. Statement 객체 닫기 (SQL 쿼리 실행 객체)
            if (stmt != null) stmt.close();
            // 8. PreparedStatement 객체 닫기 (파라미터화된 쿼리 실행 객체)
            if (pstm != null) pstm.close();
            // 9. Connection 객체 닫기 (DB 연결 종료)
            if (con != null) con.close();
            System.out.println("=====================================");
			System.out.println("JDBC 자원 해제");
			System.out.println("=====================================");
        } catch (Exception e) {
            // 10. 자원 정리 중 예외 발생 시 오류 메시지 출력
            e.printStackTrace();
            System.out.println("=====================================");
			System.out.println("Error : " + e.getMessage());
			System.out.println("=====================================");
        }
    }
}
