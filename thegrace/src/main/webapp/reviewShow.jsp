<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CINEM@GRAFO</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }
        .container {
            display: flex;
            flex-direction: column; /* 세로 방향으로 배치 */
            align-items: flex-start; /* 왼쪽 정렬 */
            background-color: #2f2f2f; /* 전체 배경색 */
            border-radius: 8px; /* 모서리 둥글게 */
            padding: 20px; /* 여백 */
            width: 800px !important; /* 전체 너비 */
            height: 500px !important;
            max-hight: auto !important;
            max-width: 800px !important; /* 최대 너비 */
            margin: 20px auto; /* 중앙 정렬 */
        }
        .header {
            display: flex;
            align-items: center;
            width: 100%; /* 전체 너비 */
            margin-bottom: 20px; /* 아래 여백 */
        }
        .profile-img {
            width: 100px !important; /* 프로필 이미지 크기 */
            height: 100px !important;
            border-radius: 50% !important;
            background-color: #ddd; /* 기본 배경색 */
            margin-right: 20px; /* 이미지와 텍스트 간격 */
        }
        .nick {
            font-size: 24px; /* 닉네임 크기 */
            color: white; /* 텍스트 색상 */
        }
        .action-buttons {
            margin-left: auto; /* 오른쪽 정렬 */
            display: flex;
            align-items: center;
        }
        .content {
            display: flex;
            align-items: flex-start; /* 리뷰 이미지와 텍스트를 정렬 */
            width: 100%; /* 전체 너비 */
        }
        .review-img {
            width: 120px !important; /* 리뷰 이미지 크기 */
            height: 140px !important;
            background-color: #ddd; /* 기본 배경색 */
            margin-right: 20px; /* 이미지와 텍스트 간격 */
        }
        .review-text {
            flex: 1; /* 나머지 공간 차지 */
            font-size: 16px;
            color: #333;
            background-color: #e0e0e0; /* 배경색 */
            padding: 10px; /* 여백 */
            border-radius: 8px; /* 모서리 둥글게 */
        }
    </style>
    <script>
        function handleLike() {
            alert("하트를 눌렀습니다!");
            // 추가적인 로직을 여기에 구현할 수 있습니다.
        }
    </script>
</head>
<body>
<div class="container-scroller">
    <!-- 상단바 불러오기 -->
    <%@ include file="navbar.jsp" %>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <%@ include file="sidebar.jsp" %>
      
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper" style="padding:60px;">
                <!-- 작업공간입니다! -->
                <div class="container">
                    <div class="header">
                        <div class="profile-img">
                            <img src="resources/images/profile.jpg" alt="Profile Image" style="width: 100%; height: 100%; border-radius: 50%;" />
                        </div>
                        <span class="nick">#nick</span>
                        <div class="action-buttons">
                            <span style="color: red; cursor: pointer; margin-right: 20px" onclick="handleLike()">
                                <i class="fas fa-heart"></i>
                            </span>
                            <button>follow</button>
                        </div>
                    </div>
                    
                    <div class="content">
                        <div class="review-img">
                            <img src="resources/images/sample.jpg" alt="Sample Image" style="width: 100%; height: auto;"/>
                        </div>
                        <div class="review-text">#reviewContent</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
