package com.smhrd.model;

import java.util.Arrays;
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
	
	public UserInfo userLoad(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		UserInfo res = sqlSession.selectOne("MovieMapper.userLoad", user_email);
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
		int res = sqlSession.selectOne("MovieMapper.F4F", m);
		sqlSession.close(); // session의 자원 반환
		if ( res >0 ) {
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
	
	// 4-1. 나의 리뷰 리스트 조회 (review, movie join)
	public List<ReviewJoinMovie> getUserReviewList(String user_email) {
		  SqlSession sqlSession = sqlSessionFactory.openSession(true);
		  List<ReviewJoinMovie> res = sqlSession.selectList("ReviewMapper.userReviewList",user_email);
		  sqlSession.close(); // session의 자원 반환
		  return res;
	}
		
	// 5. 리뷰 정보 가져오기 (user_email 기준) -> review 정보 + movie의 title, poster
	public List<RevMvTitle> followeeReviewList(String followee) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<RevMvTitle> res = sqlSession.selectList("MovieMapper.followeeReviewList", followee);
		sqlSession.close();
		return res;
	}
	
	// 6. 리뷰 정보 가져오기 (mv_cd 기준) -> review 정보 + movie의 title, poster
	public List<ReviewInfo> reviewListbyMv_cd(String mv_cd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ReviewInfo> res = sqlSession.selectList("MovieMapper.reviewListbyMv_cd", mv_cd);
		sqlSession.close();
		return res;
	}
	
	// 7. 리뷰 정보 가져오기 (review_cd 기준) -> review 정보 + user_info의 nick
	public ReviewInfo reviewbyReview_cd(int review_cd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		ReviewInfo res = sqlSession.selectOne("MovieMapper.reviewbyReview_cd", review_cd);
		sqlSession.close();
		return res;
	}
	
	// 8. mv_rating 정보 가져오기
	public int[] starsCount(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int star5 = sqlSession.selectOne("MovieMapper.star5", user_email);
		int star4 = sqlSession.selectOne("MovieMapper.star4", user_email);
		int star3 = sqlSession.selectOne("MovieMapper.star3", user_email);
		int star2 = sqlSession.selectOne("MovieMapper.star2", user_email);
		int star1 = sqlSession.selectOne("MovieMapper.star1", user_email);
		
		int[] res = {star1,star2,star3,star4,star5};
		
		
		return res;
	}
	
	// 9. 총 play_time
		public int myMovieTime(String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.selectOne("MovieMapper.movieTime", user_email);

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
	
	// 2. 영화 정보 조회
	public MovieInfo mvInfo(String mv_cd) {
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
	
	public int chatRoom(ChatRoomInfo m) {
		// openSession(true) -> 오토커밋 기능 on
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MovieMapper.chatroom", m);
		sqlSession.close(); // session의 자원 반환
		return res;
		   }
	
	// 2. 투표 수 확인
	public List<Integer> getVoteCnt(int week_cd) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<Integer> voteCounts = null;
		try {
		    voteCounts = sqlSession.selectList("MovieMapper.getVoteCnt", week_cd);
		} finally {
		    sqlSession.close();
		}
		    return voteCounts;
		}
		
	// 투표 기록을 데이터베이스에 삽입하는 메서드
	public int insertUserVote(UserVoteInfo voteInfo) {
	    SqlSession session = sqlSessionFactory.openSession();
	    int result = 0;
	    try {
	        result = session.insert("insertUserVote", voteInfo); // 매퍼의 id인 insertUserVote 호출
	        session.commit();  // 데이터베이스에 반영
	    } finally {
	        session.close();  // 세션 종료
	    }
	    return result;  // 삽입된 행의 개수를 반환
	}
	
	// 추천기능
	
	public int deletelike(ReviewRecmInfo t) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.delete("MovieMapper.deletelike", t);
		sqlSession.close();
		return res;
	}
	
	public int insertlike(ReviewRecmInfo t) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		int res = sqlSession.insert("MovieMapper.insertlike", t);
		sqlSession.close();
		return res;
	}
	
	public int totallike(int review_cd) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		Integer res = sqlSession.selectOne("MovieMapper.totallike", review_cd);
		sqlSession.close();
		return (res != null) ? res : 0;
	}
	
	public int checklike(ReviewRecmInfo t) {
	    try (SqlSession sqlSession = sqlSessionFactory.openSession(true)) {
	        Integer res = sqlSession.selectOne("MovieMapper.checklike", t); // Integer로 받기
	        return (res != null) ? res : 0; // null 체크 후 반환
	    } // try 블록이 끝나면 자동으로 sqlSession이 닫힘
	}
	
	//시각화
	
	public List<ChartGenre> myGenreTop (String user_email) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		ChartGenre none = new ChartGenre("none", 0);
		ChartGenre genre1 = sqlSession.selectOne("MovieMapper.genre1", user_email);
			if (genre1 == null) {
				genre1 = none;
			}
		ChartGenre genre2 = sqlSession.selectOne("MovieMapper.genre2", user_email);
		if (genre2 == null) {
			genre2 = none;
		}
		ChartGenre genre3 = sqlSession.selectOne("MovieMapper.genre3", user_email);
		if (genre3 == null) {
			genre3 = none;
		}
		ChartGenre genre4 = sqlSession.selectOne("MovieMapper.genre4", user_email);
		if (genre4 == null) {
			genre4 = none;
		}
		ChartGenre genre5= sqlSession.selectOne("MovieMapper.genre5", user_email);
		if (genre5 == null) {
			genre5 = none;
		}
		
		
		List<ChartGenre> res =  Arrays.asList(genre1,genre2,genre3,genre4,genre5);
		
		return res;
	}

	

}
