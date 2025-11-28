package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.AdminDAO;
import model.AdminDTO;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("adminid");
        String pw = req.getParameter("password");

        AdminDTO dto = new AdminDAO().login(id, pw);

        if (dto != null) {
            req.getSession().setAttribute("adminUser", dto);
            res.sendRedirect("page.jsp?view=adminMain");
        } else {
            req.setAttribute("msgType", "error");
            req.setAttribute("msg", "❌ 관리자 로그인 실패");
            req.getRequestDispatcher("page.jsp?view=adminLogin").forward(req, res);
        }
    }
}