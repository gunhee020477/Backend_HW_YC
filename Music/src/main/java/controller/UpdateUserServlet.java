package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

import dao.UserDAO;
import model.UserDTO;

@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        UserDTO dto = new UserDTO();
        dto.setUserid(req.getParameter("userid"));
        dto.setPassword(req.getParameter("password"));
        dto.setName(req.getParameter("name"));
        dto.setEmail(req.getParameter("email"));

        UserDAO dao = new UserDAO();
        int result = dao.updateUser(dto);

        if (result > 0) {
            resp.sendRedirect("mypage");
        } else {
            req.setAttribute("error", "정보 수정에 실패했습니다.");
            req.getRequestDispatcher("editUser.jsp").forward(req, resp);
        }
    }
}