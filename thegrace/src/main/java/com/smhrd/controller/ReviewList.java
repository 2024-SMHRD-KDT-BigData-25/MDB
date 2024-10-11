package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.MovieDAO;
import com.smhrd.model.ReviewInfo;
import com.smhrd.model.UserInfo;

@WebServlet("/list")
public class ReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
//		HttpSession session = request.getSession();
//		UserInfo member = (UserInfo)session.getAttribute("member");
//	
//		
//		int review_cd = Integer.parseInt(request.getParameter("review_cd"));
//		String user_email = (String) session.getAttribute("email");
//		String review_content = request.getParameter("review_content");
//		Date view_dt =  new Date(System.currentTimeMillis());
		
		
		MovieDAO dao = new MovieDAO();
		List<ReviewInfo> list = dao.getReview();
		
		Gson gson = new Gson();
		String json = gson.toJson(list); // toJson의 반환타입은 반드시 String이다.
		
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		out.print(json);
	}
}
	
		