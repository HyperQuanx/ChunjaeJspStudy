package net.fullstack7.utils;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class PageMove
 */
@WebServlet("/pagem.do")
public class PageMove extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String param = req.getParameter("ove");
        // ex) move = mb-login
        
        if (param == null || param.isEmpty()) {
        	param = "/bbs/list.do";
        }
        
        int slashIndex = param.indexOf("-");
        String dir = "";
        String jsp = param.substring(slashIndex + 1);
        String cd = "";

        if (slashIndex != -1) {
        	dir = param.substring(0, slashIndex);
            if (dir.equals("mb")) {
            	cd = "member" + "/" + jsp;
            } else {
            	cd = dir + "/" + jsp;
            }
        } else {
        	cd = param;
        }
        
        String url = "/WEB-INF/" + cd + ".jsp";
        
        req.getRequestDispatcher(url).forward(req, res);
        
        // res.sendRedirect(req.getContextPath() + move);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        doGet(req, res);
    }
}
