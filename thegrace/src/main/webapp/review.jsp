<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <title>CINEM@GRAFO</title>
    <style>
        .comment-card {
            border-bottom: 1px solid #ddd;
            padding: 15px 0;
            transition: transform 0.2s ease;
        }
        .comment-body {
            display: flex;
        }
        .comment-poster {
            width: 100px;
            border-radius: 5px;
            margin-right: 15px;
        }
        .actions {
            margin-top: 10px;
        }
        .action-btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .animate {
            animation: heartBeat 0.3s;
        }
        @keyframes heartBeat {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.2); }
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

        <div class="comment-section">
            <div class="comment-header">
                <br>
                <h1>지금 뜨는 코멘트</h1>
                
                <!-- Comment Card 1 -->
                <div class="comment-card">
                    <div class="comment-user">
                        <img src="resources/images/뚱냥이.png" alt="Profile Image">
                        <div class="user-info">
                            <div class="user-name">User 1</div>
                            <div class="comment-time">20분 전</div>
                        </div>
                    </div>

                    <div class="comment-body">
                        <img src="resources/images/너의이름은.jpg" alt="Movie Poster" class="comment-poster">
                        <div>
                            <h3>너의이름은</h3>
                            <p>내용 입력란</p>
                            
                            <!-- 좋아요 버튼 (내용 밑에 출력) -->
                            <div class="actions">
                                <button class="action-btn">
                                    좋아요 <span class="like-count">3</span> <i class="fas fa-heart"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Comment Card 2 -->
                <div class="comment-card">
                    <div class="comment-user">
                        <img src="resources/images/뚱냥이.png" alt="Profile Image">
                        <div class="user-info">
                            <div class="user-name">User 2</div>
                            <div class="comment-time">12시간 전</div>
                        </div>
                    </div>

                    <div class="comment-body">
                        <img src="resources/images/너의이름은.jpg" alt="Movie Poster" class="comment-poster">
                        <div>
                            <h3>너의이름은</h3>
                            <p>내용 입력란</p>
                            
                            <!-- 좋아요 버튼 (내용 밑에 출력) -->
                            <div class="actions">
                                <button class="action-btn">
                                    좋아요 <span class="like-count">5</span> <i class="fas fa-heart"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 추가적인 리뷰 카드 -->
                <div class="comment-card">
                    <div class="comment-user">
                        <img src="resources/images/뚱냥이.png" alt="Profile Image">
                        <div class="user-info">
                            <div class="user-name">User 3</div>
                            <div class="comment-time">1일 전</div>
                        </div>
                    </div>

                    <div class="comment-body">
                        <img src="resources/images/너의이름은.jpg" alt="Movie Poster" class="comment-poster">
                        <div>
                            <h3>너의이름은</h3>
                            <p>'너의 이름은'은 탄탄한 스토리와 눈부신 영상미, 감동적인 감결의 특별한 여정으로 안내합니다.</p>
                            
                            <!-- 좋아요 버튼 (내용 밑에 출력) -->
                            <div class="actions">
                                <button class="action-btn">
                                    좋아요 <span class="like-count">10</span> <i class="fas fa-heart"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script>
document.querySelectorAll('.action-btn').forEach(button => {
    button.addEventListener('click', function() {
        const heartIcon = button.querySelector('i');
        const likeCount = button.querySelector('.like-count');
        const currentLikes = parseInt(likeCount.textContent);
        
        // 좋아요 수 증가
        likeCount.textContent = currentLikes + 1;
        
        // 애니메이션 효과
        heartIcon.classList.add('animate');
        setTimeout(() => {
            heartIcon.classList.remove('animate');
        }, 300);
        
        // 코멘트 카드 올라가는 애니메이션
        const commentCard = button.closest('.comment-card');
        commentCard.style.transform = 'translateY(-10px)'; // 카드 위로 이동
        setTimeout(() => {
            commentCard.style.transform = 'translateY(0)'; // 원래 위치로 돌아오기
        }, 100);
    });
});
</script>

</body>
</html>
