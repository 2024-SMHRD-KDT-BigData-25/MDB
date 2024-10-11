package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.FollowPf;
import com.smhrd.model.MovieDAO;

@WebServlet("/followStatus")
public class followStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String targetId = request.getParameter("targetId");
		
		MovieDAO dao = new MovieDAO();
		List<FollowPf> userFollower = dao.getFollower(userId);
		List<FollowPf> targetFollower = dao.getFollower(targetId);
		
		for ( FollowPf u : userFollower ) {
			for ( FollowPf t : targetFollower )
			if (u.getFollower() == targetId && t.getFollower() == userId ) {
				
			} else if (u.getFollower() != targetId && t.getFollower() == userId) {
				
			} else if (u.getFollower() == targetId && t.getFollower() != userId) {
				
			}
		}
		
	
	}

}
