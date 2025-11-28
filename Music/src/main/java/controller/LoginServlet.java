package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String id = req.getParameter("userid");
        String pw = req.getParameter("password");

        UserDAO dao = new UserDAO();
        UserDTO dto = dao.login(id, pw);

        if (dto != null) {
            req.getSession().setAttribute("loginUser", dto);
            resp.sendRedirect("page.jsp?view=main");
        } else {
            req.setAttribute("msgType", "error");
            req.setAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
            req.setAttribute("pageType", "login");
            req.setAttribute("content", "pageContent.jsp");
            req.getRequestDispatcher("layout.jsp").forward(req, resp);
        }
    }
}