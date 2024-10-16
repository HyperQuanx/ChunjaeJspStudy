package net.fullstack7.fileupload;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Vector;

import net.fullstack7.common.DBConnPool;

public class MyFileDAO extends DBConnPool {

    // 파일을 삽입하는 메서드
    public int insertFile(MyFileDTO dto) {
    	int applyResult = 0;
        try {
            // idx는 auto_increment이므로 명시하지 않음
            String query = "INSERT INTO myfile (title, cate, ofile, sfile) "
                         + "VALUES (?, ?, ?, ?)";
            PreparedStatement pstmt = con.prepareStatement(query);

            pstmt.setString(1, dto.getTitle());
            pstmt.setString(2, dto.getCate());
            pstmt.setString(3, dto.getOfile());
            pstmt.setString(4, dto.getSfile());

            applyResult = pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("INSERT 중 예외 발생");
            e.printStackTrace();
        }
        return applyResult;
    }

    // 파일 리스트를 가져오는 메서드
    public List<MyFileDTO> myFileList() {
        List<MyFileDTO> fileList = new Vector<MyFileDTO>();
        ResultSet rs = null;

        String query = "SELECT * FROM myfile ORDER BY idx DESC";
        try {
            PreparedStatement pstmt = con.prepareStatement(query);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MyFileDTO dto = new MyFileDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setTitle(rs.getString("title"));
                dto.setCate(rs.getString("cate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setPostdate(rs.getString("postdate"));

                fileList.add(dto);
            }
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
}
