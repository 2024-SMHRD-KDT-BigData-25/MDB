package com.smhrd.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

// 이 서버로 연결하기 위한 주소 설정
@ServerEndpoint("/chat3")
public class ChatServer {
	
	// 여러개의 객체(데이터)를 한번에 저장할 수 있는 자료구조
	// List(ArrayList) : 연속된 공간(메모리)에 데이터를 저장하는 구조 (인덱스)
	// Map(HashMap) : key-value / key => 해시함수 => value
	// Set(HashSet) : value
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	
	// open : 새로운 클라이언트가 연결시도
	@OnOpen	
	public void onOpen(Session session) {	
		// 클라이언트들의 정보를 모아둔 자료구조(*)에 새롭게 접속한 클라이언트의 정보를 추가로 저장
		clients.add(session);
		System.out.println("Client connected");
		System.out.println("open");
		// 현재 접속한 클라이언트들에게 새로운 클라이언트가 접속했다고 메세지 보내기!
		for(Session client : clients) {
			// remoteEndPoint 리턴
			// try ~ catch 문으로 예외처리 해주기!
			// sendText : server -> client 메세지 보낼 때 사용
			try {
				client.getBasicRemote().sendText("유저 접속");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	

	// close : 연결해제
	@OnClose // 특정 클라이언트만 연결 해제
	public void onClose(Session session) {
		
		clients.remove(session);
		
		// 현재 접속한 클라이언트들에게 기존의 클라이언트가 나갔다고 메세지 보내기
		for(Session client : clients) {
			// remoteEndPoint 리턴
			// try ~ catch 문으로 예외처리 해주기!
			// sendText : server -> client 메세지 보낼 때 사용
			try {
				client.getBasicRemote().sendText("다른 클라이언트 접속 해제");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	// message : 메세지를 받았을 때 (클라이언트가 채팅 작성했을 때)
	@OnMessage
	public void onMessage(String message, Session session) {
		// message : 클라이언트가 보낸 메세지
		// session : 메세지를 보낸 클라이언트 정보
		
		
		// 메세지를 보낸 클라이언트는 제외하고 다른 클라이언트가 보낸 메세지만 보내기
		// 현재 접속한 클라이언트들에게 기존의 클라이언트가 나갔다고 메세지 보내기
		for(Session client : clients) {
			if(session != client) {
			try {
				System.out.println("Sending message to client: " + message); // 서버에서 메시지를 보내는지 확인
				client.getBasicRemote().sendText(message);
			} catch (IOException e) {
			
				e.printStackTrace();
			}
		}
	}		
}
}

