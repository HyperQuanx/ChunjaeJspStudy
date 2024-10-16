package net.fullstack7.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.fullstack7.bbs.BbsDTO;
import net.fullstack7.common.JDBConnect;

public class MemberDAO extends JDBConnect {
	public MemberDAO() {
		super();
	}
	
	// 회원가입
	public MemberDTO signUp(String memberId, String name, String pwd, String jumin, String addr1, String addr2, String birthday) {
		MemberDTO dto = null;
		String sql = "INSERT INTO tbl_member (memberId, name, pwd, jumin, addr1, addr2, birthday, regDate) VALUES (?, ?, ?, ?, ?, ?, ?, now())";
		try (Connection con = this.getConnection();
	         PreparedStatement pstm = con.prepareStatement(sql)) {
			
			pstm.setString(1, memberId);
			pstm.setString(2, name);
			pstm.setString(3, pwd);
			pstm.setString(4, jumin);
			pstm.setString(5, addr1);
			pstm.setString(6, addr2);
			pstm.setString(7, birthday);
			
			int rs = pstm.executeUpdate();
			
			if (rs > 0) {
                dto = new MemberDTO();
                dto.setMemberId(memberId);
                dto.setName(name);
                dto.setPwd(pwd);
                dto.setPwd(jumin);
                dto.setPwd(addr1);
                dto.setPwd(addr2);
                dto.setBirthday(birthday);
            }
		} catch(Exception e) {
			e.getStackTrace();
			System.out.println("회원가입 실패 " + e.getMessage());
			return dto;
		}
		return dto;
	}
	
	// 로그인
	public MemberDTO login(String memberId, String pwd, String idSave) {
	    MemberDTO dto = null;
	    BbsDTO bDto = null;

	    String sql = "SELECT memberId, name, pwd FROM tbl_member WHERE memberId = ? AND pwd = ?";

	    try (Connection con = this.getConnection();
	         PreparedStatement pstm = con.prepareStatement(sql)) {
	        pstm.setString(1, memberId);
	        pstm.setString(2, pwd);
	        ResultSet rs = pstm.executeQuery();

	        if (rs.next()) {
	            dto = new MemberDTO();
	            bDto = new BbsDTO();
	            bDto.setMemberId(rs.getString("memberId"));
	            dto.setMemberId(rs.getString("memberId"));
	            dto.setName(rs.getString("name"));
	            dto.setPwd(rs.getString("pwd"));
	            dto.setIdSave(idSave);
	        }
	        System.out.println(dto.getName());
	    } catch (Exception e) {
	        e.getStackTrace();
	        System.out.println("로그인 실패 " + e.getMessage());
	    }

	    return dto;
	}
	
	// 회원정보 수정
		
	// 회원조회
	
	// 회원탈퇴
	
}
