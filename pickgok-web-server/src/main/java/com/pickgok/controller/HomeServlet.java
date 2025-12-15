package com.pickgok.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.pickgok.track.dao.TrackDAO;
import com.pickgok.track.model.TrackDTO;

// 사용자가 http://localhost:8080/PickGok/home 으로 접속하면 실행됨
@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        TrackDAO dao = new TrackDAO();
        TrackDTO track = null;

        // ⭐ 1. URL 파라미터로 trackId가 있는지 확인
        String trackIdParam = request.getParameter("trackId");

        if (trackIdParam != null) {
            try {
                int trackId = Integer.parseInt(trackIdParam);
                // ⭐ 2. 특정 곡 조회
                track = dao.getTrackById(trackId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }

        // ⭐ 3. trackId가 없거나 조회 실패 시 → 랜덤 곡
        if (track == null) {
            track = dao.getRandomTrack();
        }

        // 4. request에 저장
        request.setAttribute("track", track);

        // ⚠️ 경로 중요: 지금 네 프로젝트 구조 기준
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }
}