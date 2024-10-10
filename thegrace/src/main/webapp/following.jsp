<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINEM@GRAFO</title>
<style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 30px;
        }
        .container {
            max-width: 400px; /* 최대 너비 설정 */
            margin: 0 auto; /* 중앙 정렬 */
            background-color: #fff;
            border-radius: 8px;
            padding: 25px; /* 패딩 줄임 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: left; /* 제목 왼쪽 정렬 */
            margin-bottom: 30px; /* 아래쪽 여백 */
            
        }
        .following-item {
        	
        	height:150px;
            display: flex; /* 플렉스 박스 사용 */
            align-items: center; /* 수직 정렬 */
            padding: 10px; /* 내부 여백 */
            margin-bottom: 10px; /* 아래쪽 여백 */
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
            background-color: #f9f9f9; /* 배경색 */
        }
        .profile-img {
            width: 100px !important; /* 이미지 너비 조정 */
            height: 100px !important;; /* 이미지 높이 조정 */
            border-radius: 50% !important;; /* 둥글게 만들기 */
            margin-right: 10px; /* 오른쪽 여백 */
            overflow: hidden; /* 이미지가 둥글게 잘리도록 설정 */
        }
         .profile-img img {
            width: 100%; /* 이미지 너비 100% */
            height: 100%; /* 이미지 높이 100% */
            object-fit: cover; /* 이미지 비율 유지 */
        }
        .follow-button {
            margin-left: auto; /* 오른쪽으로 정렬 */
            background-color: #4CAF50; /* 버튼 색상 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리 둥글게 */
            padding: 6px 10px; /* 패딩 */
            cursor: pointer; /* 커서 모양 변경 */
            transition: background-color 0.3s; /* 부드러운 전환 */
        }
        .follow-button:hover {
            background-color: red; /* 호버 시 빨간색으로 변경 */
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
        <div class="content-wrapper" style="padding:60px;">
        
        <!-- 작업공간입니다! -->
       <div class="container">
        <h2><b>FOLLOWING</b></h2>
        <p>관심있는 유저들의 GRAFO를 확인해보세요.</p>

        <div class="following-item">
            <div class="profile-img">
                <img src="images/faces/face3.jpg" alt="프로필 이미지 1"> <!-- 이미지 경로 설정 -->
            </div>
            <div>
                <h4><strong>그라포</strong></h4><br>
                <h6><span>grafo@email.com</span></h6>
            </div>
             <button class="follow-button" onmouseover="this.textContent='unfollow'" onmouseout="this.textContent='following'">following</button>
        </div>
        
        <div class="following-item">
            <div class="profile-img">
                <img src="path/to/image2.jpg" alt="프로필 이미지 2"> <!-- 이미지 경로 설정 -->
            </div>
            <div>
                <h4><strong>그라포</strong></h4><br>
                <h6><span>grafo@email.com</span></h6>
            </div>
             <button class="follow-button" onmouseover="this.textContent='unfollow'" onmouseout="this.textContent='following'">following</button>
        </div>
        
        <div class="following-item">
            <div class="profile-img">
                <img src="path/to/image3.jpg" alt="프로필 이미지 3"> <!-- 이미지 경로 설정 -->
            </div>
            <div>
                <h4><strong>그라포</strong></h4><br>
                <h6><span>grafo@email.com</span></h6>
            </div>
             <button class="follow-button" onmouseover="this.textContent='unfollow'" onmouseout="this.textContent='following'">following</button>
        </div>
    </div>
        
        
        </div>
      </div>
      
    </div>
    
  </div>



</body>
</html>