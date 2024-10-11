package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.FollowPf;
import com.smhrd.model.FollowingInfo;
import com.smhrd.model.MovieDAO;

@WebServlet("/followStatus")
public class followStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String targetId = request.getParameter("targetId");
		
		FollowingInfo f4fu = new FollowingInfo(userId, targetId);
		FollowingInfo f4ft = new FollowingInfo(targetId, userId);
		
		MovieDAO dao = new MovieDAO();
		boolean userFollow = dao.F4F(f4fu);
		boolean targetFollow = dao.F4F(f4ft);
		
		
		// F4F - 맞팔 / following - 팔로우 하고 있는 상태 / follower - 팔로우 당한 상태 / 0 - 아무 관계도 없는 상태
		String followStatus;
		if ( userFollow && targetFollow ) {
			followStatus = "F4F";
		} else if ( userFollow && !targetFollow ) {
			followStatus = "following";
		} else if ( !userFollow && targetFollow ) {
			followStatus = "follower";
		} else {
			followStatus = "none";
		} 
		
		// 응답 준비
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write("{\"followStatus\":" + followStatus + "}");
		
	}

}
