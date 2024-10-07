package net.fullstack7.member;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import net.fullstack7.common.DBConnPool;
import net.fullstack7.utils.CommonDateUtil;

//public class MemberDAO extends JDBConnect {
public class MemberDAO extends DBConnPool {
	private CommonDateUtil dateUtil;

	public MemberDAO() {
		super();
		dateUtil = new CommonDateUtil();

	}
	
//	public MemberDAO(String driver, String url, String id, String pwd) {
//		super(driver, url, id, pwd);
//
//		System.out.println("===================================");
//		System.out.println("MemberDAO");
//		System.out.println(driver +"\n"+ url +"\n"+ id +"\n"+ pwd );
//		System.out.println("===================================");
//	}

	public MemberDAO(String globalName) {
		super(globalName);
		dateUtil = new CommonDateUtil();
	}

	/**
	 * @desc 아이디로 회원정보조회
	 * 
	 * @param user_id String
	 * @return MemberDTO
	 * 
	 * @example getMemberInfo('user1')
	 */
	public MemberDTO getMemberInfo(String user_id) {
		
		return null;
	}
	
	// 회원 정보 조회 (아이피, 비밀번호)
	public MemberDTO getMemberInfo(String user_id, String pwd) {
		MemberDTO dto = new MemberDTO();
		String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member WHERE memberId = ?";

		// 아이디/비밀번호 체크 플래그
		boolean check_id_flag = false;
		boolean check_pwd_flag = false;
		
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			rs = pstm.executeQuery();
			if ( rs.next() ) {
				check_id_flag = true;
				
				if ( pwd.equals(rs.getString("pwd")) ) {
					check_pwd_flag = true;
				}

				if ( check_id_flag && check_pwd_flag ) {
					dto.setMemberId(user_id);
					dto.setPwd(pwd);
					dto.setName(rs.getString("name"));
					dto.setRegDate(dateUtil.toLocalDateTime(rs.getDate("regDate")));
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("===================================");
			System.out.println("회원 정보 조회 실패");
			System.out.println(e.getMessage());
			System.out.println("===================================");
		}

		System.out.println("===================================");
		System.out.println("dto : "+ dto.getRegDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

		System.out.println("===================================");
		
		return dto;
	}

	// 회원 리스트
	public List<MemberDTO> getMemberList() {
		List<MemberDTO> dtoMemberList = new ArrayList<MemberDTO>();
		String sql = "SELECT memberId, name, pwd, regDate FROM tbl_member WHERE 1=1";
		
		try {
			pstm = con.prepareStatement(sql);
			rs = pstm.executeQuery();
			while ( rs.next() ) {
				MemberDTO dto = new MemberDTO();
				dto.setMemberId(rs.getString("memberId"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setRegDate(dateUtil.toLocalDateTime(rs.getDate("regDate")));
				dtoMemberList.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("===================================");
			System.out.println("회원 정보 조회 실패");
			System.out.println(e.getMessage());
			System.out.println("===================================");
		}		
		
		return dtoMemberList;
	}
	
	public List<MemberDTO> getMemberList(int pageNo, int pageSize
			, String searchField[], String[] searchWord
			, String[] sortField, String[] sortOrder) {
		return null;
	}

	// 회원 등록
	public int setMemberRegist(MemberDTO memberDTO) {
		StringBuilder sb = new StringBuilder();
//		sb.append("UPDATE tbl_member SET ");
//		sb.append("name=?, pwd=?, jumin=?, addr1=?, addr2=?, birthday=?");
//		sb.append(", jobCode=?, mileage=?, memberState=?");
//		sb.append(", regDate=?, leaveDate=?, pwdChangeDate=?");
//		sb.append(" WHERE memberId = ?");
//		sb.append(memberDTO.getMemberId());
//		sb.append(", "+ );
//		sb.append(", "+ memberDTO.getPwd());
//		sb.append(", "+ memberDTO.getJumin());
//		sb.append(", "+ memberDTO.getAddr1());
//		sb.append(", "+ memberDTO.getAddr2());
//		sb.append(", "+ memberDTO.getBirthday());
//		sb.append(", "+ memberDTO.getJobCode());
//		sb.append(", "+ memberDTO.getMileage());
//		sb.append(", "+ memberDTO.getMemberState());
//		sb.append(", now()");

		sb.append("INSERT INTO tbl_member(");
		sb.append("memberId, name, pwd, jumin, addr1, addr2, birthday");
		sb.append(", jobCode, mileage, memberState, regDate");
		sb.append(") VALUES (");
		sb.append("?, ?, ?, ?, ?, ?, ?");
		sb.append(", ?, ?, ?, now())");

		int intResult = 0;
		try {
			pstm = con.prepareStatement(sb.toString());
			pstm.setString(1, memberDTO.getMemberId());
			pstm.setString(2, memberDTO.getName());
			pstm.setString(3, memberDTO.getPwd());
			pstm.setString(4, memberDTO.getJumin());
			pstm.setString(5, memberDTO.getAddr1());
			pstm.setString(6, memberDTO.getAddr2());
			pstm.setString(7, memberDTO.getBirthday());
			pstm.setString(8, memberDTO.getJobCode());
			pstm.setInt(9, memberDTO.getMileage());
			pstm.setString(10, memberDTO.getMemberState());
			
			intResult = pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			intResult = -500;
		}
		
		return intResult;
	}
	public int setMemberModify(MemberDTO memberDTO) {
		StringBuilder sb = new StringBuilder();
		sb.append("INSERT INTO tbl_member(");
		sb.append("memberId, name, pwd, jumin, addr1, addr2, birthday");
		sb.append(", jobCode, mileage, memberState");
		sb.append(") VALUES (");
		sb.append("?, ?, ?, ?, ?, ?, ?");
		sb.append(", ?, ?, ?)");

		int intResult = 0;
		try {
			pstm = con.prepareStatement(sb.toString());
			pstm.setString(1, memberDTO.getMemberId());
			pstm.setString(2, memberDTO.getName());
			pstm.setString(3, memberDTO.getPwd());
			pstm.setString(4, memberDTO.getJumin());
			pstm.setString(5, memberDTO.getAddr1());
			pstm.setString(6, memberDTO.getAddr2());
			pstm.setString(7, memberDTO.getBirthday());
			pstm.setString(8, memberDTO.getJobCode());
			pstm.setInt(9, memberDTO.getMileage());
			pstm.setString(10, memberDTO.getMemberState());
			
			intResult = pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			intResult = -500;
		}

		return intResult;
	}
	public int setMemberDelete(String user_id) {
		String sql = "DELETE FROM tbl_member WHERE memberId = ?";

		int intResult = 0;
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, user_id);
			intResult = pstm.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			intResult = -500;
		}

		return intResult;
	}
}
