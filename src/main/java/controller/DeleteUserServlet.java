package controller;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException {

        UserDTO user = (UserDTO) req.getSession().getAttribute("loginUser");
        if (user != null) {
            new UserDAO().deleteUser(user.getUserid());
            req.getSession().invalidate();
        }
        res.sendRedirect("page.jsp?view=login");
    }
}