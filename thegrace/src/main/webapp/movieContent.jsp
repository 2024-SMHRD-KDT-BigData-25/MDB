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
      margin-left:5px;
      margin-right:5px;
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
  
</head>
<body>
<div class="container-scroller">
  <!-- 상단바 불러오기 -->
  <%@ include file="navbar.jsp" %>
    
  <div class="container-fluid page-body-wrapper">  
  <%@ include file="sidebar.jsp" %>
      
  	<!-- partial -->
     <div class="main-panel">
     <% int mv_cd = Integer.parseInt(request.getParameter("mv_cd")); %>
      <div class="content-wrapper" style="margin-left: 20px; margin-right: 40px; float right;"><!-- 여백 추가 -->
        <div class="strong">
            <p>장르 · 개봉년도 · 제작국가 · 상영시간</p>
              <h2>명탐정 코난: 시한장치의 마천루</h2>
          <h4>Detective Conan: The Time-Bombed Skyscraper</h4>
      
        

        <div class="content">
   <img src="resources/images/코난.png" alt="Additional Image" style="width: 250px; margin-right: 20px;"> <!-- 추가할 이미지 -->
          <div>

            <h3>줄거리</h3>
<p>
“5월 3일 토요일 밤 10시! 베이카 시네마 로비에서 만나는 거다! 잊지 마!”<br><br>

검은 조직에 의해 초등학생 코난의 몸으로 작아진 고등학생 쿠도 신이치,<br>
천재 건축가 모리야 테이지 교수에게 가는 파티의 초대를 받았지만,<br>
코난은 상태를 알 수 없어 대리인을 부탁하려 소꿉친구 모리란에게<br>
목소리 변조기를 사용해 신이치로서 전화를 건다. 하지만 밤 10시,<br>
심야 영화를 보자고 조건을 걸어 난처해지고 만다.<br><br>

약속 당일, 뉴스에서 화약 도난 사건을 보던 코난이 신이치에게<br>
수상한 협박 전화가 걸려 오고 의문의 남자가 도심 전체를 폭탄 테러로<br>
협박한다. 자신에게 도전장을 내민 연쇄 폭탄 테러임을 알게 된 신이치는<br>
범인과의 숨 막히는 대결 중, 베이카 시티 빌딩이 되는 란이 타지게 되어<br>
위험에 처함을 깨닫는다...<br><br>

“명탐정 코난”, 전무후무 레전드 애니메이션의 ‘시작’!<br>
진실은 언제나 하나!
</p>

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

    <div class="review-card">
      
        <div class="review-header">
            <img src="resources/images/faces/face1.jpg" alt="Profile Image">
            <span class="review-title">뚱냥이</span>
            <div class="buttons">
                <button class="btn">수정</button>
                <button class="btn follow">삭제</button>
            </div>
        </div>
        <p>#review_content</p>
    </div>

    <div class="review-card">
        <div class="review-header">
            <img src="resources/images/faces/face2.jpg" alt="Profile Image">
            <span class="review-title">사용자 2</span>
            <div class="buttons">
                <button class="btn">수정</button>
                <button class="btn follow">삭제</button>
            </div>
        </div>
        <p>#review_content</p>
    </div>

    <div class="review-card">
        <div class="review-header">
            <img src="resources/images/faces/face3.jpg" alt="Profile Image">
            <span class="review-title">사용자 3</span>
            <div class="buttons">
                <button class="btn">수정</button>
                <button class="btn follow">삭제</button>
            </div>
        </div>
        <p>#review_content</p>
    </div>

</div>

<!-- 추가 리뷰 섹션 -->
<div class="reviews-section">
    <h4>리뷰(#리뷰 개수)</h4>

    <div class="review-card">
    <div class="review-header">
        <img src="resources/images/faces/face1.jpg" alt="Profile Image">
        <span class="review-title">뚱냥이</span>
        <div class="buttons">
            <span style="color: red; cursor: pointer;" onclick="handleLike(this)">
                <i class="fas fa-heart"></i>
            </span>
            <button class="btn follow">팔로우</button>
        </div>
    </div>
    <h5>#mv_title</h5>
    <p>#review_content</p>
    <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
</div>

<script>
    function handleLike(element) {
        // 여기에서 좋아요 로직을 구현할 수 있습니다.
        alert("You liked this review!");
        // 예를 들어, 색상을 변경할 수도 있습니다.
        element.querySelector('i').style.color = 'red'; // 하트를 빨간색으로 변경
    }
</script>

    <div class="review-card">
    <div class="review-header">
        <img src="resources/images/faces/face1.jpg" alt="Profile Image">
        <span class="review-title">뚱냥이</span>
        <div class="buttons">
            <span style="color: red; cursor: pointer;" onclick="handleLike(this)">
                <i class="fas fa-heart"></i>
            </span>
            <button class="btn follow">팔로우</button>
        </div>
    </div>
    <h5>#mv_title</h5>
    <p>#review_content</p>
    <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
</div>

<script>
    function handleLike(element) {
        // 여기에서 좋아요 로직을 구현할 수 있습니다.
        alert("You liked this review!");
        // 예를 들어, 색상을 변경할 수도 있습니다.
        element.querySelector('i').style.color = 'red'; // 하트를 빨간색으로 변경
    }
</script>

    <div class="review-card">
    <div class="review-header">
        <img src="resources/images/faces/face1.jpg" alt="Profile Image">
        <span class="review-title">뚱냥이</span>
        <div class="buttons">
            <span style="color: red; cursor: pointer;" onclick="handleLike(this)">
                <i class="fas fa-heart"></i>
            </span>
            <button class="btn follow">팔로우</button>
        </div>
    </div>
    <h5>#mv_title</h5>
    <p>#review_content</p>
    <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
</div>

<script>
    function handleLike(element) {
        // 여기에서 좋아요 로직을 구현할 수 있습니다.
        alert("You liked this review!");
        // 예를 들어, 색상을 변경할 수도 있습니다.
        element.querySelector('i').style.color = 'red'; // 하트를 빨간색으로 변경
    }
</script>
    <!-- 추가된 사용자 4, 5, 6 -->
    <div class="review-card">
    <div class="review-header">
        <img src="resources/images/faces/face1.jpg" alt="Profile Image">
        <span class="review-title">뚱냥이</span>
        <div class="buttons">
            <span style="color: red; cursor: pointer;" onclick="handleLike(this)">
                <i class="fas fa-heart"></i>
            </span>
            <button class="btn follow">팔로우</button>
        </div>
    </div>
    <h5>#mv_title</h5>
    <p>#review_content</p>
    <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
</div>

<script>
    function handleLike(element) {
        // 여기에서 좋아요 로직을 구현할 수 있습니다.
        alert("You liked this review!");
        // 예를 들어, 색상을 변경할 수도 있습니다.
        element.querySelector('i').style.color = 'red'; // 하트를 빨간색으로 변경
    }
</script>
    <div class="review-card">
    <div class="review-header">
        <img src="resources/images/faces/face1.jpg" alt="Profile Image">
        <span class="review-title">뚱냥이</span>
        <div class="buttons">
            <span style="color: red; cursor: pointer;" onclick="handleLike(this)">
                <i class="fas fa-heart"></i>
            </span>
            <button class="btn follow">팔로우</button>
        </div>
    </div>
    <h5>#mv_title</h5>
    <p>#review_content</p>
    <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
</div>

<script>
    function handleLike(element) {
        // 여기에서 좋아요 로직을 구현할 수 있습니다.
        alert("You liked this review!");
        // 예를 들어, 색상을 변경할 수도 있습니다.
        element.querySelector('i').style.color = 'red'; // 하트를 빨간색으로 변경
    }
</script>

    <div class="review-card">
    <div class="review-header">
        <img src="resources/images/faces/face1.jpg" alt="Profile Image">
        <span class="review-title">뚱냥이</span>
        <div class="buttons">
            <span style="color: red; cursor: pointer;" onclick="handleLike(this)">
                <i class="fas fa-heart"></i>
            </span>
            <button class="btn follow">팔로우</button>
        </div>
    </div>
    <h5>#mv_title</h5>
    <p>#review_content</p>
    <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
</div>

<script>
    function handleLike(element) {
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
</div>



</body>
</html>
        
         