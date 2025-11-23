package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import dao.UserDAO;
import model.UserDTO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String userid = req.getParameter("userid");
        String password = req.getParameter("password");

        UserDAO dao = new UserDAO();
        UserDTO user = dao.login(userid, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("userid", user.getUserid());
            session.setAttribute("userName", user.getName());
            resp.sendRedirect("mypage");
        } else {
            req.setAttribute("error", "로그인 정보가 잘못되었습니다.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}