package net.fullstack7.bbs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class ListController
 */
// @WebServlet("/ListController2")
public class ListController2 extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 10;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        BbsDAO dao = new BbsDAO();
        BbsDAO dao2 = new BbsDAO();

        // 1. 페이지 번호 파라미터 가져오기 (기본값: 1로 설정해놀기)
        String pageParam = req.getParameter("page");
        int currentPage = (pageParam != null) ? Integer.parseInt(pageParam) : 1;
        
        
        // 2. 전체 게시글 수 가져오기
        int totalBoardCount = dao.getBoardCount(); // 전체 게시글 수 가져오기
        
        
        // 3. 현재 페이지에 해당하는 게시글 목록 가져오기
        List<BbsDTO> list = dao2.getBoardList(currentPage, PAGE_SIZE);

        
        // 4. 전체 페이지 수 계산
        int totalPages = (int) Math.ceil((double) totalBoardCount / PAGE_SIZE);

        // 5. JSP에 데이터 전달
        req.setAttribute("list", list);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("currentPage", currentPage);
        req.setAttribute("totalBoardCount", totalBoardCount);

        /*
         * 리스너 실험용
        if (req.getSession().getAttribute("test") != null) {
        	req.getSession().setAttribute("test", "test");        	
        } else {
        	req.getSession().invalidate();
        }
        */
        
        req.getRequestDispatcher("/WEB-INF/bbs/list.jsp").forward(req, res);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res); // POST 요청도 동일하게 처리
    }
}
