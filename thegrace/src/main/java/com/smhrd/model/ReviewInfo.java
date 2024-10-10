package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ReviewInfo {
	
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
    
    public ReviewInfo(String mv_cd, String user_email, int mv_rating, String review_content, Date view_dt, String open_yn, String review_img, String pos_neg) {
		super();
		this.mv_cd = mv_cd;
		this.user_email = user_email;
		this.mv_rating = mv_rating;
		this.review_content = review_content;
		this.view_dt = view_dt;
		this.open_yn = open_yn;
		this.review_img = review_img;
		this.pos_neg = pos_neg;
		}
    
    public ReviewInfo(int review_cd, String user_email) {
		super();
		this.review_cd = review_cd;
		this.user_email = user_email;
		}
    
}
