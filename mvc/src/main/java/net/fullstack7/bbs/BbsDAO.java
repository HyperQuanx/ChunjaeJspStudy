package net.fullstack7.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


import net.fullstack7.common.DBCP;

public class BbsDAO extends DBCP {
    
    // DBCP에게 상속 받기
    public BbsDAO() {
        super();
    }

    // 게시글 등록
    public int regist(BbsDTO dto) {
        String sql = "INSERT INTO tbl_bbs (memberId, title, content, displayDate, filePath, fileName, fileExt, fileSize, fileCategory) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        int resultSet = 0;

        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {

            // PreparedStatement에 파라미터 설정
            pstm.setString(1, dto.getMemberId());
            pstm.setString(2, dto.getTitle());
            pstm.setString(3, dto.getContent());
            pstm.setString(4, dto.getDisplayDate() != null ? dto.getDisplayDate() : ""); // null 처리
            pstm.setString(5, dto.getFilePath() != null ? dto.getFilePath() : "");
            pstm.setString(6, dto.getFileName() != null ? dto.getFileName() : "");
            pstm.setString(7, dto.getFileExt() != null ? dto.getFileExt() : "");
            pstm.setInt(8, dto.getFileSize());
            pstm.setString(9, dto.getFileCategory() != null ? dto.getFileCategory() : "");

            // SQL 실행
            resultSet = pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("DB 입력 중 오류가 발생했습니다: " + e.getMessage());
            return 0; // SQL 실행 실패 시 0 반환
        }
        
        return resultSet; // SQL 실행 성공 시 결과 반환
    }
}
