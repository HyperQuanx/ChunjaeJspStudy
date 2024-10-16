package net.fullstack7.bbs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class EditBoard
 */

@WebServlet("/bbs/edit.do")
public class EditBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String idx = req.getParameter("idx");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String displayDate = req.getParameter("displayDate");
		String fileName = req.getParameter("fileName");
		String fileCategory = req.getParameter("fileCategory");
		
		BbsDAO dao = new BbsDAO();
		dao.editBoard(idx, title, content, displayDate, fileName, fileCategory);
		
		req.setAttribute("idx", idx);
		
		req.getRequestDispatcher("/WEB-INF/bbs/edit.jsp").forward(req, res);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
