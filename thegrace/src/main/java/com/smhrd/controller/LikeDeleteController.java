package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MovieDAO;
import com.smhrd.model.ReviewInfo;
import com.smhrd.model.ReviewRecmInfo;

/**
 * Servlet implementation class LikedeleteController
 */
@WebServlet("/LikeDeleteController")
public class LikeDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("user_email");
		int idx = Integer.parseInt(request.getParameter("review_cd"));
		MovieDAO dao = new MovieDAO();
		ReviewRecmInfo deleteLikes = new ReviewRecmInfo(idx,email);
		int res = dao.deletelike(deleteLikes);
		if(res>0) {
			System.out.println("좋아요 취소 성공!");
			RequestDispatcher rd = request.getRequestDispatcher("/reviewShow.jsp");
			rd.forward(request, response);

		} else {
			System.out.println("좋아요 취소 실패!");
			RequestDispatcher rd = request.getRequestDispatcher("/reviewShow.jsp");
			rd.forward(request, response);
		}
	}

}
