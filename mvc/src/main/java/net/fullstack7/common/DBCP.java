package net.fullstack7.common;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCP {
    public Connection con;

    // DBCP 연결 메서드
    public DBCP() {
        try {
            Context initCtx = new InitialContext();
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            DataSource ds = (DataSource) ctx.lookup("jdbc_fullstack7");
            con = ds.getConnection();
            
            System.out.println("===================================================");
            System.out.println("DB커넥션풀 접속 성공");
            System.out.println("con1 String : " + con);
            System.out.println("===================================================");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("===================================================");
            System.out.println("DB커넥션풀 접속 실패");
            System.out.println("에러메세지: " + e.getMessage());
            System.out.println("===================================================");
        }
    }

    // 데이터베이스 연결 객체를 반환하는 메서드
    public Connection getConnection() {
        return con;
    }

    // 연결 해제 (리소스 자원 반납)
    public void close() {
        try {
            if (con != null) con.close();
            System.out.println("===================================================");
            System.out.println("JDBC 자원 해제");
            System.out.println("===================================================");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("===================================================");
            System.out.println("에러메세지: " + e.getMessage());
            System.out.println("===================================================");
        }
    }
}
