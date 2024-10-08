package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Logout")
public class LogoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃
		// HttpSession (세션영역)에 저장되어 있는 member 값 삭제
		
		HttpSession sessioin = request.getSession();
		sessioin.removeAttribute("member");
		// session.invalidate(); 세션 값 모두 삭제
		response.sendRedirect("index.html");
    }
}