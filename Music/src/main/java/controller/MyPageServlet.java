package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/mypage")
public class MyPageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        String userid = (String) session.getAttribute("userid");

        if (userid == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        UserDAO dao = new UserDAO();
        UserDTO user = dao.getUser(userid);

        req.setAttribute("user", user);
        req.getRequestDispatcher("mypage.jsp").forward(req, resp);
    }
}