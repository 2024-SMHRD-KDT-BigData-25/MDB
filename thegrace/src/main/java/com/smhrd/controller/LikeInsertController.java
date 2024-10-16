package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MovieDAO;
import com.smhrd.model.ReviewRecmInfo;


@WebServlet("/LikeInsertController")
public class LikeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("user_email");
		int idx = Integer.parseInt(request.getParameter("review_cd"));  // 게시글 ID 가져오기
		System.out.println(email + idx);
		MovieDAO dao = new MovieDAO();
		ReviewRecmInfo insertlike = new ReviewRecmInfo(idx,email);
		int res = dao.insertlike(insertlike);
	
		
		
		if(res>0) {
			System.out.println("성공!");
			RequestDispatcher rd = request.getRequestDispatcher("Board/show_BBS/meetingview.jsp");
			rd.forward(request, response);

		} else {
			System.out.println("실패!");
			RequestDispatcher rd = request.getRequestDispatcher("Board/show_BBS/meetingview.jsp");
			rd.forward(request, response);
		}
	}

}
