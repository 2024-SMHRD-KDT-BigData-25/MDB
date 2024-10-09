<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CINEM@GRAFO</title>
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
  <link rel="stylesheet" href="resources/css/fonts.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="resources/images/favicon.png" />
  
  <style>
  	body {
		font-family: 'S-CoreDream-3Light', sans-serif;
		background-color: #f4f7fa;
	}
	
  </style>
  
</head>
<body>
	    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row"> <!-- 상단바 -->
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="index.html"><img src="resources/images/logo-w.png" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="index.html"><img src="resources/images/logo-mini.png" alt="logo"/></a>
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
              <form action="searchResult.jsp">
              	<input type="text" class="form-control" name="search" placeholder="리뷰가 궁금한 영화를 검색해 보세요!" size=50 aria-label="search" aria-describedby="search">
			  </form>            
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">	
          <li class="nav-item dropdown d-flex">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="icon-air-play mx-0"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Message</p>
              <a class="dropdown-item preview-item">
                <div class="preview-thumbnail">
                    <img src="resources/images/faces/face4.jpg" alt="image" class="profile-pic">
                </div>
                <div class="preview-item-content flex-grow">
                  <h6 class="preview-subject ellipsis font-weight-normal">#유저닉네임1
                  </h6>
                  <p class="font-weight-light small-text text-muted mb-0">
                    가장 최근 메시지 내용
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
              <a class="dropdown-item preview-item" href="Logout">
                  <i class="icon-inbox"></i> Logout
              </a>
            </div>
          </li>		
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav> <!-- 상단바 ends -->
</body>
</html>