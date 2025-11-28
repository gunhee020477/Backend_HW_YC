package controller;

import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/findPw")
public class FindPwServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String userid = req.getParameter("userid");
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        String tempPw = String.valueOf((int)(Math.random() * 90000 + 10000));

        UserDAO dao = new UserDAO();
        int result = dao.updateTempPw(userid, name, email, tempPw);

        if (result == 1) {
            req.setAttribute("msgType", "success");
            req.setAttribute("msg", "임시 비밀번호: " + tempPw);
        } else {
            req.setAttribute("msgType", "error");
            req.setAttribute("msg", "일치하는 정보가 없습니다.");
        }

        req.setAttribute("pageType", "findPw");
        req.setAttribute("content", "pageContent.jsp");

        req.getRequestDispatcher("layout.jsp").forward(req, resp);
    }
}