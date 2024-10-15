<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<style>
	
		.like-btn {
			cursor: pointer;
			margin-right: 10px;
		}
		
		.on {
			color: red;
			cursor: pointer;
			margin-right: 10px;
		}
		
		.center {
			display: flex;
            justify-content: center;
            align-items: center;
		}
	
	</style>
</head>
<body>

<%
	// 총 좋아요 수 카운트, 현재 좋아요 체크 되어있는지 확인
    int totalLikes = 7;
    int check = 1;
%>


<div class="center">
	<span class = "like-btn <%= check > 0 ? "on" : "" %>" onclick="handleLike()">
	   <i class="fas fa-heart"></i>
	</span> like : <span id="like-count"><%= totalLikes %></span>
</div>
    <script src="resources/js/like.js"></script>
    <script>
    const likeButton = document.querySelector('.like-btn');
    const likeCountDisplay = document.getElementById('like-count');

    
    </script>
    
</body>
</html>