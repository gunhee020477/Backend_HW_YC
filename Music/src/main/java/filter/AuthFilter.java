package filter;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebFilter({"/mypage", "/editUser", "/updateUser", "/deleteUser"})
public class AuthFilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("userid") == null) {
            resp.sendRedirect("login.jsp");
            return;
        }
        chain.doFilter(request, response);
    }
}