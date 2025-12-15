package com.pickgok.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.pickgok.track.dao.TrackDAO;
import com.pickgok.user.model.UserDTO;


@WebServlet("/deletePlayHistory")
public class PlayHistoryDeleteServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        HttpSession session = req.getSession(false);
        UserDTO user = (session != null)
                ? (UserDTO) session.getAttribute("loginUser")
                : null;

        if (user == null) {
            resp.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        TrackDAO dao = new TrackDAO();
        String trackId = req.getParameter("trackId");

        if (trackId == null) {
            // 전체 삭제
            dao.deleteAllPlayHistory(user.getUserid());
        } else {
            // 개별 삭제
            dao.deletePlayHistory(user.getUserid(), Integer.parseInt(trackId));
        }

        resp.setStatus(HttpServletResponse.SC_OK);
    }
}
