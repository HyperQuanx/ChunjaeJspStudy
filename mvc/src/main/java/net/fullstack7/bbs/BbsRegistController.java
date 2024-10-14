package net.fullstack7.bbs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.utils.CommonFileUtil;

import java.io.IOException;
import java.util.Map;

/**
 * Servlet implementation class BbsRegistController
 */

// @WebServlet("/BbsRegistController")

@MultipartConfig(
		maxFileSize = 1024*1024*1,
		maxRequestSize = 1024*1024*10
)
public class BbsRegistController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		
		req.getRequestDispatcher("/bbs/regist.jsp").forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    // 1. 폼 데이터를 전송 받아서 변수에 할당
	    BbsDTO dto = new BbsDTO();
	    
	    dto.setMemberId(req.getParameter("memberid"));
	    dto.setTitle(req.getParameter("title"));
	    dto.setContent(req.getParameter("content"));
	    dto.setDisplayDate(req.getParameter("displaydate"));
	    dto.setFileCategory(req.getParameter("filecategory"));
	    
	    // 2. 파일 업로드 처리
	    String saveDir = getServletContext().getRealPath("/uploads");
	    System.out.println("saveDir : " + saveDir);
	    
	    String orgFileName = CommonFileUtil.fileUpload(req, saveDir, "file1");

	    // 파일이 없을 경우 처리
	    if (orgFileName == null || orgFileName.isEmpty()) {
	        // 첨부 파일이 없는 경우, 빈 값 또는 null로 처리
	        dto.setFilePath("");
	        dto.setFileName("");
	        dto.setFileExt("");
	        dto.setFileSize(0);
	    } else {
	        // 파일이 있을 경우 정상적으로 파일 정보를 DTO에 설정
	        Map<String, String> fmap = CommonFileUtil.fileRename(saveDir, orgFileName);
	        
	        if (fmap != null) {
	            dto.setFilePath(fmap.get("filePath"));
	            dto.setFileName(fmap.get("newFileName"));
	            dto.setFileExt(fmap.get("fileExt"));
	            dto.setFileSize(Integer.parseInt(fmap.get("fileSize")));
	        }
	        
	        System.out.println("orgFileName : " + orgFileName);
	        System.out.println("newFileName : " + fmap.get("newFileName"));
	    }
	    
	    // 3. DAO를 통해 DB 프로세스 진행 --> INSERT
	    BbsDAO dao = new BbsDAO();
	    int rtnResult = dao.regist(dto);
	    dao.close();
	    
	    // 등록 성공
	    if (rtnResult > 0) {
	        res.sendRedirect("/bbs/list.do"); // list.jsp가 아닌 list.do로 리다이렉트
	    } else {
	        // 오류 처리
	        req.setAttribute("errMsg", "게시글 등록 시 에러가 발생");
	        req.getRequestDispatcher("/bbs/regist.jsp").forward(req, res);
	    }

	}

}
