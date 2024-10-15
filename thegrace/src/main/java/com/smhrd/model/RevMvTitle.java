package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor

public class RevMvTitle {

    // 리뷰 코드 
    private int review_cd;

    // 영화 코드 
    private String mv_cd;

    // 아이디(이메일) 
    private String user_email;

    // 영화 평점 
    private int mv_rating;

    // 리뷰 내용 
    private String review_content;

    // 관람 일자 
    private Date view_dt;

    // 공개 여부 
    private String open_yn;

    // 리뷰 사진 
    private String review_img;

    // 긍정 부정 
    private String pos_neg;
    
	private String mv_title;
	
	private String mv_poster;
	
}
