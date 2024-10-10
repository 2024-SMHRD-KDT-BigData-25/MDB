package com.smhrd.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.MovieDAO;
import com.smhrd.model.ReviewInfo;
import com.smhrd.model.UserInfo;

@WebServlet("/write")
public class ReviewWrite extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      // MultipartRequest => COS 라이브러리 추가
	      
	      //(request, 파일저장경로, 최대파일크기, 인코딩타입, 파일이름생성규칙)
	      ServletContext context = request.getServletContext();
	      String uploadPath = context.getRealPath("upload");
	      int maxSize = 500*1024*1024; //5MB
	      
	      MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
	      
	      HttpSession session = request.getSession();
	      UserInfo member = (UserInfo)session.getAttribute("member");
	      System.out.println(member);
	      
	      
	      
	      // 정보 받아오기
	      
	      String mv_cd = multi.getParameter("mv_cd");
	      String user_email = member.getUser_email();
	      Double mv_rating = Double.parseDouble(multi.getParameter("mv_rating"));
	      String review_content = multi.getParameter("review_content");
	      Date view_dt =  new Date(System.currentTimeMillis());
	      String open_yn = multi.getParameter("open_yn");
	      String review_img = multi.getFilesystemName("review_img");
	      String pos_neg = multi.getParameter("pos_neg");
	      
	      ReviewInfo uploadReview = new ReviewInfo(mv_cd, user_email, mv_rating, review_content, view_dt, open_yn, review_img, pos_neg);
	      
	      MovieDAO dao = new MovieDAO();
	      int res = dao.reviewWrite(uploadReview);
	      
	      if(res>0) {
	         System.out.println("리뷰 업로드 성공");
	      } else {
	         System.out.println("리뷰 업로드 실패");
	      }
	   }

	}
