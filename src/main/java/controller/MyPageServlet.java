package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/mypage")
public class MyPageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        if (req.getSession().getAttribute("loginUser") == null) {
            res.sendRedirect("pages/login.jsp");
            return;
        }

        req.getRequestDispatcher("pages/mypage.jsp").forward(req, res);
    }
}