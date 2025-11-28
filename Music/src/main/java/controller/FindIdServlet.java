package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/findId")
public class FindIdServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String name = req.getParameter("name");
        String email = req.getParameter("email");

        UserDAO dao = new UserDAO();
        String userid = dao.findId(name, email);

        if (userid != null) {
            req.setAttribute("msgType", "success");
            req.setAttribute("msg", "당신의 아이디는: " + userid);
        } else {
            req.setAttribute("msgType", "error");
            req.setAttribute("msg", "일치하는 회원 정보를 찾을 수 없습니다.");
        }

        req.setAttribute("pageType", "findId");
        req.setAttribute("content", "pageContent.jsp");

        req.getRequestDispatcher("layout.jsp").forward(req, resp);
    }
}