package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.AdminDAO;

@WebServlet("/admin/deleteUser")
public class AdminMemberDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        String userid = req.getParameter("userid");
        if (userid != null)
            new AdminDAO().deleteUser(userid);

        res.sendRedirect("memberList");
    }
}