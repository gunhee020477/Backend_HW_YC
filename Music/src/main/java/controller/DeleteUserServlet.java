package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("userid");
        if (userid == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        UserDAO dao = new UserDAO();
        int result = dao.deleteUser(userid);

        if (result > 0) {
            session.invalidate();
            resp.sendRedirect("index.jsp");
        } else {
            req.setAttribute("error", "회원 탈퇴에 실패했습니다.");
            req.getRequestDispatcher("deleteUser.jsp").forward(req, resp);
        }
    }
}