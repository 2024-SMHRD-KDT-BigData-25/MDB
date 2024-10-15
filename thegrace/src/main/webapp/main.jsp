<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>

<%@page import="com.smhrd.model.RevMvTitle"%>
<%@page import="com.smhrd.model.ReviewInfo"%>
<%@page import="com.smhrd.model.FollowPf"%>
<%@page import="com.smhrd.model.MovieInfo"%>
<%@page import="com.smhrd.model.UserInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

   <%   

      // 타입이름 변수명 = dao.매개변수명
      UserInfo member = (UserInfo)session.getAttribute("member");
      String user_email = member.getUser_email(); 
      MovieDAO dao = new MovieDAO();
      List<FollowPf> followeeList = dao.getFollowee(user_email);
      
      
      // 내가 팔로우한 사람이 작성한 리뷰의 영화제목 가져오기!!!! 너무 어렵다ㅠ
   %>
   
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
                <form id="voteForm" method="post" action="vote">
			        <div id="movieList"> <!-- 영화 목록이 동적으로 추가될 부분 -->
			            <!-- JavaScript를 통해 영화 목록이 추가될 예정 -->
			        </div>
			        <br>
			        <button type="submit">투표하기</button>
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
              <%if (followeeList.size() >= 3) {
                 List<RevMvTitle> reviewMvList = dao.followeeReviewList( followeeList.get(0).getFollowee() );
                 List<RevMvTitle> reviewMvList2 = dao.followeeReviewList( followeeList.get(1).getFollowee() );
                 List<RevMvTitle> reviewMvList3 = dao.followeeReviewList( followeeList.get(2).getFollowee() );
                 %>
              <div class="reviews-section">
                <h4>팔로우 중인 사람들의 리뷰를 읽어보세요!</h4>
                <div class="review-card">
                  <div class="review-header">
                    <img src=<%=followeeList.get(0).getPf_img()  %> alt="Profile Image">
                    <span class="review-title"><%=followeeList.get(0).getNick() %></span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                    </div>
                  </div>
                  <h5><%=reviewMvList.get(0).getMv_title() %></h5>
                  <p><%=reviewMvList.get(0).getReview_content()%></p>
                   <img src=<%=reviewMvList.get(0).getMv_poster() %>  alt="Movie Poster" style="width:100px;">
                </div>
                
                <div class="review-card">
                  <div class="review-header">
                    <img src=<%=followeeList.get(1).getPf_img() %> alt="Profile Image">
                    <span class="review-title"><%=followeeList.get(1).getNick() %></span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                    </div>
                  </div>
                  <h5><%=reviewMvList2.get(0).getMv_title() %></h5>
                  <p><%=reviewMvList2.get(0).getReview_content()%></p>
                   <img src=<%=reviewMvList2.get(0).getMv_poster() %> alt="Movie Poster" style="width:100px;">
                </div>
                
                <div class="review-card">
                  <div class="review-header">
                    <img src=<%=followeeList.get(2).getPf_img() %> alt="Profile Image">
                    <span class="review-title"><%=followeeList.get(2).getNick() %></span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                    </div>
                  </div>
                  <h5><%=reviewMvList3.get(0).getMv_title() %></h5>
                  <p><%=reviewMvList3.get(0).getReview_content()%></p>
                <img src=<%=reviewMvList3.get(0).getMv_poster() %>  alt="Movie Poster" style="width:100px;">
                </div>
              </div>
              
              <%} else if (followeeList.size() == 2) { 
                 List<RevMvTitle> reviewMvList = dao.followeeReviewList( followeeList.get(0).getFollowee() );
                 List<RevMvTitle> reviewMvList2 = dao.followeeReviewList( followeeList.get(1).getFollowee() );
              %>
              <div class="reviews-section">
                <h4>팔로우 중인 사람들의 리뷰를 읽어보세요!</h4>
                <div class="review-card">
                  <div class="review-header">
                    <img src=<%=followeeList.get(0).getPf_img()  %> alt="Profile Image">
                    <span class="review-title"><%=followeeList.get(0).getNick() %></span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                    </div>
                  </div>
                  <h5><%=reviewMvList.get(0).getMv_title() %></h5>
                  <p><%=reviewMvList.get(0).getReview_content()%></p>
                   <img src=<%=reviewMvList.get(0).getMv_poster() %>  alt="Movie Poster" style="width:100px;">
                </div>
                
                <div class="review-card">
                  <div class="review-header">
                    <img src=<%=followeeList.get(1).getPf_img() %> alt="Profile Image">
                    <span class="review-title"><%=followeeList.get(1).getNick() %></span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                    </div>
                  </div>
                  <h5><%=reviewMvList2.get(0).getMv_title() %></h5>
                  <p><%=reviewMvList2.get(0).getReview_content()%></p>
                   <img src=<%=reviewMvList2.get(0).getMv_poster() %> alt="Movie Poster" style="width:100px;">
                </div>
               </div>
                
              <%} else if (followeeList.size() == 1) { 
                 List<RevMvTitle> reviewMvList = dao.followeeReviewList( followeeList.get(0).getFollowee() );
              %>
              <div class="reviews-section">
                <h4>팔로우 중인 사람들의 리뷰를 읽어보세요!</h4>
                <div class="review-card">
                  <div class="review-header">
                    <img src=<%=followeeList.get(0).getPf_img()  %> alt="Profile Image">
                    <span class="review-title"><%=followeeList.get(0).getNick() %></span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                    </div>
                  </div>
                  <h5><%=reviewMvList.get(0).getMv_title() %></h5>
                  <p><%=reviewMvList.get(0).getReview_content()%></p>
                   <img src=<%=reviewMvList.get(0).getMv_poster() %>  alt="Movie Poster" style="width:100px;">
                </div>
               </div>
                
              <%} else if (followeeList.size() == 0) { %>
              <div class="reviews-section">
                <h4>팔로우 중인 사람들의 리뷰를 읽어보세요!</h4>
               <div class="review-card">
                <div class="review-header">
                 팔로우가 없습니다!
                </div>
               </div>
              </div>
              <%} %>
              
              <%System.out.println("List size: " + followeeList.size()); %>
              
 <div class="reviews-section">
                <h4><%=member.getNick() %>님이 최근 본 영화들, 다른 사람들은 어떻게 봤을까요?</h4>
                 <div class="review-card">
                  <div class="review-header">
                    <img src=<%=followeeList.get(3).getPf_img()%> alt="Profile Image">
                    <span class="review-title"><%= followeeList.get(3).getNick()%></span>
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
                    <img src="resources/images/청년경찰.jpg" alt="Profile Image">
                    <span class="review-title">00000</span>
                    <div class="buttons">
                      <button class="btn">추천</button>
                      <button class="btn follow">Follow</button>
                    </div>
                  </div>
                  <h5>대도시의사랑법</h5>
                  <p> 청춘의 성장기에 집중해 누구나 부담 없이, 공감하며 볼 수 있다</p>
                  <img src="resources/images/대도시의 사랑법.jpg" alt="Movie Poster" style="width:100px;">
                </div>
               <div class="review-card">
                  <div class="review-header">
                    <img src="resources/images/청년경찰.jpg" alt="Profile Image">
                    <span class="review-title">00000</span>
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
    // 페이지 로딩 시 영화 목록 불러오기
    // Chart.js 그래프 초기 설정
    // Chart.js 초기 설정
const ctx = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: [],  // 영화 제목이 들어갈 자리
        datasets: [{
            label: '투표 수',
            data: [],  // 투표 수 데이터가 들어갈 자리
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',  // 막대 1
                'rgba(255, 99, 132, 0.2)',  // 막대 2
                'rgba(75, 192, 192, 0.2)',  // 막대 3
                'rgba(153, 102, 255, 0.2)', // 막대 4
                'rgba(255, 159, 64, 0.2)'   // 막대 5
                // 각 막대마다 색상 추가 가능
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',  // 막대 1 테두리
                'rgba(255, 99, 132, 1)',  // 막대 2 테두리
                'rgba(75, 192, 192, 1)',  // 막대 3 테두리
                'rgba(153, 102, 255, 1)', // 막대 4 테두리
                'rgba(255, 159, 64, 1)'   // 막대 5 테두리
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});

// 서버에서 투표 결과를 받아와서 그래프 갱신
function fetchResults() {
    fetch('/thegrace/vote')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => {
            // 영화 목록 추가
            if (data.movieTitles && data.movieTitles.length > 0) {
                var movieListHtml = '';
                $.each(data.movieTitles, function(index, title) {
                    movieListHtml += '<label>';
                    movieListHtml += '<input type="radio" name="movieId" value="' + (index + 1) + '"> ' + title;
                    movieListHtml += '</label><br>';
                });
                $('#movieList').html(movieListHtml);  // 영화 목록을 페이지에 추가
            }

            // 그래프 업데이트
            myChart.data.labels = data.movieTitles; // 영화 제목으로 라벨 설정
            myChart.data.datasets[0].data = data.results;  // 투표 수 데이터 설정
            console.log(data.results)
            myChart.update();  // 그래프 업데이트
        })
        .catch(error => console.error('Error fetching results:', error));
}

// 페이지 로딩 시 투표 결과 불러오기
window.onload = fetchResults;

// 투표 폼 제출 처리
document.getElementById('voteForm').addEventListener('submit', function(event) {
    event.preventDefault();  // 폼 기본 제출 방지
    const selectedMovie = document.querySelector('input[name="movieId"]:checked');
    
    if (selectedMovie) {
        const formData = new FormData(this);  // 폼 데이터를 가져옴
        console.log([...formData.entries()]);
        fetch('/thegrace/vote', {
            method: 'POST',
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                alert(data.error);  // 중복 투표 등의 에러 처리
            } else {
                fetchResults();  // 투표 후 최신 결과 불러오기
                alert('투표가 성공적으로 완료되었습니다!');
            }
        })
        .catch(error => console.error('Error during voting:', error));
    } else {
        alert('영화를 선택해주세요.');  // 영화 선택하지 않았을 경우
    }
});
    
    </script>       
</body>
</html>