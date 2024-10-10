package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.FollowingInfo;
import com.smhrd.model.MovieDAO;
import com.smhrd.model.UserInfo;

@WebServlet("/Unfollow")
public class UnfollowController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		UserInfo member = (UserInfo)session.getAttribute("member");
		String follower = member.getUser_email();
		String followee = request.getParameter("user_email");
	
		FollowingInfo followmember = new FollowingInfo(follower, followee);
		
		MovieDAO dao = new MovieDAO();
		int res = dao.unfollow(followmember);
		
		if ( res > 0 ) {
			System.out.println("언팔로우 성공 : " + res);
		} else {
			System.out.println("언팔로우 실패");
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write("{\"available\":" + false + "}");
		}
	}

}