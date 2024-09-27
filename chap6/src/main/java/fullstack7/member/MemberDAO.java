package fullstack7.member;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {
    public MemberDAO() {}

    public MemberDAO(String driver, String url, String id, String pwd) {
        super(driver, url, id, pwd);
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
            PreparedStatement pstmt = con.prepareStatement(query);
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
        }
        
        return dto;
    }

    public MemberDTO getMemberList(int pageNo, int pageSize, 
                                    String[] searchField, String[] searchWord,
                                    String[] sortField, String[] sortOrder) {
        return null;
    }

    public int setMemberRegist(Map<String, String> memberInfo) {
        return 0;
    }

    public int setMemberModify(Map<String, String> memberInfo) {
        return 0;
    }

    public int setMemberDelete(String user_id) {
        return 0;
    }
}
