package com.smhrd.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import org.json.JSONObject;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.stream.Collectors;

@WebServlet("/RecommendController")
public class RecommendController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 데이터 받기
        String json = request.getReader().lines().collect(Collectors.joining());
        JSONObject jsonObject = new JSONObject(json);
        int reviewCd = jsonObject.getInt("reviewCd");
        String userEmail = jsonObject.getString("userEmail");

        String dbUrl = "jdbc:oracle:thin:@project-db-cgi.smhrd.com:1524/xe";
        String dbUsername = "sc_21K_bigdata24_p2_4";
        String dbPassword = "smhrd4";
        
        // 데이터베이스에 추천 정보 추가
        try (Connection conn = DriverManager.getConnection(dbUrl, dbUsername, dbPassword)) {
            String sql = "INSERT INTO review_recm_info (review_cd, user_email, recm_date) VALUES (?, ?, SYSDATE)";
            try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
                pstmt.setInt(1, reviewCd);
                pstmt.setString(2, userEmail);
                pstmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            return;
        }

        // 응답 반환
        response.setStatus(HttpServletResponse.SC_OK);
        System.out.println("ReviewCd: " + reviewCd + ", UserEmail: " + userEmail);
    }
}