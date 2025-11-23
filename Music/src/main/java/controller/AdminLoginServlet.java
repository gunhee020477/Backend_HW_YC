package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.AdminDAO;
import model.AdminDTO;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String adminid = req.getParameter("adminid");
        String password = req.getParameter("password");

        AdminDAO dao = new AdminDAO();
        AdminDTO admin = dao.login(adminid, password);

        if (admin != null) {
            HttpSession session = req.getSession();
            session.setAttribute("adminid", admin.getAdminid());
            session.setAttribute("adminName", admin.getName());
            resp.sendRedirect("adminPage");
        } else {
            req.setAttribute("error", "관리자 정보가 잘못되었습니다.");
            req.getRequestDispatcher("adminLogin.jsp").forward(req, resp);
        }
    }
}