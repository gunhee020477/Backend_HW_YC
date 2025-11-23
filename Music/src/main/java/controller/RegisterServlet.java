package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        UserDTO dto = new UserDTO();
        dto.setUserid(req.getParameter("userid"));
        dto.setPassword(req.getParameter("password"));
        dto.setName(req.getParameter("name"));
        dto.setEmail(req.getParameter("email"));

        UserDAO dao = new UserDAO();
        int result = dao.register(dto);

        if (result > 0) {
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("error", "회원가입에 실패했습니다. (아이디 중복 또는 서버 오류)");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}