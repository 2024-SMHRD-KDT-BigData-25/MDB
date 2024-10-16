package com.smhrd.controller;

import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

@WebServlet("/callback")
public class NaverCallback extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, java.io.IOException {
        // 기존 세션 무효화
        HttpSession session = request.getSession();
        session.invalidate();

        String clientId = "H1vuE8JE6UJiGKXQiRzY"; // 애플리케이션 클라이언트 아이디값
        String clientSecret = "HoGTIyWmPf"; // 애플리케이션 클라이언트 시크릿값
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode("/callback", "UTF-8");
        
        String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&redirect_uri=" + redirectURI
                + "&code=" + code
                + "&state=" + state
                + "&prompt=login"; // 항상 로그인 요구

        String accessToken = "";
        String refreshToken = "";

        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuilder res = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();
            if (responseCode == 200) {
                // JSON 응답을 파싱하여 access token과 refresh token을 가져옴
                JSONObject jsonResponse = new JSONObject(res.toString());
                accessToken = jsonResponse.getString("access_token");
                refreshToken = jsonResponse.getString("refresh_token"); // 필요 시 refresh token도 가져올 수 있음
                int expiresIn = jsonResponse.getInt("expires_in"); // 만료 시간(초)
                
                session = request.getSession();
                session.setAttribute("accessToken", accessToken);

                // AccessToken 확인을 위해 출력
                System.out.println("Access Token: " + accessToken);
                System.out.println("Refresh Token: " + refreshToken);
            }
        } catch (Exception e) {
            // Exception 로깅
            e.printStackTrace();
        }

        // AccessTokenServlet으로 리다이렉트
        response.sendRedirect("AccessToken");
    }
}