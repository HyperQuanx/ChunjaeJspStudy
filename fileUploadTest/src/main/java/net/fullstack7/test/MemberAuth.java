package net.fullstack7.test;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.fullstack7.member.MemberDAO;
import net.fullstack7.member.MemberDTO;

public class MemberAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;	
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new MemberDAO();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String admin_id = this.getInitParameter("adminId");
        
        // 인증을 요청한 ID/패스워드
        String id = req.getParameter("id");
        String pwd = req.getParameter("pwd");

        MemberDTO memberDTO = dao.getMemberInfo(id, pwd);

        String memberName = memberDTO.getName();
        if (memberName != null) {
            req.setAttribute("authMessage", memberName + " 회원님 ㅎㅇㅎㅇ^^ 소통해요~~");
        }
        else {  // 일치하는 회원 없음
            if (admin_id.equals(id))  // 관리자
                req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
            else  // 비회원
                req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
        }
        req.getRequestDispatcher("/MemberAuth.jsp").forward(req, res);
    }

    @Override
    public void destroy() {
        dao.close();
    }
}
