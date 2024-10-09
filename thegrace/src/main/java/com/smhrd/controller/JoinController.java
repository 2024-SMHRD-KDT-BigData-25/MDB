package com.smhrd.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.UserInfo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.MovieDAO;

@WebServlet("/Join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		String nick = request.getParameter("nick");
		Date join_date = new Date(System.currentTimeMillis());
		String join_source = "cinemagrafo";
		
		System.out.println(user_email + user_pw + nick + join_date + join_source);
		
		// 서버에 저장 
		UserInfo joinMember = new UserInfo(user_email, user_pw, nick, join_date, join_source);
		
		MovieDAO dao = new MovieDAO();
		int res = dao.join(joinMember);
		
		// 회원가입 성공 (res>0) => index.jsp / 실패 => join.html
		if(res>0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("index.html");
		} else {
			System.out.println("회원가입 실패");
			response.sendRedirect("join.html");
		}
	}
}
