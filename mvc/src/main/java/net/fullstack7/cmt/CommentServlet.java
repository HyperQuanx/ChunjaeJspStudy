package net.fullstack7.cmt;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/cmt/comment.do")
public class CommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CommentDAO commentDAO;
    

    @Override
    public void init() throws ServletException {
        commentDAO = new CommentDAO(); // DAO 초기화
    }

    // GET 메서드: 댓글 조회 처리
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	System.out.println("ㅅㅂ");
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            // action이 없으면 기본적으로 댓글 목록을 조회
            listComments(req, res);
        } else {
            // 특정 액션에 따라 다른 동작 처리
            switch (action) {
                case "edit":
                    showEditForm(req, res); // 댓글 수정 폼 보여주기
                    break;
                case "delete":
                    deleteComment(req, res); // 댓글 삭제
                    break;
                default:
                    listComments(req, res); // 기본 댓글 목록 조회
                    break;
            }
        }
    }

    // POST 메서드: 댓글 등록 및 수정 처리
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null || action.isEmpty()) {
            // 기본적으로 댓글 등록 처리
            insertComment(req, res);
        } else {
            // 특정 액션에 따라 다른 동작 처리
            switch (action) {
                case "update":
                    updateComment(req, res); // 댓글 수정 처리
                    break;
                default:
                    insertComment(req, res); // 댓글 등록 처리
                    break;
            }
        }
    }

    // 댓글 목록 조회
    private void listComments(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int bbsIdx = Integer.parseInt(req.getParameter("bbsIdx")); // 게시글 인덱스
        List<CommentDTO> commentList = commentDAO.getCommentsByBbsIdx(bbsIdx);
        req.setAttribute("commentList", commentList);
        req.getRequestDispatcher("/WEB-INF/bbs/view.jsp").forward(req, res); // 댓글 목록을 JSP로 전달
    }

    // 댓글 등록 처리
    private void insertComment(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int bbsIdx = Integer.parseInt(req.getParameter("bbsIdx"));
        String memberId = req.getParameter("memberId");
        String content = req.getParameter("content");
        Integer parentIdx = req.getParameter("parentIdx") != null ? Integer.parseInt(req.getParameter("parentIdx")) : null;

        CommentDTO dto = new CommentDTO();
        dto.setBbsIdx(bbsIdx);
        dto.setMemberId(memberId);
        dto.setContent(content);
        dto.setParentIdx(parentIdx);

        commentDAO.insertComment(dto);

        res.sendRedirect("comment?action=list&bbsIdx=" + bbsIdx); // 댓글 등록 후 다시 목록으로 이동
    }

    // 댓글 수정 폼 보여주기
    private void showEditForm(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        int idx = Integer.parseInt(req.getParameter("idx")); // 수정할 댓글 인덱스
        CommentDTO existingComment = commentDAO.getCommentByIdx(idx);
        req.setAttribute("comment", existingComment);
        req.getRequestDispatcher("/WEB-INF/views/comment_edit.jsp").forward(req, res); // 수정 폼으로 이동
    }

    // 댓글 수정 처리
    private void updateComment(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int idx = Integer.parseInt(req.getParameter("idx"));
        String content = req.getParameter("content");
        String memberId = req.getParameter("memberId");

        CommentDTO dto = new CommentDTO();
        dto.setIdx(idx);
        dto.setContent(content);
        dto.setMemberId(memberId);

        commentDAO.updateComment(dto);

        int bbsIdx = Integer.parseInt(req.getParameter("bbsIdx"));
        res.sendRedirect("comment?action=list&bbsIdx=" + bbsIdx); // 수정 후 목록으로 이동
    }

    // 댓글 삭제 처리
    private void deleteComment(HttpServletRequest req, HttpServletResponse res) throws IOException {
        int idx = Integer.parseInt(req.getParameter("idx"));
        String memberId = req.getParameter("memberId");

        commentDAO.deleteComment(idx, memberId);

        int bbsIdx = Integer.parseInt(req.getParameter("bbsIdx"));
        res.sendRedirect("comment?action=list&bbsIdx=" + bbsIdx); // 삭제 후 목록으로 이동
    }
}
