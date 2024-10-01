package com.smhrd.database;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// SqlSession 관리
public class SqlSessionManager {
	// SqlSession : DB 연결, sql문 실행, DB관련 (한 가지) 작업을 수행해주는 객체
	// SqlSession을 생성해주는 공장
	public static SqlSessionFactory sqlSessionFactory;
	
	// mybatis - config.xml (설정)에 작성되어있는 값을 가지고 factory를 생성
	// -> 클래스가 로딩되면 딱 한 번만 실행하고 더이상 실행하지 않음
	
	static {
		String resource = "com/smhrd/database/mybatis-config.xml";
		// Reader라는 도구를 사용해서 정보를 읽어와서 factory 생성
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 생성된 SqlSessionFactory 반환 메서드 
	public static SqlSessionFactory getSqlSessionFactory() {
		return sqlSessionFactory;
	}
	
}
