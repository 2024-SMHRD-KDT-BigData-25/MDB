package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MovieDAO {

	// 어떤 기능을 위한 method인지 주석 필히 작성
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// UserInfo 메서드 모음
	// 1. 로그인(select) 기능(메서드)
	public UserInfo login(UserInfo m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 반환값 T ? => 임의읙 객체로 반환값을 나중에 우리가 지정한 형태로 받을 수 있음
		UserInfo res = sqlSession.selectOne("MovieMapper.login", m);
		sqlSession.close();
		return res;
	}
	
	// 2. 회원가입 기능
	public int join(UserInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MovieMapper.join", m);
		sqlSession.close(); // session의 자원 반환
		return res;
		
	}
	// 네이버 회원가입 기능
	public int naverJoin(UserInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MovieMapper.naverJoin", m);
		sqlSession.close(); // session의 자원 반환
		return res;
	}
	
	// 네이버 로그인 기능
	public UserInfo naverLogin(UserInfo m) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		UserInfo res = sqlSession.selectOne("MovieMapper.naverLogin", m);
		sqlSession.close(); // session의 자원 반환
		return res;
	}
	
	
	// 4. 아이디 중복 확인 기능
	public boolean checkEmail(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		// 반환값 T ? => 임의읙 객체로 반환값을 나중에 우리가 지정한 형태로 받을 수 있음
		UserInfo res = sqlSession.selectOne("MovieMapper.checkEmail", user_email);
		System.out.println(res);
		sqlSession.close();
		if( res==null ) {
			return true;
		} else {
			return false;
		}
	}
	
	// 5. 팔로우 테스트용 user정보 가져오기
	public List<UserInfo> getUserList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<UserInfo> res = sqlSession.selectList("MovieMapper.getUserList");
		sqlSession.close();
		return res;
	}
	
	// 팔로우(follow) 기능 메서드들 
	
	// 1. follow
	public int follow(FollowingInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MovieMapper.follow", m);
		sqlSession.close(); // session의 자원 반환
		return res;
	}
	
	// 2. unfollow
	public int unfollow(FollowingInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.delete("MovieMapper.unfollow", m);
		sqlSession.close(); // session의 자원 반환
		return res;
	}
	
	// 3. follower 리스트 가져오기
	public List<FollowingInfo> getFollower(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<FollowingInfo> res = sqlSession.selectList("MovieMapper.getFollower", user_email);
		sqlSession.close();
		return res;
	}
	
	// 4. followee 리스트 가져오기
	public List<FollowingInfo> getFollowee(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<FollowingInfo> res = sqlSession.selectList("MovieMapper.getFollowee", user_email);
		sqlSession.close();
		return res;
	}
	// 5. follower 수 가져오기 (return string)
	public String followerCnt(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String res = sqlSession.selectOne("MovieMapper.followerCnt", user_email);
		sqlSession.close();
		return res;
	}
	// 6. followee 수 가져오기 (return string)
	public String followeeCnt(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		String res = sqlSession.selectOne("MovieMapper.followeeCnt", user_email);
		sqlSession.close();
		return res;
	}
	
	// 7. 맞팔로우 확인하기 (맞팔이 영어로 Follow for Follow -> F4F)
	public boolean F4F(FollowingInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		FollowingInfo res = sqlSession.selectOne("MovieMapper.F4F", m);
		sqlSession.close(); // session의 자원 반환
		if ( res != null ) {
			return true;
		} else {
			return false;
		} 
	}
	
	public int allReviewRecmCnt(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		List<ReviewInfo> reviewList = sqlSession.selectList("MovieMapper.reviewList", user_email);
		int res = 0;
		for ( ReviewInfo m : reviewList ) {
			int review_cd = m.getReview_cd();
			int reviewCnt = Integer.parseInt(sqlSession.selectOne("MovieMapper.reviewRecmCnt", review_cd));
			res += reviewCnt;
		}
		sqlSession.close();
		return res;
		
	}
	
	// 리뷰입력하기
	public int reviewWrite(ReviewInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MovieMapper.reviewWrite", m);
		sqlSession.close(); // session의 자원 반환
		return res;
		   }

}
