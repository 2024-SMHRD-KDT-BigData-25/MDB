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
		// 요청 파라미터 받기 (아이디, 비밀번호, 닉네임 -> 한글(인코딩))
		request.setCharacterEncoding("utf-8");
		
		// MultipartRequest => COS 라이브러리 추가
		
		//(request, 파일저장경로, 최대파일크기, 인코딩타입, 파일이름생성규칙)
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("upload");
		int maxSize = 500*1024*1024; //5MB
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		
		String user_email = request.getParameter("user_email");
		String user_pw = request.getParameter("user_pw");
		String nick = request.getParameter("nick");
		String best_mv = request.getParameter("best_mv");
		String pos_color = request.getParameter("pos_color");
		String neg_color = request.getParameter("neg_color");
		String pf_img = multi.getFilesystemName("pf_img");
		Date join_date = new Date(System.currentTimeMillis());
		String join_source = request.getParameter("join_source");
		String best_rev = request.getParameter("best_rev");
		
		// 서버에 저장 - JDBC사용 가능하지만 더 사용하기 쉽고 명확한 
		UserInfo joinMember = new UserInfo(user_email, user_pw, nick, best_mv, pos_color, neg_color, pf_img, join_date, join_source, best_rev);
		
		// myBatis DB 연동 프레임 워크 사용해서 테이블에 값 저장하기
		// => 3가지 방법 : DAO(*), @(Annotation), Mapper Interface
		MovieDAO dao = new MovieDAO();
		int res = dao.join(joinMember);
		
		// 회원가입 성공 (res>0) => index.jsp / 실패 => join.html
		if(res>0) {
			System.out.println("회원가입 성공");
			response.sendRedirect("index.jsp");
		} else {
			System.out.println("회원가입 실패");
			response.sendRedirect("join.html");
		}
	}
}
