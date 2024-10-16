package com.smhrd.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ChartGenre {
	    private int cnt;
	    private String mv_genre;
	    
		public ChartGenre(String name, int cnt) {
			super();
			this.mv_genre = name;
			this.cnt = cnt;
		}

}
