package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor

public class ChatRoomInfo {
	
	private int croom_cd;
	private String create_user;
	private Date created_at;
	private String invited_user;
}

