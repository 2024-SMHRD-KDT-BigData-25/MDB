package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
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

@WebServlet("/NaverLoginController")
public class NaverLoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        // 기존 세션 무효화 후 새로운 세션 생성
        HttpSession session = request.getSession(true);
        session.invalidate(); 
        session = request.getSession(true);

        String clientId = "H1vuE8JE6UJiGKXQiRzY";  // 애플리케이션 클라이언트 아이디
        String clientSecret = "HoGTIyWmPf";        // 애플리케이션 클라이언트 시크릿
        String code = request.getParameter("code"); // 네이버 로그인 후 받은 코드
        String state = request.getParameter("state"); // 상태 값
        String redirectURI = URLEncoder.encode("http://localhost:8081/thegrace/callback.jsp", "UTF-8");
        String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
            + "&client_id=" + clientId
            + "&client_secret=" + clientSecret
            + "&redirect_uri=" + redirectURI
            + "&code=" + code
            + "&state=" + state;

        String accessToken = "";
        String refreshToken = "";

        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();

            BufferedReader br;
            if (responseCode == 200) {
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuilder res = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();

            if (responseCode == 200) {
                // JSON 응답에서 accessToken 및 refreshToken 가져오기
                JSONObject jsonResponse = new JSONObject(res.toString());
                accessToken = jsonResponse.getString("access_token");
                refreshToken = jsonResponse.getString("refresh_token");

                // 세션에 accessToken 저장
                session.setAttribute("accessToken", accessToken);
                System.out.println("Access Token: " + accessToken);
                System.out.println("Refresh Token: " + refreshToken);

                // 액세스 토큰으로 유저 정보 요청
                String header = "Bearer " + accessToken; // Bearer 다음에 공백 추가
                String apiURLUserInfo = "https://openapi.naver.com/v1/nid/me";

                // API 요청 헤더 생성
                Map<String, String> requestHeaders = new HashMap<>();
                requestHeaders.put("Authorization", header);

                // API 요청 및 응답 처리
                String responseBody = get(apiURLUserInfo, requestHeaders);

                // JSON 응답에서 이메일 정보, 닉네임, 프로필 이미지 추출
                JSONObject jsonResponseUserInfo = new JSONObject(responseBody);
                String user_email = jsonResponseUserInfo.getJSONObject("response").getString("email");
                String nick = jsonResponseUserInfo.getJSONObject("response").getString("nickname");
                String pf_img = jsonResponseUserInfo.getJSONObject("response").getString("profile_image");
                
                UserInfo joinCinematografo = new UserInfo(user_email, null, nick, null, null, null, pf_img, null, null, null); 
                
                System.out.println("Naver email: " + user_email);

                // 세션에 이메일 저장
//                session.setAttribute("email", user_email);
                session.setAttribute("member", joinCinematografo);

                // 유저 정보 DB 저장
                UserInfo NaverLogin = new UserInfo(user_email);      
                MovieDAO dao = new MovieDAO();
                UserInfo resUserInfo = dao.naverLogin(NaverLogin);

                
                // 메인 페이지로 리다이렉트
                response.sendRedirect("main.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
            if (responseCode == HttpURLConnection.HTTP_OK) {
                return readBody(con.getInputStream());
            } else {
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