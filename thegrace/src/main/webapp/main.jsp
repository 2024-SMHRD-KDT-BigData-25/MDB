<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.MovieInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.smhrd.model.MovieDAO" %>
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
    padding: 15px;
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
	color: #000000; /* 검정색 */
    width: 100%;
    margin-bottom: 20px;
    font-size: 24px;
    font-weight: bold;
}

h5 {
    color: #000000; /* 검정색 */
    font-weight: bold; /* 굵은 폰트 */
    font-size: 24px; /* 글씨 크기 설정 (필요시 변경 가능) */
}

태그 글씨 설정 css


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
                <form action="vote" id="voteForm" method="post">
        		<!-- MyBatis에서 가져온 영화 목록 출력 -->
        			 
        			<c:if test="${not empty movieTitles}">
					    <c:forEach var="title" items="${movieTitles }">
					        <label>
					            <input type="radio" name="movie" value="${title}"> ${title}
					        </label><br>
					    </c:forEach>
					</c:if>
					<c:if test="${empty movieTitles}">
					    <p>영화 목록이 없습니다.</p>
					</c:if>
			        <br>
			        <button type="button" onclick="submitVote()">투표하기</button>
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
                  <h5>너의 이름은</h5>
                  <p>나는 침대에서 아팠을 때 이 영화를 본 기억이 !</p>
                   <img src="resources/images/너의이름은.jpg"  alt="Movie Poster" style="width:100px;">
                </div>
                
                
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face2.jpg" alt="Profile Image">
                    <span class="review-title">보노보노</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>인터스텔라</h5>
                  <p>SF를 향한 놀런의 웅대한 꿈. 그 한 가운데 자리한 가족영화의 간절한 순간 </p>
                   <img src="resources/images/인터스텔라.jpg" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face3.jpg" alt="Profile Image">
                    <span class="review-title">천상지희</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>인셉션</h5>
                  <p> 크리스토퍼 놀란이 감독한 이 작품은 마음을 사로잡는 스토리텔링, 뛰어난 연기</p>
                <img src="resources/images/인셉션.jpg" alt="Movie Poster" style="width:100px;">
                </div>
              </div>
 <div class="reviews-section">
                <h4>000님이 최근 본 영화들, 다른 사람들은 어떻게 봤을까요?</h4>
          		 <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face4.jpg" alt="Profile Image">
                    <span class="review-title">포로리</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>아이덴티티</h5>
                  <p>10년이 넘게(아마 15년)만에 이 영화를 다시 봤습니다</p>
                    <img src="resources/images/아이덴티티.jpg"  alt="Movie Poster" style="width:100px;">
                </div>
              <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face5.jpg" alt="Profile Image">
                    <span class="review-title">너구리</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>대도시의사랑법</h5>
                  <p> 청춘의 성장기에 집중해 누구나 부담 없이, 공감하며 볼 수 있다</p>
                  <img src="resources/images/대도시의 사랑법.jpg" alt="Movie Poster" style="width:100px;">
                </div>
              < <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face6.jpg" alt="Profile Image">
                    <span class="review-title">모기</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>더플랫폼</h5>
                  <p>고렝의 나이든 동반자는 복역하는 동안 감금되어야 하는 유일한 규정을 신속하게 설명합니다.</p>
                  <img src="resources/images/더플랫폼.jpg" alt="Movie Poster" style="width:100px;">
                </div>
              


        
            	<br>
                <h4>최근 인기있는 리뷰를 확인해보세요!</h4>
          		 <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face7.jpg" alt="Profile Image">
                    <span class="review-title">푸바오</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>청년경찰</h5>
                  <p>이 영화를 보고 경찰의 꿈을 가지게되었습니다</p>
                    <img src="resources/images/청년경찰.jpg"  alt="Movie Poster" style="width:100px;">
                </div>
              <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face4.jpg" alt="Profile Image">
                    <span class="review-title">러바오</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>7번방의 선물</h5>
                  <p> 7번방의 기적은 의심할 여지 없이 내가 본 최고의 영화</p>
                  <img src="resources/images/7번방의선물.jpg" alt="Movie Poster" style="width:100px;">
                </div>
              < <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/faces/face1.jpg" alt="Profile Image">
                    <span class="review-title">아이바오</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>파묘</h5>
                  <p>겁이 나기보다는 긴장감을 조성하기 위해 으스스한 분위기와 지식을 활용하는 다소 만족스러운 공포 영화</p>
                  <img src="resources/images/파묘.jpg" alt="Movie Poster" style="width:100px;">
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
    <script>
    let myChart;

    // 페이지 로드 시 빈 차트 초기화
    function initializeChart() {
        const ctx = document.getElementById('myChart').getContext('2d');
        myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['영화 1', '영화 2', '영화 3', '영화 4', '영화 5'], // 영화 제목
                datasets: [{
                    label: '투표 수',
                    data: [0, 0, 0, 0, 0], // 초기에는 0으로 설정
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    // 차트 데이터 업데이트
    function updateChart(data) {
        const results = data.results;
        myChart.data.datasets[0].data = [
            results[1],
            results[2],
            results[3],
            results[4],
            results[5]
        ];
        myChart.update();
    }

    function submitVote() {
        const selectedMovie = document.querySelector('input[name="movie"]:checked');
        if (!selectedMovie) {
            alert("영화를 선택하세요!");
            return;
        }

        const movieId = selectedMovie.value;

        fetch('/vote', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `movieId=${movieId}`
        })
        .then(response => response.json())
        .then(data => {
            updateResults(data);
            updateChart(data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }

    // 페이지 로드 시 초기 결과 불러오기
    window.onload = function() {
        initializeChart(); // 차트 초기화
        fetch('/results')
            .then(response => response.json())
            .then(data => {
                updateResults(data);
                updateChart(data); // 불러온 결과로 차트 업데이트
            });
    };	
    
    
    
    
    </script>       
</body>
</html>