package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.FollowingInfo;
import com.smhrd.model.MovieDAO;
import com.smhrd.model.UserInfo;

@WebServlet("/Follow")
public class FollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 본문에서 JSON 데이터 읽기
        StringBuilder sb = new StringBuilder();
        String line;
        try (BufferedReader reader = request.getReader()) {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        // JSON 파싱하여 followee 얻기
        Gson gson = new Gson();
        FolloweeRequest followeeRequest = gson.fromJson(sb.toString(), FolloweeRequest.class);
        String followee = followeeRequest.getFollowee();
        
		HttpSession session = request.getSession();
		UserInfo member = (UserInfo)session.getAttribute("member");
		String follower = member.getUser_email();
		Date followDate = new Date(System.currentTimeMillis());

		FollowingInfo followMember = new FollowingInfo(follower, followee, followDate);

        // 이메일 사용 가능 여부 체크 (여기서 실제 로직을 구현)
        boolean isAvailable = following(followMember);

        // 응답 준비
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"available\":" + isAvailable + "}");
    }

    private boolean following(FollowingInfo followmember) {
		MovieDAO dao = new MovieDAO();
		int res = dao.follow(followmember);
		if( res > 0 ) {
			return true;
		} else {
			return false; // 예시: 성공의 경우 true, 그렇지 않으면 false 반환
		}
    }

    // JSON 요청을 파싱하기 위한 내부 클래스
    private class FolloweeRequest {
        private String followee;

        public String getFollowee() {
            return followee;
        }

        public void setFollowee(String followee) {
            this.followee = followee;	}
    }
}
