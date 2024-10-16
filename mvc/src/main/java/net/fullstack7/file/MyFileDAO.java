package net.fullstack7.file;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Vector;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.fullstack7.common.DBConnPool;

public class MyFileDAO extends DBConnPool {

    // 파일을 삽입하는 메서드
    public int insertFile(MyFileDTO dto) {
    	int rs = 0;
        try {
            String query = "INSERT INTO tbl_file (title, cate, ofile, sfile) "
                         + "VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getCate());
            pstmt.setString(3, dto.getOfile());
            pstmt.setString(4, dto.getSfile());

            rs = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("INSERT 중 예외 발생");
            e.printStackTrace();
        }
        return rs;
    }

    // 파일 리스트를 가져오는 메서드
    public List<MyFileDTO> myFileList() {
        List<MyFileDTO> fileList = new Vector<MyFileDTO>();
        ResultSet rs = null;

        String query = "SELECT * FROM tbl_file ORDER BY idx DESC";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getInt("idx"));
                dto.setTitle(rs.getString("title"));
                dto.setCate(rs.getString("cate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPostdate(rs.getString("postdate"));

                fileList.add(dto);
            }
            
            /*
            내려쓰기 정리
            Collections.sort(fileList, new Comparator<MyFileDTO>() {
                @Override
                public int compare(MyFileDTO o1, MyFileDTO o2) {
                    // 오름차순 정렬: o1.idx - o2.idx
                    // 내림차순 정렬: o2.getIdx(), o1.getIdx()
                    return Integer.compare(o1.getIdx(), o2.getIdx());
                }
            });
            */
        } catch (Exception e) {
            System.out.println("SELECT 시 예외 발생");
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return fileList;
    }
    
    
    // 파일 삭제 ㄱㄱ
    public MyFileDTO delFile(int idx) {
    	MyFileDTO dto = new MyFileDTO();
    	String query = "DELETE FROM tbl_file WHERE idx IN (?)";
    	
    	try {
    		PreparedStatement pstmt = con.prepareStatement(query);
    		pstmt.setInt(1, idx);
    		
    		int rs = pstmt.executeUpdate();
    		
    		if (rs > 0) {
    			dto.setIdx(idx);
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return dto;
    }
}
