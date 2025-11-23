package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;

@WebServlet("/adminDeleteUser")
public class AdminMemberDeleteServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        if (session.getAttribute("adminid") == null) {
            resp.sendRedirect("adminLogin.jsp");
            return;
        }

        String userid = req.getParameter("userid");
        UserDAO dao = new UserDAO();
        dao.deleteUser(userid);

        resp.sendRedirect("adminMemberList");
    }
}