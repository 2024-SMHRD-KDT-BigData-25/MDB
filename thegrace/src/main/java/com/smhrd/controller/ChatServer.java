package com.smhrd.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.OnClose;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import com.smhrd.model.ChatroomInfo;
import com.smhrd.model.ChattingInfo;
import com.smhrd.model.MovieDAO;

//이 서버로 연결하기 위한 주소 설정
//ws://localhost:8081/mavenboard/chat
@ServerEndpoint("/chat/{userEmail}/{followee}")
public class ChatServer {
	private static Map<String, Set<Session>> chatRooms = new ConcurrentHashMap<>();
	
	private  MovieDAO dao = new MovieDAO();

    @OnOpen
    public void onOpen(Session session, @PathParam("userEmail") String userEmail, @PathParam("followee") String followee) throws IOException {
        String croom_cd = createChatRoomId(userEmail, followee);
        
        ChatroomInfo chatroomInfo = new ChatroomInfo(croom_cd, userEmail, followee);

	    // 채팅방 존재 여부 확인
	    if (!dao.doesChatRoomExist(croom_cd)) {
	        // 새로운 채팅방 생성
	        dao.createChatroom(chatroomInfo);
	    }

	    // 이전 채팅 기록 불러오기
	    List<ChattingInfo> previousMessages = dao.getMessagesByRoomId(croom_cd);
	        
	    if(previousMessages!=null) {
		    for (ChattingInfo message : previousMessages) {
		        session.getBasicRemote().sendText(message.getChatter() + ": " + message.getChatting() + " (" + message.getCreated_at() + ")");
		    }
	    }

	    // 채팅방 세션 관리 추가
	    chatRooms.computeIfAbsent(croom_cd, k -> ConcurrentHashMap.newKeySet()).add(session);

	    System.out.println("User " + userEmail + " connected to chat room: " + croom_cd);
	}
    
    private String createChatRoomId(String userEmail, String followee) {
        return userEmail.compareTo(followee) > 0 ? userEmail + "_" + followee : followee + "_" + userEmail;
    }
		
	// close : 연결해제
	@OnClose // 특정 클라이언트만 연결 해제
	public void onClose(Session session, @PathParam("userEmail") String userEmail, @PathParam("followee") String followee) {
		String chatRoomId = createChatRoomId(userEmail, followee);
        Set<Session> roomSessions = chatRooms.get(chatRoomId);

        if (roomSessions != null) {
            roomSessions.remove(session);
            if (roomSessions.isEmpty()) {
                chatRooms.remove(chatRoomId);
            }
        }
        System.out.println("User " + userEmail + " disconnected from chat room: " + chatRoomId);

	}
	
    public void onMessage(String message, Session session, @PathParam("userEmail") String userEmail, @PathParam("followee") String followee) throws IOException {
        String chatRoomId = createChatRoomId(userEmail, followee);
        
        ChattingInfo newMessage = new ChattingInfo(userEmail, message, chatRoomId, "N");

        // 메시지를 DB에 저장 (기본적으로 읽지 않은 상태로 저장)
        dao.insertMessage(newMessage);  // N = 안 읽음

        // followee(상대방)에게 메시지 전송
        boolean sentToFollowee = false;
        Set<Session> roomSessions = chatRooms.get(chatRoomId);
        if (roomSessions != null) {
            for (Session s : roomSessions) {
                // followee의 세션을 찾아서 메시지 전송
                if (s.isOpen() && getUserEmailFromSession(s).equals(followee)) {
                    s.getBasicRemote().sendText(userEmail + ": " + message);
                    sentToFollowee = true;
                }
            }
        }
    }
		
	private String getUserEmailFromSession(Session session) {
	    // 세션에서 사용자 이메일을 추출하는 로직을 작성 (예: Session에서 파라미터나 속성을 가져옴)
	    // 이 예시에서는 세션의 userEmail 정보를 반환
	    return (String) session.getUserProperties().get("userEmail");
	}

}
