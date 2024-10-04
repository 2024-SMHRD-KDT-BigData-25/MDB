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
    
    // 인생영화 한줄평
    private String best_mvrev;

    // 긍정 색상 
    private String pos_color;

    // 부정 색상 
    private String neg_color;

    // 프로필 사진 
    private String pf_img;

    // 회원 포인트 
    private Double user_point;

    // 가입 일자 
    private Date join_date;

    // 가입출처 
    private String join_source;

}
