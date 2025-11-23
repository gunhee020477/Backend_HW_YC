package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;

@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String userid = req.getParameter("userid");
        String email = req.getParameter("email");

        UserDAO dao = new UserDAO();
        String pw = dao.findPassword(userid, email);

        resp.setContentType("text/html;charset=UTF-8");
        if (pw != null) {
            resp.getWriter().println("<script>alert('비밀번호: " + pw + "'); location.href='login.jsp';</script>");
        } else {
            resp.getWriter().println("<script>alert('일치하는 정보가 없습니다.'); history.back();</script>");
        }
    }
}