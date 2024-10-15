package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ReviewRecmInfo {
    private int recm_cd;

    // 영화 코드 
    private int review_cd;

    // 아이디(이메일) 
    private String user_email;
    
    private String recm_date;

    public ReviewRecmInfo(int review_cd, String user_email) {
 		super();
 		this.review_cd = review_cd;
 		this.user_email = user_email;
 		}
	
}
