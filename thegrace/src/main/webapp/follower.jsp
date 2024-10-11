<%@page import="com.google.gson.Gson"%>
<%@page import="com.smhrd.model.FollowPf"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@page import="com.smhrd.model.UserInfo"%>
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
        <h2>FOLLOWER</h2>
        <p>관심있는 유저들의 GRAFO를 확인해보세요.</p>
        <div id="followingList"></div> <!-- 동적으로 추가될 항목 -->

        <p id="loading" style="text-align: center; display: none;">Loading...</p> <!-- 로딩 텍스트 -->
    </div>

	<% 
	UserInfo member = (UserInfo)session.getAttribute("member");
	String followee = member.getUser_email();
		
	MovieDAO dao = new MovieDAO();
	List<FollowPf> followerList = dao.getFollowee(followee);
	
	String jsonFollowerList = new Gson().toJson(followerList);
	%>

        
        
        </div>
      </div>
      
    </div>
    
  </div>

    <script>
    	const followerMember = <%= jsonFollowerList %>;
    
        let itemCount = 0; // 현재 추가된 항목 수

        function addFollowing() {
            const followingList = document.getElementById('followingList');

         // 현재 항목 수가 followerList 길이보다 작을 때만 항목 추가
            if (itemCount < followerMember.length) {
                const follower = followerMember[itemCount]; // 현재 항목 가져오기

                
                // 새로운 following 항목 생성
                const followingItem = document.createElement('div');
                followingItem.className = 'following-item';
                
                // follower 정보를 사용하여 HTML을 생성
                followingItem.innerHTML = `
                    <div class="profile-img">
                        <img src="/resources/images/${follower.pf_img}" alt="프로필 사진">
                    </div>
                    <div>
                        <strong>${follower.nick}</strong><br>
                        <span>${follower.followee}</span>
                    </div>
                    <button class="follow-button">Follow</button>
                `;

                followingList.appendChild(followingItem); // 항목 추가
                itemCount++; // 항목 수 증가
            }
        }

        function handleScroll() {
            const scrollableHeight = document.documentElement.scrollHeight;
            const currentScroll = window.scrollY + window.innerHeight;

            if (currentScroll >= scrollableHeight - 200) { // 스크롤이 맨 아래에 가까워지면
                document.getElementById('loading').style.display = 'block'; // 로딩 표시
                setTimeout(() => {
                    addFollowing(); // 새로운 항목 추가
                    document.getElementById('loading').style.display = 'none'; // 로딩 숨기기
                }, 1000); // 1초 후에 추가
            }
        }

        // 초기 항목 추가
        for (let i = 0; i < 10; i++) {
            addFollowing();
        }

        // 스크롤 이벤트 리스너 추가
        window.addEventListener('scroll', handleScroll);
    </script>


</body>
</html>