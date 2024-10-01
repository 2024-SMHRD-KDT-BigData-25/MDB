package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 회원가입(insert) 기능(메서드)
	// 1. SplSession 객체 생성 <= SqlSessionFactory
	// 2. SqlSession 객체 활용 insert 작업 수행
	// 3. 결과 값 반환
	public int join(MavenMember m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MemberMapper.insert", m);
		sqlSession.close(); // session의 자원 반환
		return res;
	}
	
	// 로그인(select) 기능(메서드)
	public MavenMember login(MavenMember m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 반환값 T ? => 임의읙 객체로 반환값을 나중에 우리가 지정한 형태로 받을 수 있음
		MavenMember res = sqlSession.selectOne("MemberMapper.login", m);
		sqlSession.close();
		return res;
	}
}
