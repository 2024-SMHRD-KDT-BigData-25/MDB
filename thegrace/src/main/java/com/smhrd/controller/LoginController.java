package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;
import com.smhrd.model.MavenMember;
import com.smhrd.model.MemberDAO;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		MavenMember loginMember = new MavenMember(id, pw);
		
		MemberDAO dao = new MemberDAO();
		// res is null => 로그인 실패 / null x => 성공
		MavenMember res = dao.login(loginMember);
		
		if(res == null) {
			System.out.println("로그인 실패");
			response.sendRedirect("login.html");
		} else {
			System.out.println("로그인 성공 " + res.getNickname());
			HttpSession session = request.getSession();
			session.setAttribute("member", res);
			response.sendRedirect("index.jsp");
		}
	}

}
