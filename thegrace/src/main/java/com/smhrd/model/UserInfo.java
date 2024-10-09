package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
@AllArgsConstructor
public class UserInfo {

    // 아이디(이메일) 
    private String user_email;

    // 비밀번호 
    private String user_pw;

    // 닉네임 
    private String nick;

    // 인생영화 
    private String best_mv;

    // 긍정 색상 
    private String pos_color;

    // 부정 색상 
    private String neg_color;

    // 프로필 사진 
    private String pf_img;
    
    // 가입출처 
    private String join_source;
    
    // 가입출처 
    private String best_rev;
    
    // 가입 일자 
    private Date join_date;

	public UserInfo(String user_email, String user_pw) {
		super();
		this.user_email = user_email;
		this.user_pw = user_pw;
	}

	public UserInfo(String user_email, String user_pw, String nick, Date join_date, String join_source) {
		super();
		this.user_email = user_email;
		this.user_pw = user_pw;
		this.nick = nick;
		this.join_date = join_date;
		this.join_source = join_source;
	}
	// 네이버 로그인 회원을 위한 VO
	public UserInfo(String user_email, String nick, String pf_img) {
		super();
		this.user_email = user_email;
		this.nick = nick;
		this.pf_img = pf_img;
	}
	
    
}
