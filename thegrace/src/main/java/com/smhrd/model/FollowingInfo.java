package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class FollowingInfo {

	   // 팔로우 코드 
    private Double follow_cd;

    // 팔로워 
    private String follower;

    // 팔로위 
    private String followee;

    // 팔로우 날짜 
    private Date follow_date;

	public FollowingInfo(String follower, String followee, Date follow_date) {
		super();
		this.follower = follower;
		this.followee = followee;
		this.follow_date = follow_date;
	}

	public FollowingInfo(String follower, String followee) {
		super();
		this.follower = follower;
		this.followee = followee;
	}
    
}
