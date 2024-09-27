package common;

import java.sql.Connection;          // 데이터베이스 연결을 위한 클래스
import java.sql.DriverManager;       // JDBC 드라이버 로딩 및 연결을 관리하는 클래스
import java.sql.PreparedStatement;   // SQL 쿼리를 실행할 때 사용되는 클래스 (파라미터화된 쿼리)
import java.sql.ResultSet;           // 쿼리 결과를 저장하는 클래스
import java.sql.Statement;           // SQL 쿼리를 실행할 때 사용되는 클래스

public class JDBConnect {
	// 데이터베이스 연결 및 작업을 위한 객체들 선언
    public Connection con;           // DB 연결 객체
    public Statement stmt;           // SQL 쿼리 실행을 위한 객체
    public PreparedStatement pstm;   // 파라미터화된 쿼리를 실행하기 위한 객체
    public ResultSet rs;             // 쿼리 실행 결과를 저장하는 객체
	
	// 기본 생성자 : MariaDB 연결 설정
	public JDBConnect() {
		try {
			// 1. JDBC 드라이버 로딩 (MariaDB의 JDBC 드라이버)
            Class.forName("org.mariadb.jdbc.Driver");
            
            // 2. 데이터베이스 연결 설정
            String url = "jdbc:mariadb://localhost:3306/testdb";  // 데이터베이스 URL (DBMS 주소 및 데이터베이스 이름)
            String id = "root";                                  // 데이터베이스 사용자 이름
            String pwd = "1234";                                 // 데이터베이스 비밀번호
            
            // 3. DriverManager를 통해 데이터베이스에 연결 (Connection 객체 생성)
            con = DriverManager.getConnection(url, id, pwd);
            
            // 4. 연결 성공 시 메시지 출력
            System.out.println("DB 연결 성공!");
		} catch (Exception e) {
			// 5. 예외 발생 시 오류 메시지 출력
			e.printStackTrace();
			System.out.println("DB 연결 실패 : " + e.getMessage());
		}
	}
	
	// 자원 정리 메서드 : 데이터베이스 연결을 닫는 역할
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
        } catch (Exception e) {
            // 10. 자원 정리 중 예외 발생 시 오류 메시지 출력
            e.printStackTrace();
        }
    }
}