package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Date;

@Setter
@NoArgsConstructor
@Getter
@AllArgsConstructor
public class MavenMember {

    private String id;
    private String pw;
    private String nickname;
    private String job; // 직업 속성
    private int age; // 나이 속성 추가
    private Date joinDate; // 가입일 속성 추가
    private int recommendCount; // 추천 수 속성 추가

    // 두 개의 매개변수를 받는 생성자
    public MavenMember(String id, String pw) {
        this.id = id;
        this.pw = pw;
    }

    // 세 개의 매개변수를 받는 생성자 추가
    public MavenMember(String id, String pw, String nickname) {
        this.id = id;
        this.pw = pw;
        this.nickname = nickname;
    }
}
