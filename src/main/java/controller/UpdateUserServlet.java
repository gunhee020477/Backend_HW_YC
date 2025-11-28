package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        UserDTO sessionUser = (UserDTO) req.getSession().getAttribute("loginUser");
        if (sessionUser == null) {
            res.sendRedirect("page.jsp?view=login");
            return;
        }

        UserDTO dto = new UserDTO();
        dto.setUserid(sessionUser.getUserid());
        dto.setPassword(req.getParameter("password"));
        dto.setName(req.getParameter("name"));
        dto.setEmail(req.getParameter("email"));

        new UserDAO().updateUser(dto);

        req.getSession().setAttribute("loginUser", dto);

        req.setAttribute("msgType", "success");
        req.setAttribute("msg", "✔ 정보가 성공적으로 수정되었습니다.");

        req.getRequestDispatcher("page.jsp?view=mypage").forward(req, res);
    }
}