package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;

@WebServlet("/checkId")
public class CheckIdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String userid = req.getParameter("userid");

        UserDAO dao = new UserDAO();
        boolean exists = dao.checkId(userid);

        resp.setContentType("text/plain;charset=UTF-8");
        if (exists) resp.getWriter().print("EXIST");
        else resp.getWriter().print("OK");
    }
}