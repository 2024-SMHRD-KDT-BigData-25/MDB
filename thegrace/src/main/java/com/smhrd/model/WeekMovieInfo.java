package com.smhrd.model;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
public class WeekMovieInfo {
	
	private String week_cd;
	private String week_cnt;
	private String week_theme;
	private String mv_cd1;
	private String mv_cd2;
	private String mv_cd3;
	private String mv_cd4;
	private String mv_cd5;
	private String st_dt;
	private String ed_dt;
	
	public WeekMovieInfo(String mv_cd1, String mv_cd2, String mv_cd3, String mv_cd4, String mv_cd5) {
		super();
		this.mv_cd1 = mv_cd1;
		this.mv_cd2 = mv_cd2;
		this.mv_cd3 = mv_cd3;
		this.mv_cd4 = mv_cd4;
		this.mv_cd5 = mv_cd5;
	}
	
}
