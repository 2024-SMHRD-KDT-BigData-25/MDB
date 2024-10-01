package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MavenMember;
import com.smhrd.model.MemberDAO;

@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터 받기 (아이디, 비밀번호, 닉네임 -> 한글(인코딩))
		
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		
		// 서버에 저장 - JDBC사용 가능하지만 더 사용하기 쉽고 명확한 
		MavenMember joinMember = new MavenMember(id, pw, nickname);
		
		// myBatis DB 연동 프레임 워크 사용해서 테이블에 값 저장하기
		// => 3가지 방법 : DAO(*), @(Annotation), Mapper Interface
		MemberDAO dao = new MemberDAO();
		int res = dao.join(joinMember);
		
		// 회원가입 성공 (res>0) => index.jsp / 실패 => join.html
		if(res>0) {
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("join.html");
		}
	}

}
