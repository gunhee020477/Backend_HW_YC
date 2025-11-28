package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import dao.AdminDAO;
import model.UserDTO;

@WebServlet("/admin/memberList")
public class AdminMemberListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setAttribute("userList", new AdminDAO().getAllUsers());
        req.getRequestDispatcher("page.jsp?view=adminMember").forward(req, res);
    }
}