package com.smhrd.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.smhrd.model.MovieDAO;
import com.smhrd.model.UserVoteInfo;

@WebServlet("/vote")
public class VoteController extends HttpServlet {
	
    private static final long serialVersionUID = 1L;
    private Map<Integer, Integer> voteCount = new HashMap<>();
    private MovieDAO movieDAO = new MovieDAO();

    @Override
    public void init() throws ServletException {
        updateVoteCount();
    }

    private void updateVoteCount() {
        // 영화 제목을 DB에서 가져와서 초기 투표 카운트 설정
        List<String> movieTitles = movieDAO.getWeekMovieTitles(1002);
        for (int i = 1; i <= movieTitles.size(); i++) {
            if (!voteCount.containsKey(i)) {
                voteCount.put(i, 0);  // 영화 ID에 맞춰 투표 카운트 초기화
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 영화 목록과 투표 결과를 가져옴
        List<String> movieTitles = movieDAO.getWeekMovieTitles(1002);
        List<Integer> results = movieDAO.getVoteCnt(1002);

        // JSON으로 응답
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("movieTitles", movieTitles);
        jsonResponse.put("results", results);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonResponse.toString());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 사용자가 이미 투표했는지 확인
        HttpSession session = request.getSession();
        String userVoted = (String) session.getAttribute("userVoted");

        if (userVoted != null) {
            // 이미 투표한 경우 에러 응답
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("error", "이미 투표하셨습니다! 일주일 후에 다시 투표하세요.");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(errorResponse.toString());
            return;
        }

        // 투표 처리
        String movieIdParam = request.getParameter("movieId");
        try {
            int movieId = Integer.parseInt(movieIdParam);

            // 투표 카운트 업데이트
            if (voteCount.containsKey(movieId)) {
                voteCount.put(movieId, voteCount.get(movieId) + 1);

                // 투표 내역을 DB에 저장
                String userEmail = (String) session.getAttribute("userEmail");
                UserVoteInfo userVote = new UserVoteInfo(0, 1002, Integer.toString(movieId), new java.util.Date().toString(), userEmail);
                movieDAO.insertUserVote(userVote);

                // 최신 결과 반환
                List<String> movieTitles = movieDAO.getWeekMovieTitles(1002);
                List<Integer> results = movieDAO.getVoteCnt(1002);

                JSONObject jsonResponse = new JSONObject();
                jsonResponse.put("movieTitles", movieTitles);
                jsonResponse.put("results", results);

                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write(jsonResponse.toString());

                // 세션에 투표 여부 저장 (일주일 동안 유지)
                session.setAttribute("userVoted", "true");
                session.setMaxInactiveInterval(60 * 60 * 24 * 7); // 1주일 동안 유효

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 영화 ID입니다.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "잘못된 영화 ID 형식입니다.");
        }
    }
}