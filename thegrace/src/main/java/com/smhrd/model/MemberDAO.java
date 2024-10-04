package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	

	public int join(MavenMember m) {
	
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MemberMapper.insert", m);
		sqlSession.close(); 
		return res;
	}
	
	
	public MavenMember login(MavenMember m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
		MavenMember res = sqlSession.selectOne("MemberMapper.login", m);
		sqlSession.close();
		return res;
	}
}
