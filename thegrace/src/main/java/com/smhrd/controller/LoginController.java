package com.smhrd.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import com.smhrd.model.UserInfo;
import com.smhrd.model.MovieDAO;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(
			HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(true);
		request.setCharacterEncoding("utf-8");
		
		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		
		UserInfo loginMember = new UserInfo(user_email, user_pw);
		
		MovieDAO dao = new MovieDAO();
		UserInfo res = dao.login(loginMember);
		
		// res is null => 로그인 실패 / null x => 성공
		if(res == null) {
			response.sendRedirect("login.jsp");
		} else {
			request.getSession().setAttribute("userEmail", user_email);
			request.getSession().setAttribute("member", res);
			
			// 세션에 값이 제대로 저장되었는지 확인 (디버그용)
//			System.out.println("세션에 저장된 userEmail: " + session.getAttribute("userEmail"));
//			System.out.println("세션에 저장된 member: " + session.getAttribute("member"));
			RequestDispatcher dispatcher = request.getRequestDispatcher("main.jsp");
			dispatcher.forward(request, response);
		}
	
	}

}
