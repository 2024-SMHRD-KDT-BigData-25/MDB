package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class FollowPf {
	
	// 팔로우 코드 
	private int follow_cd;
	
	// 팔로우 받은 사람
    private String followee;
    
    // 팔로우 한 사람
    private String follower;
    
    // 닉네임 
    private String nick;
    
    // 프로필 사진 
    private String pf_img;

}
