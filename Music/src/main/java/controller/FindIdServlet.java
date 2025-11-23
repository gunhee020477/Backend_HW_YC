package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;

@WebServlet("/findId")
public class FindIdServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");

        UserDAO dao = new UserDAO();
        String userid = dao.findId(name, email);

        resp.setContentType("text/html;charset=UTF-8");
        if (userid != null) {
            resp.getWriter().println("<script>alert('아이디: " + userid + "'); location.href='login.jsp';</script>");
        } else {
            resp.getWriter().println("<script>alert('일치하는 정보가 없습니다.'); history.back();</script>");
        }
    }
}