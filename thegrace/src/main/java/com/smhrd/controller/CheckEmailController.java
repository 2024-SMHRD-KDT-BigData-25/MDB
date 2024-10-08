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
        String user_email = emailRequest.getUsername();

        // 이메일 사용 가능 여부 체크 (여기서 실제 로직을 구현)
        boolean isAvailable = checkEmailAvailability(user_email);

        // 응답 준비
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"available\":" + isAvailable + "}");
    }

    private boolean checkEmailAvailability(String username) {
        // 이메일 사용 가능 여부를 확인하는 로직 구현 (예: 데이터베이스 확인)
        return true; // 예시: 사용 가능할 경우 true, 그렇지 않으면 false 반환
    }

    // JSON 요청을 파싱하기 위한 내부 클래스
    private class EmailRequest {
        private String username;

        public String getUsername() {
            return username;
        }

        public void setUsername(String username) {
            this.username = username;	}
    }
}
