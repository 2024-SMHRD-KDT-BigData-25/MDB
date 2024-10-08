package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.MovieDAO;
import com.smhrd.model.UserInfo;

@WebServlet("/CheckEmail")
public class CheckEmailController extends HttpServlet {
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

        // JSON 파싱하여 user_email 얻기
        Gson gson = new Gson();
        EmailRequest emailRequest = gson.fromJson(sb.toString(), EmailRequest.class);
        String user_email = emailRequest.getUser_email();

        // 이메일 사용 가능 여부 체크 (여기서 실제 로직을 구현)
        boolean isAvailable = checkEmailAvailability(user_email);

        // 응답 준비
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"available\":" + isAvailable + "}");
    }

    private boolean checkEmailAvailability(String user_email) {
		MovieDAO dao = new MovieDAO();
		Boolean res = dao.checkEmail(user_email);
        return res; // 예시: 사용 가능할 경우 true, 그렇지 않으면 false 반환
    }

    // JSON 요청을 파싱하기 위한 내부 클래스
    private class EmailRequest {
        private String user_email;

        public String getUser_email() {
            return user_email;
        }

        public void setUser_email(String user_email) {
            this.user_email = user_email;	}
    }
}
