package net.fullstack7.bbs;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Servlet implementation class ListController
 */
@WebServlet("/list.do") // list.do 요청을 처리
public class ListController2 extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // 데이터 처리 로직 (필요시)
        // 예를 들어, 게시글 목록을 DB에서 가져와 request에 설정할 수 있습니다.
        // List<BbsDTO> list = bbsDAO.getBbsList();
        // req.setAttribute("list", list);

        // list.jsp로 포워드
        req.getRequestDispatcher("/bbs/list.jsp").forward(req, res);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res); // POST 요청도 동일하게 처리
    }
}
