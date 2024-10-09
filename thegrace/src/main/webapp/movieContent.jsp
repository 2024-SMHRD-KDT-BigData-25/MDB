<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Regal Admin</title>
  <!-- base:css -->
  <link rel="stylesheet" href="resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="resources/vendors/feather/feather.css">
  <link rel="stylesheet" href="resources/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="resources/vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="resources/vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="resources/vendors/jquery-bar-rating/fontawesome-stars.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="resources/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="resources/images/favicon.png" />
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
            width: 80%;
            margin: 0 auto;
            background-color: #ffffff;
            padding: 20px;
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
    width: 300px;
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
    font-size: 18px;
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
    font-size: 14px;
    color: #555;
}

.movie-poster {
    width: 100px;
    margin-top: 10px;
}

      
    
  </style>
</head>
<body>


  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="index.html"><img src="resources/images/logo.svg" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="resources/images/logo-mini.svg" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <input type="text" class="form-control" placeholder="Search Projects.." aria-label="search" aria-describedby="search">
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">
          <li class="nav-item dropdown d-lg-flex d-none">
            <button type="button" class="btn btn-info font-weight-bold">+ Create New</button>
          </li>
          <li class="nav-item dropdown d-flex">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="icon-air-play mx-0"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Messages</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                    <img src="resources/images/faces/face4.jpg" alt="image" class="profile-pic">
                </div>
                <div class="preview-item-content flex-grow">
                  <h6 class="preview-subject ellipsis font-weight-normal">David Grey
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    The meeting is cancelled
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                    <img src="resources/images/faces/face2.jpg" alt="image" class="profile-pic">
                </div>
                <div class="preview-item-content flex-grow">
                  <h6 class="preview-subject ellipsis font-weight-normal">Tim Cook
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    New product launch
                  </p>
                </div>
              </a>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                    <img src="resources/images/faces/face3.jpg" alt="image" class="profile-pic">
                </div>
                <div class="preview-item-content flex-grow">
                  <h6 class="preview-subject ellipsis font-weight-normal"> Johnson
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    Upcoming board meeting
                  </p>
                </div>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown d-flex mr-4 ">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-cog"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Settings</p>
              <a class="dropdown-item preview-item">               
                  <i class="icon-head"></i> Profile
              </a>
              <a class="dropdown-item preview-item">
                  <i class="icon-inbox"></i> Logout
              </a>
            </div>
          </li>
          <li class="nav-item dropdown mr-4 d-lg-flex d-none">
            <a class="nav-link count-indicatord-flex align-item s-center justify-content-center" href="#">
              <i class="icon-grid"></i>
            </a>
          </li>
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <div class="user-profile">
          <div class="user-image">
            <img src="resources/images/faces/face28.png">
          </div>
          <div class="user-name">
              Edward Spencer
          </div>
          <div class="user-designation">
              Developer
          </div>
        </div>
        <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="index.html">
              <i class="fa-solid fa-camera-movie"></i>
              <span class="menu-title">MOVIE</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <i class="fa-solid fa-comment"></i>
              <span class="menu-title">REVIEW</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="resources/pages/ui-features/buttons.html">Buttons</a></li>
                <li class="nav-item"> <a class="nav-link" href="resources/pages/ui-features/typography.html">Typography</a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="resources/pages/forms/basic_elements.html">
              <i class="icon-file menu-icon"></i>
              <span class="menu-title">FRIENDS</span>
            </a>
          </li>
                   <li class="nav-item">
            <a class="nav-link" href="resources/pages/tables/basic-table.html">
              <i class="icon-command menu-icon"></i>
              <span class="menu-title">SETTING</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="resources/pages/icons/feather-icons.html">
              <i class="icon-help menu-icon"></i>
              <span class="menu-title">Icons</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
              <i class="icon-head menu-icon"></i>
              <span class="menu-title">User Pages</span>
              <i class="menu-arrow"></i>
            </a>
            <div class="collapse" id="auth">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login.html"> Login </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/login-2.html"> Login 2 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/register.html"> Register </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/register-2.html"> Register 2 </a></li>
                <li class="nav-item"> <a class="nav-link" href="pages/samples/lock-screen.html"> Lockscreen </a></li>
              </ul>
            </div>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="docs/documentation.html">
              <i class="icon-book menu-icon"></i>
              <span class="menu-title">Documentation</span>
            </a>
          </li>
        </ul>
      </nav>
      <!-- partial -->
      
      
      <div class="main-panel">
      <div class="content-wrapper" style="margin-left: 20px; margin-right: 40px; float right;"><!-- 여백 추가 -->
        <div class="content-wrapper">
        <div class="strong">
            <p>애니메이션/미스터리 · 전체관람가 · 1997 · 일본</p>
              <h2>명탐정 코난: 시한장치의 마천루</h2>
          <h4>Detective Conan: The Time-Bombed Skyscraper</h4>
      
        

        <div class="content">
   <img src="resources/images/코난.png" alt="Additional Image" style="width: 250px; margin-right: 20px;"> <!-- 추가할 이미지 -->
          <div>

            <p><h3>줄거리</h3>
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
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
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
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
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
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
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
                <button class="btn">추천</button>
                <button class="btn follow">팔로우</button>
            </div>
        </div>
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
    </div>

    <div class="review-card">
        <div class="review-header">
            <img src="resources/images/faces/face2.jpg" alt="Profile Image">
            <span class="review-title">사용자 2</span>
            <div class="buttons">
                <button class="btn">추천</button>
                <button class="btn follow">팔로우</button>
            </div>
        </div>
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
    </div>

    <div class="review-card">
        <div class="review-header">
            <img src="resources/images/faces/face3.jpg" alt="Profile Image">
            <span class="review-title">사용자 3</span>
            <div class="buttons">
                <button class="btn">추천</button>
                <button class="btn follow">팔로우</button>
            </div>
        </div>
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
    </div>

    <!-- 추가된 사용자 4, 5, 6 -->
    <div class="review-card">
        <div class="review-header">
            <img src="resources/images/faces/face4.jpg" alt="Profile Image">
            <span class="review-title">사용자 4</span>
            <div class="buttons">
                <button class="btn">추천</button>
                <button class="btn follow">팔로우</button>
            </div>
        </div>
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
    </div>

    <div class="review-card">
        <div class="review-header">
            <img src="resources/images/faces/face5.jpg" alt="Profile Image">
            <span class="review-title">사용자 5</span>
            <div class="buttons">
                <button class="btn">추천</button>
                <button class="btn follow">팔로우</button>
            </div>
        </div>
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
    </div>

    <div class="review-card">
        <div class="review-header">
            <img src="resources/images/faces/face6.jpg" alt="Profile Image">
            <span class="review-title">사용자 6</span>
            <div class="buttons">
                <button class="btn">추천</button>
                <button class="btn follow">팔로우</button>
            </div>
        </div>
        <h5>#mv_title</h5>
        <p>#review_content</p>
        <img src="#mv_poster" alt="Movie Poster" class="movie-poster">
    </div>
</div>
</div>   
        
        
        
    </div>
</div>
</body>
</html>
        
         