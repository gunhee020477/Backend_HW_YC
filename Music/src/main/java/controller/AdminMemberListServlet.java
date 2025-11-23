package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/adminMemberList")
public class AdminMemberListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        if (session.getAttribute("adminid") == null) {
            resp.sendRedirect("adminLogin.jsp");
            return;
        }

        UserDAO dao = new UserDAO();
        List<UserDTO> users = dao.getAllUsers();

        req.setAttribute("users", users);
        req.getRequestDispatcher("adminMemberList.jsp").forward(req, resp);
    }
}