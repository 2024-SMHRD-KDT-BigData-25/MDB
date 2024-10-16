package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.smhrd.model.ChartGenre;
import com.smhrd.model.MovieDAO;


@WebServlet("/chart")
public class MyPageChartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MovieDAO dao = new MovieDAO();
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 세션에서 유저 이메일 가져오기 (로그인 시 저장된 값 사용)
        String userEmail = (String) request.getSession().getAttribute("userEmail");

        if (userEmail != null) {
            List<ChartGenre> myGenreTop = dao.myGenreTop(userEmail);

            // JSON 객체 생성
            JSONArray jsonArray = new JSONArray();
            for (ChartGenre item : myGenreTop) {
                JSONObject jsonObject = new JSONObject();
                jsonObject.put("genre", item.getMv_genre());
                jsonObject.put("reviewCount", item.getCnt());
                jsonArray.put(jsonObject);
            }

            // JSON 응답 설정
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonArray.toString());
        } else {
            // 유저 이메일이 없는 경우 에러 처리
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "로그인이 필요합니다.");
        }
    }
}


