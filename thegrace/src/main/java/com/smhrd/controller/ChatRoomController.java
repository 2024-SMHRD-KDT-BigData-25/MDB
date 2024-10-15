package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChatRoomController")
public class ChatRoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 클라이언트에서 받은 채팅방 ID (croom_cd)
        String croom_cd = request.getParameter("croom_cd");
        
        // 현재 사용자와 관련된 채팅방 ID를 서버에서 조회하거나 세션에서 가져옴
        String userRoomCd = (String) request.getSession().getAttribute("userRoomCd");

        // 방 번호가 동일한지 확인 (동일하면 입장 허용, 다르면 거부)
        if (userRoomCd != null && userRoomCd.equals(croom_cd)) {
            response.getWriter().write("{\"access\": \"allowed\"}");
        } else {
            response.getWriter().write("{\"access\": \"denied\"}");
        }
    }
}
