package net.fullstack7.bbs;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;

public class BbsDAO extends DBConnPool {

    public BbsDAO() {
    	super();
    }

    /**
     * @desc 아이디와 비밀번호로 회원 정보 조회
     * @param user_id String
     * @param pwd String
     * @return MemberDTO
     */
    public List<BbsDTO> getBoardList() {
        List<BbsDTO> boardList = new ArrayList<>();
        String query = "SELECT * FROM tbl_bbs";

        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
            	BbsDTO dto = new BbsDTO();
                dto.setIdx(rs.getInt("idx"));
                dto.setRefIdx(rs.getInt("refIdx"));
                dto.setLevelIdx(rs.getInt("levelIdx"));
                dto.setSortOrder(rs.getInt("sortOrder"));
                dto.setMemberId(rs.getString("memberId"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setDisplayDate(rs.getString("displayDate"));
                dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
                dto.setModifyDate(rs.getTimestamp("modifyDate").toLocalDateTime());
                
                boardList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return boardList;
    }
    
    public BbsDTO getBoard(String idx) {
    	BbsDTO dto = new BbsDTO();
        String query = "SELECT * FROM tbl_bbs WHERE idx = ?";
        System.out.println(idx);
        try {
        	PreparedStatement pstmt = con.prepareStatement(query);
        	pstmt.setString(1, idx);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
            	dto.setIdx(rs.getInt("idx"));
                dto.setRefIdx(rs.getInt("refIdx"));
                dto.setLevelIdx(rs.getInt("levelIdx"));
                dto.setSortOrder(rs.getInt("sortOrder"));
                dto.setMemberId(rs.getString("memberId"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setDisplayDate(rs.getString("displayDate"));
                dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
                dto.setModifyDate(rs.getTimestamp("modifyDate").toLocalDateTime());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
    
    public BbsDTO createBoard(String memberId, String title, String content) {
        BbsDTO dto = new BbsDTO();
        String query = "INSERT INTO tbl_bbs (memberId, title, content, regDate) VALUES (?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, memberId);
            pstmt.setString(2, title);
            pstmt.setString(3, content);

            LocalDateTime now = LocalDateTime.now();
            Timestamp regDate = Timestamp.valueOf(now);
            pstmt.setTimestamp(4, regDate);

            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                dto.setMemberId(memberId);
                dto.setTitle(title);
                dto.setContent(content);
                dto.setRegDate(now);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
    

    public List<BbsDTO> searchBoard(String type, String search) {
        List<BbsDTO> searchList = new ArrayList<>();
        String queryPlus = "SELECT * FROM tbl_bbs WHERE ";
        String query = "";

        try {
            switch(type) {
                case "memberId": 
                    query = queryPlus + "memberId = ?";
                    break;
                case "title": 
                    query = queryPlus + "title LIKE ?";
                    break;
                case "content": 
                    query = queryPlus + "content LIKE ?";
                    break;
                default: 
                    query = queryPlus + "memberId = ?";
                    break;
            }
            
            PreparedStatement pstmt = con.prepareStatement(query);
            
            if ("title".equals(type) || "content".equals(type)) {
                pstmt.setString(1, "%" + search + "%");
            } else {
                pstmt.setString(1, search);
            }
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                BbsDTO dto = new BbsDTO();
                dto.setIdx(rs.getInt("idx"));
                dto.setRefIdx(rs.getInt("refIdx"));
                dto.setLevelIdx(rs.getInt("levelIdx"));
                dto.setSortOrder(rs.getInt("sortOrder"));
                dto.setMemberId(rs.getString("memberId"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setDisplayDate(rs.getString("displayDate"));
                dto.setRegDate(rs.getTimestamp("regDate").toLocalDateTime());
                dto.setModifyDate(rs.getTimestamp("modifyDate").toLocalDateTime());
                
                searchList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return searchList;
    }

    
    public BbsDTO modifyBoard(String memberId, String title, String content) {
        BbsDTO dto = new BbsDTO();
        String query = "UPDATE tbl_bbs SET title = ?, content = ?, regDate = NOW() WHERE memberId = ?";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, title);
            pstmt.setString(2, content);
            pstmt.setString(3, memberId);

            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                dto.setMemberId(memberId);
                dto.setTitle(title);
                dto.setContent(content);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }

    
    public BbsDTO deleteBoard(int idx) {
        BbsDTO dto = new BbsDTO();
        String query = "DELETE FROM tbl_bbs WHERE idx IN (?)";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, idx);


            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                dto.setIdx(idx);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return dto;
    }
}
