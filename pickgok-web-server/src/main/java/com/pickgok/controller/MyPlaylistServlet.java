package com.pickgok.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.pickgok.track.dao.TrackDAO;
import com.pickgok.track.model.TrackDTO;
import com.pickgok.user.model.UserDTO;


@WebServlet("/myPlaylist")
public class MyPlaylistServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        UserDTO user = (session != null)
                ? (UserDTO) session.getAttribute("loginUser")
                : null;

        if (user == null) {
            resp.sendRedirect(req.getContextPath() + "/views/user/login.jsp");
            return;
        }

        TrackDAO dao = new TrackDAO();
        List<TrackDTO> playList = dao.getMyPlayHistory(user.getUserid());

        req.setAttribute("playList", playList);
        // ⚠️ JSP 위치 기준
        req.getRequestDispatcher("/myplaylist.jsp").forward(req, resp);
    }
}