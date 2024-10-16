package net.fullstack7.member;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.utils.CookieManager;

import java.io.IOException;

/**
 * Servlet implementation class SignUpController
 */

@WebServlet("/member/signUp.do")
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String id = req.getParameter("memberId");
		String name = req.getParameter("name");
		String pwd = req.getParameter("pwd");
		String jumin = req.getParameter("jumin");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		String birthday = req.getParameter("birthday");
		
		try {
            MemberDAO dao = new MemberDAO();
            MemberDTO dto = dao.signUp(id, name, pwd, jumin, addr1, addr2, birthday);

            if (dto != null) {
                req.getRequestDispatcher("/WEB-INF/member/signUp_ok.jsp").forward(req, res);
            } else {
                req.setAttribute("errorMessage", "회원가입에 실패했습니다.");
                req.getRequestDispatcher("/WEB-INF/member/signUp.jsp").forward(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errorMessage", "회원가입 처리 중 오류가 발생했습니다.");
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}
