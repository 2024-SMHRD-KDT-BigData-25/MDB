package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ChattingInfo {
	
	int chat_cd;
	String chatter;
	String chatting;
	String created_at;
	String croom_cd;
	String chat_read;
	
	public ChattingInfo(String chatter, String chatting, String croom_cd, String chat_read) {
		super();
		this.chat_cd = chat_cd;
		this.chatter = chatter;
		this.chatting = chatting;
		this.croom_cd = croom_cd;
		this.chat_read = chat_read;
	}
	
	

}
