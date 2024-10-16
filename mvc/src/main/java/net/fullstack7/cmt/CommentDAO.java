package net.fullstack7.cmt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.JDBConnect;

public class CommentDAO extends JDBConnect {
	public CommentDAO() {
		super();
	}
	
    // 댓글 등록
    public int insertComment(CommentDTO dto) {
        int result = 0;
        String sql = "INSERT INTO tbl_comment (bbsIdx, memberId, content, parentIdx) VALUES (?, ?, ?, ?)";

        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {
        	pstm.setInt(1, dto.getBbsIdx());
        	pstm.setString(2, dto.getMemberId());
        	pstm.setString(3, dto.getContent());
        	pstm.setObject(4, dto.getParentIdx());

            result = pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 댓글 조회 (특정 게시글의 댓글 전체 조회)
    public List<CommentDTO> getCommentsByBbsIdx(int bbsIdx) {
        List<CommentDTO> commentList = new ArrayList<>();
        String sql = "SELECT * FROM tbl_comment WHERE bbsIdx = ? ORDER BY parentIdx ASC, idx ASC";

        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {
        	pstm.setInt(1, bbsIdx);
            try (ResultSet rs = pstm.executeQuery()) {
                while (rs.next()) {
                    CommentDTO dto = new CommentDTO();
                    dto.setIdx(rs.getInt("idx"));
                    dto.setBbsIdx(rs.getInt("bbsIdx"));
                    dto.setMemberId(rs.getString("memberId"));
                    dto.setContent(rs.getString("content"));
                    dto.setParentIdx((Integer) rs.getObject("parentIdx")); // 대댓글의 경우 부모 댓글
                    dto.setRegDate(rs.getTimestamp("regDate"));

                    commentList.add(dto);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commentList;
    }

    // 댓글 수정
    public int updateComment(CommentDTO dto) {
        int result = 0;
        String sql = "UPDATE tbl_comment SET content = ? WHERE idx = ? AND memberId = ?";

        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {
        	pstm.setString(1, dto.getContent());
        	pstm.setInt(2, dto.getIdx());
        	pstm.setString(3, dto.getMemberId());

            result = pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 댓글 삭제
    public int deleteComment(int idx, String memberId) {
        int result = 0;
        String sql = "DELETE FROM tbl_comment WHERE idx = ? AND memberId = ?";

        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {
        	pstm.setInt(1, idx);
        	pstm.setString(2, memberId);

            result = pstm.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 특정 댓글 조회 (단일 댓글 조회)
    public CommentDTO getCommentByIdx(int idx) {
        CommentDTO dto = null;
        String sql = "SELECT * FROM tbl_comment WHERE idx = ?";

        try (Connection con = this.getConnection();
             PreparedStatement pstm = con.prepareStatement(sql)) {
        	pstm.setInt(1, idx);
            try (ResultSet rs = pstm.executeQuery()) {
                if (rs.next()) {
                    dto = new CommentDTO();
                    dto.setIdx(rs.getInt("idx"));
                    dto.setBbsIdx(rs.getInt("bbsIdx"));
                    dto.setMemberId(rs.getString("memberId"));
                    dto.setContent(rs.getString("content"));
                    dto.setParentIdx((Integer) rs.getObject("parentIdx"));
                    dto.setRegDate(rs.getTimestamp("regDate"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dto;
    }
}
