package net.fullstack7.bbs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ViewBoard
 */

@WebServlet("/bbs/view.do")
public class ViewBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		
		BbsDAO dao = new BbsDAO();
		BbsDTO dto = dao.getBoardView(idx);
		/*
		System.out.println(dto.getFilePath() != "" ? dto.getFilePath() : "null");
		System.out.println(dto.getFilePath() != null ? dto.getFilePath() : "null"); 
		System.out.println(dto.getFilePath());
		System.out.println((String) dto.getFilePath());
		System.out.println(dto.getFilePath() + "ㅇㅁㄴ");
		*/
		
		String filePath = dto.getFilePath(); // 메서드에서 반환된 값을 변수에 저장
		String result = (filePath == null) ? "null" : "null 아님";
		System.out.println(result);
		
        req.setAttribute("vL", dto);
        req.getRequestDispatcher("/WEB-INF/bbs/view.jsp").forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
