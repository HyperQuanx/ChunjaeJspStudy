package net.fullstack7.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.utils.CookieManager;

import java.io.IOException;

/**
 * Servlet implementation class SignUpController
 */

@WebServlet("/member/login.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("memberId");
		String pwd = req.getParameter("pwd");
		String idSave = req.getParameter("idSave");
		
		
		try {
            MemberDAO dao = new MemberDAO();
            MemberDTO dto = dao.login(id, pwd, id);

            if (idSave != null) {			
            	CookieManager.makeCookie(res, "idSave", id, 60 * 60 * 24 * 7);
            }
            
            if (dto != null) {
            	req.getSession().setAttribute("memberId", id);
            	req.getSession().setAttribute("name", dto.getName());
            	req.getSession().setMaxInactiveInterval(1800); // 30분 설정해놓기
            	
            	// 나중에 이것도 메서드로 빼보자
                req.getRequestDispatcher("/WEB-INF/member/login_ok.jsp").forward(req, res);
            } else {
                req.setAttribute("errorMessage", "로그인에 실패했습니다.");
                req.getRequestDispatcher("/WEB-INF/member/login.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "로그인 처리 중 오류가 발생했습니다.");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
