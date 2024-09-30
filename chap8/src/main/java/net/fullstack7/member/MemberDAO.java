package net.fullstack7.member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;

public class MemberDAO {
    // DBConnPool을 이용한 연결
    private DBConnPool dbConnPool;

    public MemberDAO() {
        dbConnPool = new DBConnPool(); // DBConnPool 객체 생성
    }

    /**
     * @desc 아이디와 비밀번호로 회원 정보 조회
     * @param user_id String
     * @param pwd String
     * @return MemberDTO
     */
    public MemberDTO getMemberInfo(String user_id, String pwd) {
        MemberDTO dto = null;  // 리턴을 했으니 null 넣어주기
        String query = "SELECT memberId, name, pwd FROM tbl_member WHERE memberId = ? AND pwd = ?";

        try {
            PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
            pstmt.setString(1, user_id);
            pstmt.setString(2, pwd);
            ResultSet rs = pstmt.executeQuery();

            // 조회된 결과가 있으면 DTO에 데이터를 저장
            if (rs.next()) {
                dto = new MemberDTO();
                dto.setMemberId(rs.getString("memberId"));
                dto.setName(rs.getString("name"));
                dto.setPwd(rs.getString("pwd"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnPool.close();  // 자원 해제
        }

        return dto;
    }

    public List<MemberDTO> getMemberList() {
        List<MemberDTO> memberList = new ArrayList<>();
        String query = "SELECT * FROM tbl_member";

        try {
            PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberDTO dto = new MemberDTO();
                dto.setMemberId(rs.getString("memberId"));
                dto.setName(rs.getString("name"));
                dto.setPwd(rs.getString("pwd"));
                dto.setJumin(rs.getString("jumin"));
                dto.setAddr1(rs.getString("addr1"));
                dto.setAddr2(rs.getString("addr2"));
                dto.setBirthday(rs.getString("birthday"));
                dto.setJobCode(rs.getString("jobCode"));
                dto.setMileage(rs.getInt("mileage"));
                dto.setMemberState(rs.getString("memberState"));
                dto.setRegDate(rs.getTimestamp("regDate") != null ? rs.getTimestamp("regDate").toLocalDateTime() : null);
                dto.setLeaveDate(rs.getTimestamp("leaveDate") != null ? rs.getTimestamp("leaveDate").toLocalDateTime() : null);
                dto.setPwdChangeDate(rs.getTimestamp("pwdChangeDate") != null ? rs.getTimestamp("pwdChangeDate").toLocalDateTime() : null);
                
                memberList.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnPool.close();  // 자원 해제
        }

        return memberList;
    }

    public MemberDTO setMemberRegist(String memberId, String name, String pwd, String birthday) {
        MemberDTO dto = null;
        String query = "INSERT INTO tbl_member (memberId, name, pwd, birthday) VALUES (?, ?, ?, ?)";

        try {
            PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
            pstmt.setString(1, memberId);
            pstmt.setString(2, name);
            pstmt.setString(3, pwd);
            pstmt.setString(4, birthday);

            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                dto = new MemberDTO();
                dto.setMemberId(memberId);
                dto.setName(name);
                dto.setPwd(pwd);
                dto.setBirthday(birthday);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnPool.close();  // 자원 해제
        }

        return dto;
    }

    public MemberDTO getMember(String memberId) {
        MemberDTO dto = new MemberDTO();
        String query = "SELECT memberId, name, pwd, birthday FROM tbl_member WHERE memberId = ?";

        try {
            PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
            pstmt.setString(1, memberId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                dto.setMemberId(rs.getString("memberId"));
                dto.setName(rs.getString("name"));
                dto.setPwd(rs.getString("pwd"));
                dto.setBirthday(rs.getString("birthday"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnPool.close();  // 자원 해제
        }

        return dto;
    }

    public MemberDTO updateMember(String name, String pwd, String birthday, String memberId) {
        MemberDTO dto = null;
        String query = "UPDATE tbl_member SET name = ?,  pwd = ?, birthday = ? WHERE memberId = ?";

        try {
            PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
            pstmt.setString(1, name);
            pstmt.setString(2, pwd);
            pstmt.setString(3, birthday);
            pstmt.setString(4, memberId);

            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                dto = new MemberDTO();
                dto.setMemberId(memberId);
                dto.setName(name);
                dto.setPwd(pwd);
                dto.setBirthday(birthday);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnPool.close();  // 자원 해제
        }

        return dto;
    }

    public MemberDTO setMemberDelete(String memberId) {
        String query = "DELETE FROM tbl_member WHERE memberId = ?";
        MemberDTO dto = new MemberDTO();

        try {
            PreparedStatement pstmt = dbConnPool.con.prepareStatement(query);
            pstmt.setString(1, memberId);
            int rs = pstmt.executeUpdate();

            if (rs > 0) {
                dto.setMemberId(memberId);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbConnPool.close();  // 자원 해제
        }

        return dto;
    }
}
