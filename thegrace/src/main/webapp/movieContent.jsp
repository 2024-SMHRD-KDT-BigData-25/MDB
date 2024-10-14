<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.smhrd.model.RevMvTitle"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.ReviewInfo"%>
<%@page import="com.smhrd.model.UserInfo"%>
<%@page import="com.smhrd.model.MovieInfo"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CINEM@GRAFO</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <style>
  
  .content img {
    width: 500px; /* 원하는 크기로 조정 */
    margin-right: 20px;
    border-radius: 5px;
}
  
  .content {
    display: flex;
    margin-top: 30px;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    margin-bottom: 40px;
}
  
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 70%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 110px;
        }
        .header {
            background-color: #ddd;
            padding: 10px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
        }
        .movie-info {
            margin: 20px 0;
            background-color: #e7e7e7;
            padding: 20px;
        }
        .movie-info h2 {
            font-size: 28px;
            margin-bottom: 10px;
        }
        .movie-info p {
            margin: 5px 0;
        }
        .plot-summary {
            background-color: #d0d0d0;
            padding: 20px;
            margin-top: 20px;
        }
        .plot-summary h3 {
            margin-top: 0;
        }
    .review-card {	
      border: 1px solid #ddd;
      border-radius: 5px;
      padding: 10px;
      margin: 10px 0;
      background-color: #f9f9f9;
      margin-left:50px;
      margin-right:50px;
    }
    .review-header {
      display: flex;
      align-items: center;
      margin-bottom: 5px;
    }
    .review-header img {
      border-radius: 50%;
      width: 40px;
      height: 40px;
      margin-right: 10px;
    }
    .review-title {
      font-weight: bold;
    }
.reviews-section {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between; /* 왼쪽 정렬 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    padding: 0 50px;
    margin-bottom: 40px;
}

.review-card {
    margin: 10px;
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 8px;
    background-color: #ffffff;
    width: 280px;
}

.review-header {
    display: flex;
    align-items: center;
    justify-content: center;
}

.review-header img {
    border-radius: 50%;
    width: 50px;
    height: 50px;
    margin-right: 10px;
}

.review-title {
    font-weight: bold;
    font-size: 13px;
}

.buttons {
    margin-left: auto;
    margin-right: 20px;
}

h4 {
    width: 100%;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

h5 {
    font-weight: bold;
    font-size: 16px;
    margin: 10px 0;
}

p {
    font-size: 10px;
    color: #555;
}

.movie-poster {
    width: 90px;
    margin-top: 10px;
}

      
    
  </style>
  
</head>
<body>

     <% 
     // 영화 내용 불러오기
     String mv_cd = request.getParameter("mv_cd"); 
     MovieDAO dao = new MovieDAO();
     MovieInfo mvInfo = dao.mvInfo(mv_cd);
     
     // 로그인 유저 정보 -> 네이버 로그인 시 nick, Pf_img, email 정보만 담고 있음
     UserInfo member = (UserInfo)session.getAttribute("member");
     String user_email = member.getUser_email();
     
     // 위 영화에 대한 유저의 리뷰 정보 가져오기 
     // 리뷰 + 영화 타이틀 + 영화 포스터 = userReview
     List<RevMvTitle> userReviewList = dao.followeeReviewList(user_email);
     RevMvTitle userReview = null;  // 조건에 맞는 리뷰를 담을 객체
     for (RevMvTitle m : userReviewList) {
         if ( m.getMv_cd().equals(mv_cd) ) {
        	 userReview = m;  // 영화 코드가 일치하면 해당 리뷰 정보를 담음
             break;  // 일치하는 리뷰를 찾으면 루프를 중단
         }
     }

     
     // 해당 영화에 대한 리뷰 조회 -> 매개변수 = mv_cd / 응답값 =  프로필 이미지, 닉네임, 영화 코드, 리뷰 내용, 리뷰 코드 
     // Iterator를 사용해 리스트에서 안전하게 삭제
     List<ReviewInfo> reviewListbyMv_cd = dao.reviewListbyMv_cd(mv_cd);

     Iterator<ReviewInfo> iterator = reviewListbyMv_cd.iterator();

     while ( iterator.hasNext() ) {
         ReviewInfo reviewbyMv_cd = iterator.next();
         if ( reviewbyMv_cd.getUser_email().equals(user_email) ) {
             iterator.remove();
         }
     }
     %>
     
<div class="container-scroller">
  <!-- 상단바 불러오기 -->
  <%@ include file="navbar.jsp" %>
    
  <div class="container-fluid page-body-wrapper">  
  <%@ include file="sidebar.jsp" %>
      
  	<!-- partial -->
     <div class="main-panel">

      <div class="content-wrapper" style="margin-left: 20px; margin-right: 40px; float right;"><!-- 여백 추가 -->
        <div class="strong">
            <p>장르 · 개봉년도 · 제작국가 · 상영시간</p>
              <h2><%=mvInfo.getMv_title() %></h2>
          <h4><%=mvInfo.getMv_title_eng() %></h4>
      
        

        <div class="content">
   		<img src="<%=mvInfo.getMv_poster() %>" alt="Additional Image" style="width: 250px; margin-right: 20px;"> <!-- 추가할 이미지 -->
        <div>
            <h3>줄거리</h3>
	        <% if( mvInfo.getMv_story() == null || "null".equals(mvInfo.getMv_story()) ) {%>
	        <p>
			줄거리가 없습니다.
			</p>
			<%} else { %>
			<p>
			<%=mvInfo.getMv_story() %>
			</p>
		<%} %>
          </div>
        </div>
          <div class="row">
            <div class="col-sm-12 mb-4 mb-xl-0">
      

    <!-- container-scroller -->

    <!-- base:js -->
    <script src="resources/vendors/base/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page-->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <!-- inject:js -->
    <script src="resources/js/off-canvas.js"></script>
    <script src="resources/js/hoverable-collapse.js"></script>
    <script src="resources/js/template.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <script src="resources/js/dashboard.js"></script>
    <!-- End custom js for this page-->

    <script>


    </script>
    
    <br>
   
    
        <!-- 영화 리뷰 섹션  -->
   <div class="reviews-section">

    <h4>이 영화를 본 내 감상</h4>
    
    <% if ( userReview == null ){%>
    <div class="review-card">

        <div class="review-header">
        	아직 작성된 리뷰가 없습니다. 
            <div class="buttons">
                <button class="btn">리뷰 작성하러 가기</button>
            </div>
        </div>
    </div>
    <% } else {%>
    <div class="review-card">
        <div class="review-header">
            <img src="<%=member.getPf_img() %>" alt="Profile Image">
            <span class="review-title"><%=member.getNick() %></span>
            <div class="buttons">
                <button class="btn">수정</button>
                <button class="btn follow">삭제</button>
            </div>
        </div>
        <p><%=userReview.getReview_content() %></p>
    </div>
    <% } %>
    </div>

<!-- 추가 리뷰 섹션 -->
<div class="reviews-section">
    <h4>리뷰(<%=reviewListbyMv_cd.size() %>)</h4>
    <% if ( reviewListbyMv_cd.size()>=1 ) { %>
		<%for ( ReviewInfo reviewbyMv_cd : reviewListbyMv_cd) { %>
			<div class="review-card">
			    <div class="review-header">
			        <img src="resources/images/faces/face1.jpg" alt="Profile Image">
			        <span class="review-title"><%=reviewbyMv_cd.getNick() %></span>
			        <div class="buttons">
			            <span style="color: black; cursor: pointer;" onclick="handleLike(<%=reviewbyMv_cd.getReview_cd()%>)">
			                <i class="fas fa-heart"></i>
			            </span>
			        </div>
			    </div>
			    <p><%=reviewbyMv_cd.getReview_content() %></p>
			</div>
		<% } %>
	<% } else if(reviewListbyMv_cd.size()==0) {%>
			<div class="review-card">
			<div class="review-header">
			    <span class="review-title"></span>
			    
			</div>
			<p>리뷰가 없습니다.</p>
			</div>
	<% } %>
	</div>
<script>
    function handleLike(mv_cd) {
        // 여기에서 좋아요 로직을 구현할 수 있습니다.
        alert("You liked this review!");
        // 예를 들어, 색상을 변경할 수도 있습니다.
        element.querySelector('i').style.color = 'red'; // 하트를 빨간색으로 변경
    }
</script>


</div>
</div>   

    </div>
</div>

</div>
</div>
</div>



</body>
</html>
        
         