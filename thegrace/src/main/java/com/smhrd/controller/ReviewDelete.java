package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MovieDAO;

@WebServlet("/delete")
public class ReviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // 전부 수정사항
	    int review_cd = Integer.parseInt(request.getParameter("review_cd"));
	    
	    MovieDAO dao = new MovieDAO();
	    int res = dao.reviewDelete(review_cd);

	    PrintWriter out = response.getWriter();
	      out.print(res);
	}
}
