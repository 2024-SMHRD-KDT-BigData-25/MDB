package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ReviewDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	
	// 4-1. 나의 리뷰 리스트 조회 (review, movie join)
	public List<ReviewJoinMovie> getUserReviewList(String user_email) {
		  SqlSession sqlSession = sqlSessionFactory.openSession(true);
		  List<ReviewJoinMovie> res = sqlSession.selectList("ReviewMapper.userReviewList",user_email);
		  sqlSession.close(); // session의 자원 반환
		  return res;
	}
	
}
