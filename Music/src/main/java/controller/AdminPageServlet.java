package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/adminPage")
public class AdminPageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        if (session.getAttribute("adminid") == null) {
            resp.sendRedirect("adminLogin.jsp");
            return;
        }
        req.getRequestDispatcher("adminPage.jsp").forward(req, resp);
    }
}