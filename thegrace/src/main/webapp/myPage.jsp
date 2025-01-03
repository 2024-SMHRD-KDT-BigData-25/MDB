<%@page import="com.smhrd.model.ReviewJoinMovie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINEM@GRAFO</title>
<style>
.edit-button {
	margin-bottom: 100px;
    margin-left: auto; /* 오른쪽으로 정렬 */
    background-color: #007BFF; /* 버튼 색상 */
    color: white; /* 텍스트 색상 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 모서리 둥글게 */
    padding: 10px; /* 패딩 */
    cursor: pointer; /* 커서 모양 변경 */
    transition: background-color 0.3s; /* 부드러운 전환 */
}

.edit-button:hover {
    background-color: #0056b3; /* 호버 시 색상 변경 */
}

.card .card-body {
	height:300px;
}

.inCardText {
	height:80%;
	
}

.profile-message-container{
	width:80%;
}

.card {
            overflow-y: auto;
}

</style>
</head>


<body>

  <div class="container-scroller">
    
  	<!-- 상단바 불러오기 -->
    	<%@ include file="navbar.jsp" %>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    
      	<%@ include file="sidebar.jsp" %>
      
      <% 
      
      List<ReviewJoinMovie> myReview = dao.getUserReviewList(user_email);
      int reviewCnt = myReview.size();
      int movieTime = dao.myMovieTime(user_email);
      %>
      <!-- partial -->
      <div class="main-panel" >
        <div class="content-wrapper" style="padding:80px;">
        <div class="row">
            <div class="col-sm-12 mb-4 mb-xl-0">
              <h4 class="font-weight-bold text-dark">Hi, welcome back!</h4>
            </div>
          </div>
          <div class="row mt-3">
            <div class="col-xl-3 flex-column d-flex grid-margin stretch-card">
              <div class="row flex-grow">
                <div class="col-sm-12 grid-margin stretch-card">
                    <div class="card">
                      <div class="card-body">
                      	<div class="inCardText">
                          	<h1 class="card-title">인생의 얼마만큼 영화를 봤나요?</h1>
                          	<h3><p><%=member.getNick() %>님은 GRAFO의 회원 중<br> 상위 12%에요</p></h3>
                          	<h4 class="text-dark font-weight-bold mb-2"><%=movieTime %> 분</h4>
				         </div>
				         <div class="movie-graph-container">
				            <div class="bar" style="height: 70%;"><span>70%</span></div> <!-- 예시 값 -->
				            <div class="bar" style="height: 50%;"><span>50%</span></div> <!-- 예시 값 -->
				            <div class="bar" style="height: 30%;"><span>30%</span></div> <!-- 예시 값 -->
				        </div>
                      </div>
                    </div>
                </div>
                <div class="col-sm-12 stretch-card">
                    <div class="card">
                      <div class="card-body">
                      	<div class="inCardText">
                          <h4 class="card-title">얼마만큼의 감상을 표현했나요?</h4>
                          <p><%=member.getNick() %> 님은 GRAFO 회원 중<br>상위 31% 에요!</p>
                          <h4 class="text-dark font-weight-bold mb-2"><%=reviewCnt %> 개</h4>
						</div>
                          <div class="movie-graph-container2">
				            <div class="bar2" style="height: 70%;"><span>70%</span></div> <!-- 예시 값 -->
				            <div class="bar2" style="height: 50%;"><span>50%</span></div> <!-- 예시 값 -->
				            <div class="bar2" style="height: 30%;"><span>30%</span></div> <!-- 예시 값 -->
				        </div>
                      </div>
                    </div>
               </div>
              </div>
            </div>
            <div class="col-xl-9 d-flex grid-margin stretch-card">
                <div class="card">
			       <div class="card-body">
			         <title>프로필</title>
			         <div class="profile-header">
			            <div class="profile-img">
			             <img src="resources/image/<%=member.getPf_img() %>" alt="프로필 이미지"> <!-- 이미지 경로 설정 -->
			            </div>
			            <div class="profile-info">
			                <h4><%=member.getNick() %></h4>
			                <p><%=user_email %></p>
			                <p>가입일: <%=member.getJoin_date() %></p>
			             </div>
			    		<button class="edit-button">수정</button>
					</div>
			        </div>
			        <div class="profile-stats">
			            <div class="stat">
			                <h6>팔로잉</h4>
			                <a href="following.jsp"><p><%=dao.followerCnt(user_email)%></p></a>
			            </div>
			            <div class="stat">
			                <h6>팔로워</h6>
			                <a href="follower.jsp"><p><%=dao.followeeCnt(user_email) %></p></a>
			            </div>
			            <div class="stat">
			                <h6>받은 추천 수</h6>
			                <p><%=dao.allReviewRecmCnt(user_email) %></p>
			            </div>
			        </div>
                  </div>
                </div>
            </div>

          <div class="row">
            <div class="col-xl-9 grid-margin-lg-0 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                	<h1 class="card-title text-center">회원님의 최애 장르는?</h1>
                    <canvas id="myChart" width="100" height="10"></canvas>
                </div>
              </div>
            </div>
            <div class="col-xl-3 grid-margin-lg-0 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <div class="d-flex">
                      <div>
                          <h4 class="text-dark font-weight-bold mb-2 mr-2">4.3</h4>
                      </div>
                    </div>
                    <p class="mb-4">Based on <%=reviewCnt%> reviews</p>
                    <div class="row">
                      <div class="col-sm-2 pr-0">
                          <div class="d-flex">
                            <div>
                                <div class="text-dark font-weight-bold mb-2 mr-2">5</div>
                            </div>
                            <div>
                              <i class="fa fa-star text-warning"></i>
                            </div>
                          </div>
                      </div>
                      <div class="col-sm-9 pl-2">
                          <div class="row">
                            <div class="col-sm-10">
                              <div class="progress progress-lg mt-1">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 80%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                            <div class="col-sm-2 p-lg-0">
                              80%
                            </div>
                          </div>
                      </div>
                    </div>
                    <div class="row mt-2">
                      <div class="col-sm-2 pr-0">
                          <div class="d-flex">
                            <div>
                                <div class="text-dark font-weight-bold mb-2 mr-2">4</div>
                            </div>
                            <div>
                              <i class="fa fa-star text-warning"></i>
                            </div>
                          </div>
                      </div>
                      <div class="col-sm-9 pl-2">
                          <div class="row">
                            <div class="col-sm-10">
                              <div class="progress progress-lg mt-1">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 45%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                            <div class="col-sm-2 p-lg-0">
                              45%
                            </div>
                          </div>
                      </div>
                    </div>
                    <div class="row mt-2">
                      <div class="col-sm-2 pr-0">
                          <div class="d-flex">
                            <div>
                                <div class="text-dark font-weight-bold mb-2 mr-2">3</div>
                            </div>
                            <div>
                              <i class="fa fa-star text-warning"></i>
                            </div>
                          </div>
                      </div>
                      <div class="col-sm-9 pl-2">
                          <div class="row">
                            <div class="col-sm-10">
                              <div class="progress progress-lg mt-1">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 30%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                            <div class="col-sm-2 p-lg-0">
                              30%
                            </div>
                          </div>
                      </div>
                    </div>
                    <div class="row mt-2">
                      <div class="col-sm-2 pr-0">
                          <div class="d-flex">
                            <div>
                                <div class="text-dark font-weight-bold mb-2 mr-2">2</div>
                            </div>
                            <div>
                              <i class="fa fa-star text-warning"></i>
                            </div>
                          </div>
                      </div>
                      <div class="col-sm-9 pl-2">
                          <div class="row">
                            <div class="col-sm-10">
                              <div class="progress progress-lg mt-1">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 8%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                            <div class="col-sm-2 p-lg-0">
                              8%
                            </div>
                          </div>
                      </div>
                    </div>
                    <div class="row mt-2">
                      <div class="col-sm-2 pr-0">
                          <div class="d-flex">
                            <div>
                                <div class="text-dark font-weight-bold mb-2 mr-2">5</div>
                            </div>
                            <div>
                              <i class="fa fa-star text-warning"></i>
                            </div>
                          </div>
                      </div>
                      <div class="col-sm-9 pl-2">
                          <div class="row">
                            <div class="col-sm-10">
                              <div class="progress progress-lg mt-1">
                                <div class="progress-bar bg-warning" role="progressbar" style="width: 1%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                              </div>
                            </div>
                            <div class="col-sm-2 p-lg-0">
                              1%
                            </div>
                          </div>
                      </div>
                    </div>

                </div>
              </div>
            </div>
          </div>
        </div>
       </div>
      </div>
      </div>
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
      <script>
      function fetchGenreReviewData() {
    	    fetch('/thegrace/chart')
    	        .then(response => response.json())
    	        .then(data => {
    	            // 응답 데이터가 배열인지 확인하고, 길이가 있는지 확인
    	            if (Array.isArray(data) && data.length > 0) {
    	                const labels = data.map(item => item.genre);
    	                const reviewCounts = data.map(item => item.reviewCount);

    	                const ctx = document.getElementById('myChart').getContext('2d');
    	                new Chart(ctx, {
    	                    type: 'pie',
    	                    data: {
    	                        labels: labels,
    	                        datasets: [{
    	                            label: '리뷰 수',
    	                            data: reviewCounts,
    	                            backgroundColor: [
    	                                'rgba(54, 162, 235, 0.2)',
    	                                'rgba(255, 99, 132, 0.2)',
    	                                'rgba(75, 192, 192, 0.2)',
    	                                'rgba(153, 102, 255, 0.2)',
    	                                'rgba(255, 159, 64, 0.2)'
    	                            ],
    	                            borderColor: [
    	                                'rgba(54, 162, 235, 1)',
    	                                'rgba(255, 99, 132, 1)',
    	                                'rgba(75, 192, 192, 1)',
    	                                'rgba(153, 102, 255, 1)',
    	                                'rgba(255, 159, 64, 1)'
    	                            ],
    	                            borderWidth: 1
    	                        }]
    	                    },
    	                    options: {
    	                    	responsive: true,
    	                        maintainAspectRatio: false,

    	                        scales: {
    	                            y: {
    	                                beginAtZero: true
    	                            }
    	                        }
    	                    }
    	                });
    	            } else {
    	                console.error('Received empty or invalid data from the server');
    	            }
    	        })
    	        .catch(error => console.error('Error fetching data:', error));
    	}

    	// 페이지 로드 시 데이터 가져오기
    	window.onload = fetchGenreReviewData;
      </script>  
</body>
</html>