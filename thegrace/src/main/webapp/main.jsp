<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>CINEM@GRAFO</title>
</head>
<body>

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
    justify-content: flex-start; /* 왼쪽 정렬 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    padding: 20px;
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
  <div class="container-scroller">
  	<!-- 상단바 불러오기 -->
    	<%@ include file="navbar.jsp" %>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    
      	<%@ include file="sidebar.jsp" %>
      
      <!-- partial -->
      <div class="main-panel" >
        <div class="content-wrapper" style="padding:80px;">
        	  <h2 style="text-align: center;">이번 주의 영화</h2> <!-- 제목 중앙 정렬 -->
              <div>
                <canvas id="myChart" width="200" height="50"></canvas> <!-- 차트크기수정 -->
              </div>
              <div>
                <p>투표 기간: #ST_DT ~ #ED_DT</p>
                <form id="voteForm">
                  <div>
                    <input type="radio" name="movie" value="#mv_cd1.mv_title"> 영화 1<br>
                    <input type="radio" name="movie" value="#mv_cd2.mv_title"> 영화 2<br>
                    <input type="radio" name="movie" value="#mv_cd3.mv_title"> 영화 3<br>
                    <input type="radio" name="movie" value="#mv_cd4.mv_title"> 영화 4<br>
                    <input type="radio" name="movie" value="#mv_cd5.mv_title"> 영화 5<br>
                  </div>
                  <br>
                  <button type="submit">투표하기</button>
                  <br>
                </form>
              </div>
              <br>
              <div class="chatgpt-activation" style="padding-left: 20px;">
  				<div style="background-color: #f0f0f0; padding: 10px; border-radius: 5px;">
    				<span style="color: green;">ChatGPT 활성화 (팝업 창에서 열기)</span>
  				</div>
			  </div>
			    
        <!-- 영화 리뷰 섹션  -->
              <br>
              <div class="reviews-section">
                <h4>팔로우 중인 사람들의 리뷰를 읽어보세요!</h4>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face1.jpg" alt="Profile Image">
                    <span class="review-title">뚱냥이</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face2.jpg" alt="Profile Image">
                    <span class="review-title">사용자 2</span>
                    <button class="btn">추천</button>
                    <button class="btn follow">Follow</button>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face3.jpg" alt="Profile Image">
                    <span class="review-title">사용자 3</span>
                    <button class="btn">추천</button>
                    <button class="btn follow">Follow</button>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
              </div>
 <div class="reviews-section">
                <h4>000님이 최근 본 영화들, 다른 사람들은 어떻게 봤을까요?</h4>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face1.jpg" alt="Profile Image">
                    <span class="review-title">뚱냥이</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face2.jpg" alt="Profile Image">
                    <span class="review-title">사용자 2</span>
                    <button class="btn">추천</button>
                    <button class="btn follow">Follow</button>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face3.jpg" alt="Profile Image">
                    <span class="review-title">사용자 3</span>
                    <button class="btn">추천</button>
                    <button class="btn follow">Follow</button>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
              </div>


              <!-- 세 번째 리뷰 섹션 -->
              <br>
              <div class="reviews-section">
                <h4>최근 인기있는 리뷰를 확인해보세요!</h4>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face1.jpg" alt="Profile Image">
                    <span class="review-title">뚱냥이</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face2.jpg" alt="Profile Image">
                    <span class="review-title">사용자 2</span>
                    <button class="btn">추천</button>
                    <button class="btn follow">Follow</button>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face3.jpg" alt="Profile Image">
                    <span class="review-title">사용자 3</span>
                    <button class="btn">추천</button>
                    <button class="btn follow">Follow</button>
                  </div>
                  <h5>#mv_title</h5>
                  <p>#review_content</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
              </div>

              
              <!-- 세 번째 리뷰 섹션 ends -->  
			</div>
			<!-- contents-wrapper ends -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
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
    <!-- 주간차트 js -->
 	<script src="resources/js/weekChart.js"></script>
              
</body>
</html>
        
    