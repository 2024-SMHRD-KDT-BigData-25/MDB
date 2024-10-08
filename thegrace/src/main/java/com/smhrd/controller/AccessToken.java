package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.smhrd.model.MovieDAO;
import com.smhrd.model.UserInfo;

@WebServlet("/AccessToken")
public class AccessToken extends HttpServlet {

    // 서블릿에서 GET 요청을 처리할 때 사용하는 메서드
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // 세션에서 accessToken을 가져오기 (JSP에서 세션에 저장된 경우)
        HttpSession session = request.getSession(true);
       
        String token = (String) session.getAttribute("accessToken");

        if (token == null || token.isEmpty()) {
            response.getWriter().println("Access Token is missing");
            return;
        }

        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        String apiURL = "https://openapi.naver.com/v1/nid/me";

        // API 요청 헤더 생성
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("Authorization", header);

        // API 요청 및 응답 처리
        String responseBody = get(apiURL, requestHeaders);
        
        // JSON 응답에서 이메일 정보, 닉네임, 프로필 이미지 추출
        JSONObject jsonResponse = new JSONObject(responseBody);
        String user_email = jsonResponse.getJSONObject("response").getString("email");
        String nick = jsonResponse.getJSONObject("response").getString("nickname");
        String pf_img = jsonResponse.getJSONObject("response").getString("profile_image");
        
        
        // 이메일 정보, 닉네임, 프로필 이미지를 세션에 저장
        session.setAttribute("email", user_email);
        session.setAttribute("nickname", nick);
        session.setAttribute("profile_image", pf_img);
        
        // 이메일 정보, 닉네임, 프로필 이미지를 응답으로 전송
        response.setContentType("application/json");
        response.getWriter().write("{\"email\": \"" + user_email + "\"}");
        response.getWriter().write("{\"nickname\": \"" + nick + "\"}");
        response.getWriter().write("{\"profile_image\": \"" + pf_img + "\"}");
        
        response.sendRedirect("login.jsp");

        // 응답 내용을 출력
        response.setContentType("application/json");
        response.getWriter().write(responseBody);
        
        UserInfo joinCinematografo = new UserInfo(user_email, null, nick, null, null, null, pf_img, null, null, null);      
        MovieDAO dao = new MovieDAO();
		int res = dao.naverJoin(joinCinematografo);
		
    }
    

    // 네이버 API 호출 메서드
    private static String get(String apiUrl, Map<String, String> requestHeaders) throws IOException {
        HttpURLConnection con = connect(apiUrl);
        try {
            con.setRequestMethod("GET");
            for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
                return readBody(con.getInputStream());
            } else { // 에러 발생
                return readBody(con.getErrorStream());
            }
        } finally {
            con.disconnect();
        }
    }

    // URL 연결 생성 메서드
    private static HttpURLConnection connect(String apiUrl) throws IOException {
        URL url = new URL(apiUrl);
        return (HttpURLConnection) url.openConnection();
    }

    // API 응답 본문을 읽어오는 메서드
    private static String readBody(InputStream body) throws IOException {
        InputStreamReader streamReader = new InputStreamReader(body);
        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();
            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }
            return responseBody.toString();
        }
    }
    
}
