package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.UserInfo;
import com.smhrd.model.MovieDAO;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		System.out.println(user_email + user_pw);
		
		UserInfo loginMember = new UserInfo(user_email, user_pw);
		
		MovieDAO dao = new MovieDAO();
		UserInfo res = dao.login(loginMember);
		
		// res is null => 로그인 실패 / null x => 성공
		if(res == null) {
			System.out.println("로그인 실패");
			response.sendRedirect("login.html");
		} else {
			System.out.println("로그인 성공 " + res.getNick());
			HttpSession session = request.getSession();
			session.setAttribute("member", res);
			response.sendRedirect("index.html");
		}
	
	}

}
