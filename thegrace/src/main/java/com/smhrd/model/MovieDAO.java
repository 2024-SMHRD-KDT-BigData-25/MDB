package com.smhrd.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<FollowPf> getFollower(String followee) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<FollowPf> res = sqlSession.selectList("MovieMapper.getFollower", followee);
		sqlSession.close();
		return res;
	}
	
	// 4. followee 리스트 가져오기
	public List<FollowPf> getFollowee(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<FollowPf> res = sqlSession.selectList("MovieMapper.getFollowee", user_email);
		sqlSession.close();
		System.out.println(res);
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
	
	// 리뷰Review 관련 메서드
	// 1. 사용자가 작성한 모든 리뷰의 모든 추천 수 합친 값 가져오기
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
	
	// 2. 리뷰입력하기
	public int reviewWrite(ReviewInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MovieMapper.reviewWrite", m);
		sqlSession.close(); // session의 자원 반환
		return res;
		   }
	
	// 3. 리뷰 삭제하기
	public int reviewDelete(int review_cd) {
	      SqlSession sqlSession = sqlSessionFactory.openSession(true);
	      int res = sqlSession.delete("MovieMapper.reviewDelete", review_cd);
	      sqlSession.close(); // session의 자원 반환
	      return res;
	   }
	
	// 4. 리뷰 리스트 조회
	public List<ReviewInfo> getReview() {
		  SqlSession sqlSession = sqlSessionFactory.openSession(true);
		  List<ReviewInfo> res = sqlSession.selectList("MovieMapper.reviewList");
		  sqlSession.close(); // session의 자원 반환
		  return res;
	}
		
	// 5. 유저 이메일과 영화 코드로 리뷰 정보 불러오기
	public ReviewInfo userReviewInfo(String user_email, int mv_cd) { 
		Map<String, Object> paramMap = new HashMap<>();
	    paramMap.put("user_email", user_email);
	    paramMap.put("mv_cd", mv_cd);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ReviewInfo res = sqlSession.selectOne("MovieMapper.userReviewInfo", paramMap);
		sqlSession.close();
		return res;
	}

	// MovieInfo 관련 메서드
	// 1. 영화 검색하기
	public List<MovieInfo> movieSearching(String search_text) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<MovieInfo> res = sqlSession.selectList("MovieMapper.getSearchResult", search_text);
		sqlSession.close();
		return res;
	}

	// 영화정보 가져오기
		public List<MovieInfo> getMovieList() {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			List<MovieInfo> res = sqlSession.selectList("MovieMapper.getMovieList");
			sqlSession.close();
			return res;
		}
		
	// 리뷰의 영화제목 가져오기
		public List<RevMvTitle> followeeReviewList(String followee) {
			SqlSession sqlSession = sqlSessionFactory.openSession();
			List<RevMvTitle> res = sqlSession.selectList("MovieMapper.followeeReviewList", followee);
			sqlSession.close();
			return res;
		}

	
	// 2. 영화 정보 조회
	public MovieInfo mvInfo(int mv_cd) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MovieInfo res = sqlSession.selectOne("MovieMapper.mvInfo", mv_cd);
		sqlSession.close();
		return res;
	}
	
	 // 이 주의 영화 투표 기능
	
	 // 1. 영화 이름 가져오기
	public List<String> getWeekMovieTitles(int week_cd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<String> movieTitles = null;
		    try {
		       movieTitles = sqlSession.selectList("MovieMapper.getWeekMovieTitles", week_cd);
		    } finally {
		       sqlSession.close();
		    }
		    return movieTitles;
	}
}
