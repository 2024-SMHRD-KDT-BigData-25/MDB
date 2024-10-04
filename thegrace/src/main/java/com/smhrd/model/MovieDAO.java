package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MovieDAO {

	// 어떤 기능을 위한 method인지 주석 필히 작성
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 로그인(select) 기능(메서드)
	public UserInfo login(UserInfo m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 반환값 T ? => 임의읙 객체로 반환값을 나중에 우리가 지정한 형태로 받을 수 있음
		UserInfo res = sqlSession.selectOne("MemberMapper.login", m);
		sqlSession.close();
		return res;
	}

}
