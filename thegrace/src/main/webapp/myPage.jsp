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
</style>
</head>


<body>
  <div class="container-scroller">
    
  	<!-- 상단바 불러오기 -->
    	<%@ include file="navbar.jsp" %>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
    
      	<%@ include file="sidebar.jsp" %>
      
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
                          <h1 class="card-title">인생의 얼마만큼 영화를 봤나요?</h1>
                          <h3><p>그라포님은 GRAFO의 회원 중<br> 상위 12%에요</p></h3>
                          <h4 class="text-dark font-weight-bold mb-2">11,121 분</h4>
                          <canvas id="customers"></canvas>
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
                          <h4 class="card-title">얼마만큼의 감상을 표현했나요?</h4>
                          <p>그라포 님은 GRAFO 회원 중<br>상위 31% 에요!</p>
                          <h4 class="text-dark font-weight-bold mb-2">26 개</h4>
                          <canvas id="orders"></canvas>
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
             <img src="path/to/your/image.jpg" alt="프로필 이미지"> <!-- 이미지 경로 설정 -->
            </div>
            <div class="profile-info">
                <h2>그라포</h2>
                <p>grafo@naver.com</p>
                <p>가입일: 2024-05-20</p>
             </div>
    <button class="edit-button">수정</button>
		</div>
        </div>
        <div class="profile-stats">
            <div class="stat">
                <h4>팔로잉</h4>
                <h5><p>7</p></h5>
            </div>
            <div class="stat">
                <h4>팔로워</h4>
                <h5><p>12</p></h5>
            </div>
            <div class="stat">
                <h4>받은 추천 수</h4>
                <h5><p>21</p></h5>
            </div>
        </div>
        <div class="profile-message-container">
            <p class="profile-message">그라포님의 인생 영화는 <b>명탐정 코난 : 시한장치의 마천루</b>입니다.<br><br><br>
            인생영화에 대한 한 마디를 남겨보세요.</p>
        </div>
    
                    </div>
                  </div>
            </div>
          </div>
          <div class="row">
              <div class="col-xl-4 grid-margin stretch-card">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex justify-content-between mb-3">
                          
                          <div class="dropdown">
                              
                              <div class="dropdown-menu" aria-labelledby="dropdownMenuSizeButton3">
                                
                              </div>
                            </div>
                      </div>
                      <div id="chart-legends-market-trend" class="chart-legends mt-1">
                      </div>
                      <div class="row mt-2 mb-2">
                        <div class="col-6">
                          
                        </div>
                        <div class="col-6">
                          
                        </div>
                      </div>
                      <div class="marketTrends mt-4">
                        <canvas id="marketTrendssatacked"></canvas>
                      </div>
                        
                    </div>
                  </div>
              </div>
              <div class="col-xl-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    
                    <div class="row">
                      <div class="col-sm-12">
                          
                        
                      </div>
                      <div class="col-sm-12">
                        <div class="traffic-source-legend">
                          <div class="d-flex justify-content-between mb-1 mt-2">
                          </div>
                         
                         
                          
                        </div>
                        
                      </div>
                    </div>  
                  </div>
                </div>
              </div>
              <div class="col-xl-4 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                   
                    <div class="row">
                      <div class="col-sm-12">
                       
                      </div>
                    </div>  
                  </div>
                </div>
              </div>
          </div>
          <div class="row">
            <div class="col-xl-9 grid-margin-lg-0 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    
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
                      <div>
                        <select id="over-all-rating" name="rating" autocomplete="off">
                          <option value="1">1</option>
                          <option value="2">2</option>
                          <option value="3">3</option>
                          <option value="4">4</option>
                          <option value="5">5</option>
                        </select>
                      </div>
                    </div>
                    <p class="mb-4">Based on 186 reviews</p>
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
                    <div class="row">
                      <div class="col-sm-12">
                        <p class="mb-2 mt-3 mb-3 text-dark font-weight-bold">Rating by category</p>
                        <div class="d-flex">
                            <div>
                                <div class="text-dark font-weight-bold mb-2 mr-2">4.3</div>
                            </div>
                            <div class="mr-2">
                              <i class="fa fa-star text-warning"></i>
                            </div>
                            <div><p>Work/Management</p></div>
                          </div>
                          <div class="d-flex">
                              <div>
                                  <div class="text-dark font-weight-bold mb-2 mr-2">3.5</div>
                              </div>
                              <div class="mr-2">
                                <i class="fa fa-star text-warning"></i>
                              </div>
                              <div><p>Salary/Culture</p></div>
                            </div>
                      </div>
                    </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        
        
</body>
</html>