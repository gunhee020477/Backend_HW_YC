package com.pickgok.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.pickgok.track.dao.TrackDAO;
import com.pickgok.user.model.UserDTO;

@WebServlet("/count")
public class PlayCountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1️⃣ 로그인 사용자 확인
        HttpSession session = request.getSession(false);
        UserDTO loginUser = (session != null)
                ? (UserDTO) session.getAttribute("loginUser")
                : null;

        String trackIdStr = request.getParameter("track_id");

        if (loginUser != null && trackIdStr != null) {
            try {
                int trackId = Integer.parseInt(trackIdStr);
                String userId = loginUser.getUserid();

                TrackDAO dao = new TrackDAO();

                // 2️⃣ 재생 횟수 증가
                dao.incrementPlayCount(trackId);

                // 3️⃣ 🔥 재생 기록 저장 (user_history)
                dao.insertUserHistory(userId, trackId, "PLAY");

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // 4️⃣ 응답은 200 OK만 반환 (AJAX용)
        response.setStatus(HttpServletResponse.SC_OK);
    }
}
