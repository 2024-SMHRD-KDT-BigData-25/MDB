<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.ReviewRecmInfo"%>
<%@page import="com.smhrd.model.ReviewInfo"%>
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
        
        		.like-btn {
			cursor: pointer;
			margin-right: 10px;
		}
		
		.active {
			color: red;
			cursor: pointer;
			margin-right: 10px;
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
        <div class="main-panel">
        
        	<% int review_cd = Integer.parseInt(request.getParameter("review_cd"));
        		System.out.println(user_email);	
        		ReviewInfo review = dao.reviewbyReview_cd(review_cd);
        		 int totalLikes = dao.totallike(review_cd);
        		    ReviewRecmInfo res = new ReviewRecmInfo(review_cd, user_email);
        		    int check = dao.checklike(res);
        	
        	%>
        
            <div class="content-wrapper" style="padding:60px;">
                <!-- 작업공간입니다! -->
                <div class="container">
                    <div class="header">
                        <div class="profile-img">
                            <img src="resources/images/<%=member.getPf_img() %>" alt="Profile Image" style="width: 100%; height: 100%; border-radius: 50%;" />
                        </div>
                        <span class="nick"><%=review.getNick() %></span>
                        <div class="action-buttons">
                            	<span class = "like-btn <%= check > 0 ? "active" : "" %>" >
								   <i class="fas fa-heart"></i>
								</span> <span style="color:#ffffff;"> like : </span><span id="like-count" style="color:#ffffff;"><%= totalLikes %>  </span>
                            <button>follow</button>
                        </div>
                    </div>
                    
                    <div class="content">

                        <div class="review-text"><%=review.getReview_content() %></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <script>



 // 좋아요 추가, 취소, 카운트
 const likeButton = document.querySelector('.like-btn');
 const likeCountDisplay = document.getElementById('like-count');

 likeButton.addEventListener('click', function() {
     const isActive = this.classList.toggle('active'); // 버튼의 상태 토글
     const xhr = new XMLHttpRequest();
     const url = isActive ? "LikeInsertController" : "LikeDeleteController";

     xhr.open("POST", url, true);
     xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
     xhr.onload = function() {
         if (xhr.status === 200) {
             // 성공 시 총 좋아요 수 업데이트
             const currentLikes = parseInt(likeCountDisplay.textContent);
             likeCountDisplay.textContent = isActive ? currentLikes + 1 : currentLikes - 1; // 화면에 좋아요 수 업데이트

 	            // 버튼 텍스트 변경
 	            if (isActive) {
 	                this.classList.add('on'); // 좋아요 추가 시 'on' 클래스 추가
 	            } else {
 	                this.classList.remove('on'); // 좋아요 제거 시 'on' 클래스 제거
 	            } 
         } else {
             console.log("요청에 실패했습니다.");
         }
     };

     // 서버로 보낼 데이터 설정
     xhr.send("user_email=" + encodeURIComponent("<%=user_email%>") + "&review_cd=" + encodeURIComponent("<%=review_cd%>") );
 });    
    </script>

</body>
</html>
