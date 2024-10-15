package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ChatroomInfo {

	String croom_cd;
	String create_user;
	String created_at;
	String invited_user;
	
	public ChatroomInfo(String croom_cd, String create_user, String invited_user) {
		super();
		this.croom_cd = croom_cd;
		this.create_user = create_user;
		this.invited_user = invited_user;
	}
	
}
