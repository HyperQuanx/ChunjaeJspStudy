package net.fullstack7.common;
import java.sql.*;
import jakarta.servlet.ServletContext;

public class JDBConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstm;
	public ResultSet rs;
	//기본생성자
	public JDBConnect() {
		try {
			// 1. DBC드라이버를 로딩
			Class.forName("org.mariadb.jdbc.Driver");
			// 2. DB에 연결
			// 2.1 주소 URL 설정
			// 2.2 데이터베이스 접속 아이디
			// 2.3 비밀번호
			String url = "jdbc:mariadb://localhost:3306/fullstack7";
			String id = "root";
			String pwd = "1234";
			
			// 2.4 드라이버 매니저 이용
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("===================================================");
			System.out.println("DB접속 성공(기본생성자)");
			System.out.println("con1 String : " + con);
			System.out.println("===================================================");
		}catch(Exception e) {
			System.out.println("===================================================");
			System.out.println("DB접속 에러(기본생성자)");
			System.out.println("에러메세지 " + e.getMessage());
			System.out.println("===================================================");
		}
	}
	
	// 두번째 생성자
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {
			//JDBC드라이버를 로딩
			Class.forName(driver);
			//DB에 연결
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("===================================================");
			System.out.println("DB접속 성공(매개변수 생성자)");
			System.out.println("con2 String : " + con);
			System.out.println("===================================================");
		}catch(Exception e) {
			System.out.println("===================================================");
			System.out.println("DB접속 에러(매개변수 생성자)");
			System.out.println("에러메세지 " + e.getMessage());
			System.out.println("===================================================");
		}
	}
	
	// 세번째 생성자
	public JDBConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("MariaDriver");
			String url = application.getInitParameter("MariaURL");
			String id = application.getInitParameter("dbId");
			String pwd = application.getInitParameter("dbPwd");
			//JDBC드라이버를 로딩
			Class.forName(driver);
			//DB에 연결
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("===================================================");
			System.out.println("DB접속 성공(매개변수 생성자2)");
			System.out.println("con2 String : " + con);
			System.out.println("===================================================");
		}catch(Exception e) {
			System.out.println("===================================================");
			System.out.println("DB접속 에러(매개변수 생성자2)");
			System.out.println("에러메세지 " + e.getMessage());
			System.out.println("===================================================");
		}
	}
	// 연결 해제(리소스 자원 반납)
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstm != null) pstm.close();
			if(stmt != null) stmt.close();
			if(con != null) con.close();
			System.out.println("===================================================");
			System.out.println("JDBC자원해제");
			System.out.println("===================================================");
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("===================================================");
			System.out.println("에러메세지 " + e.getMessage());
			System.out.println("===================================================");
		}

	}
}

