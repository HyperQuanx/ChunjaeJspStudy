package net.fullstack7.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


import net.fullstack7.common.JDBConnect;

public class BbsDAO extends JDBConnect {
    
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

            resultSet = pstm.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("DB 입력 중 오류가 발생했습니다: " + e.getMessage());
            return 0;
        }
        
        return resultSet;
    }
    
    // 메인페이지 뷰
    public List<BbsDTO> getBoardList(int page, int pageSize) {
        List<BbsDTO> boardList = new ArrayList<BbsDTO>();
        String sql = "SELECT idx, memberId, title, regDate, readCnt FROM tbl_bbs ORDER BY idx DESC LIMIT ?, ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {
            int startRow = (page - 1) * pageSize;
            pstm.setInt(1, startRow);
            pstm.setInt(2, pageSize);
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                BbsDTO dto = new BbsDTO();
                dto.setIdx(rs.getInt("idx"));
                dto.setMemberId(rs.getString("memberId"));
                dto.setTitle(rs.getString("title"));
                dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
                dto.setReadCnt(rs.getInt("readCnt"));
                boardList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("게시판 조회 오류 " + e.getMessage());
        }
        return boardList;
    }

    // 전체 게시글 수를 가져오는 메서드
    public int getBoardCount() {
        String sql = "SELECT COUNT(*) AS total FROM tbl_bbs";
        int total = 0;
        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return total;
    }
    
    // 한 놈 보기
    public BbsDTO getBoardView(String idx) {
    	BbsDTO dto = new BbsDTO();
    	String sql = "SELECT idx, memberId, title, content, displayDate, regDate, modifyDate, readCnt, filePath, fileName, fileCategory FROM tbl_bbs WHERE idx = ?";
    	
    	try(Connection con = this.getConnection();
       		 PreparedStatement pstm = con.prepareStatement(sql)) {
    		pstm.setString(1, idx);
    		ResultSet rs = pstm.executeQuery();
    		
    		if(rs.next()) {
    			dto.setIdx(rs.getInt("idx"));
                dto.setMemberId(rs.getString("memberId"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setDisplayDate(rs.getString("displayDate"));
                dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
                dto.setModifyDate(rs.getTimestamp("modifyDate").toLocalDateTime());
                dto.setReadCnt(rs.getInt("readCnt"));
                dto.setFilePath(rs.getString("filePath"));
                dto.setFileName(rs.getString("fileName"));
                dto.setFileCategory(rs.getString("fileCategory"));
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.out.println("뷰 조회 오류");
    	}
    	return dto;
    }
    
    // 수정하기
    public BbsDTO editBoard(String idx, String title, String content, String displayDate, String fileName, String fileCategory) {
    	BbsDTO dto = new BbsDTO();
    	String sql = "UPDATE tbl_bbs SET title = ?, content = ?, displayDate = ?, modifyDate = now(), fileName = ?, fileCategory = ? WHERE idx = ?";
    	
    	try(Connection con = this.getConnection();
    		PreparedStatement pstm = con.prepareStatement(sql)) {
    		pstm.setString(1, title);
    		pstm.setString(2, content);
    		pstm.setString(3, displayDate);
    		pstm.setString(4, fileName);
    		pstm.setString(5, fileCategory);
    		pstm.setString(6, idx);
    		
    		int rs = pstm.executeUpdate();
    		
    		if (rs > 0) {
                dto.setTitle(title);
                dto.setContent(content);
                dto.setDisplayDate(displayDate);
                dto.setFileName(fileName);
                dto.setFileCategory(fileCategory);
                dto.setIdx(Integer.parseInt(idx));
            }
    	} catch (Exception e) {
    		e.printStackTrace();
    		System.err.println("수정이 안돼 : " + e.getMessage());
    	}
    	return dto;
    }
    
    // 삭제하기
    public BbsDTO delBoard(String idx) {
    	BbsDTO dto = new BbsDTO();
    	String sql = "DELETE FROM tbl_bbs WHERE idx IN (?)";
    	
    	try(Connection con = this.getConnection();
        	PreparedStatement pstm = con.prepareStatement(sql)) {
    		pstm.setString(1, idx);
    		
    		int rs = pstm.executeUpdate();
    		
    		if (rs > 0) {
    			dto.setIdx(Integer.parseInt(idx));
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    		System.err.println("삭제가 안돼 " + e.getMessage());
    	}
    	return dto;
    }
}
