package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class UserVoteInfo {
	private int vote_cd;
	private int week_cd;
	private String mv_cd;
	private String vote_date;
	private String user_email;
	
	public UserVoteInfo(int vote_cd, int week_cd, String mv_cd, String vote_date) {
        this.vote_cd = vote_cd;
        this.week_cd = week_cd;
        this.mv_cd = mv_cd;
        this.vote_date = vote_date;
    }
	
	
	
}
