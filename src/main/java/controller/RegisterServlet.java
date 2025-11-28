package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        UserDTO dto = new UserDTO();
        dto.setUserid(req.getParameter("userid"));
        dto.setPassword(req.getParameter("password"));
        dto.setName(req.getParameter("name"));
        dto.setEmail(req.getParameter("email"));

        int result = new UserDAO().insertUser(dto);

        if (result > 0) {
            req.setAttribute("msgType", "success");
            req.setAttribute("msg", "🎉 회원가입이 완료되었습니다! 로그인해주세요.");
            req.getRequestDispatcher("page.jsp?view=login").forward(req, res);
        } else {
            req.setAttribute("msgType", "error");
            req.setAttribute("msg", "⚠ 회원가입 중 문제가 발생했습니다.");
            req.getRequestDispatcher("page.jsp?view=register").forward(req, res);
        }
    }
}