<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>CINEM@GRAFO</title>
</head>
<body>

<style>
.comment-poster {
    width: 80px; /* 이미지 너비 */
    height: auto; /* 자동 높이 조정 */
    border-radius: 4px; /* 모서리 둥글게 */
    margin-right: 10px; /* 이미지와 텍스트 간의 간격 추가 */
}
.comment-section {
    display: flex;
    flex-direction: column;
    gap: 20px;
    margin: 20px auto;
    padding: 0 10px; /* 좌우 패딩 추가 */
    margin-left: 0; /* 왼쪽에 더 붙이기 */
}
/* Comment Card */
.comment-card {
    border: 1px solid #ddd;
    border-radius: 16px;
    padding: 15px;
    background-color: white;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    width: 100%; /* Ensure full width */
}

/* Comment User */
.comment-user {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
}

.comment-user img {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}

.user-info {
    display: flex;
    flex-direction: column;
}

.user-name {
    font-weight: bold;
}

.comment-time {
    color: gray;
    font-size: 14px;
}

.container {
    margin: 0 auto; /* 전체 컨테이너 중앙 정렬 */
    padding: 20px; /* 상하 패딩 추가 */
}
.comment-body {
    display: flex; /* 플렉스 박스를 사용하여 가로로 정렬 */
    align-items: center; /* 이미지와 텍스트의 수직 정렬을 중앙에 맞춤 */
    height: auto; /* 높이를 자동 조정 */
    padding: 10px;
    border: 1px solid #ddd;
    overflow-y: auto; /* 내용이 넘치면 스크롤 추가 */
    margin-left: 10px;
}
.comment-body p {
    font-size: 16px;
    color: #333;
    margin-bottom: 10px;
}

.comment-poster {
    width: 80px;
    height: auto;
    border-radius: 4px;
}

/* Comment Footer */
.comment-footer {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.actions {
    display: flex;
    align-items: center;
}

.actions .action-btn {
    margin-right: 10px;
    border: none;
    background-color: transparent;
    cursor: pointer;
    font-size: 14px;
    color: #666;
}

.actions i.fa-heart {
    color: red;
    font-size: 18px;
    margin-left: 5px; /* 텍스트와 하트 간의 간격 */
}

.share-btn {
    font-size: 20px;
    border: none;
    background-color: transparent;
    cursor: pointer;
    color: #666;
}

/* Additional Spacing */
.gap-10 {
    margin-bottom: 10px;
}
.comment-section h1 {
    color: #000000; /* 검정색 */
    font-weight: bold; /* 굵은 폰트 */
    font-size: 24px; /* 글씨 크기 설정 (필요시 변경 가능) */
}

.comment-section h3 {
    color: #000000; /* 검정색 */
    font-weight: bold; /* 굵은 폰트 */
    font-size: 24px; /* 글씨 크기 설정 (필요시 변경 가능) */
}

</style>

<div class="container-scroller">
    <!-- 상단바 불러오기 -->
    <%@ include file="navbar.jsp" %>
    
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <%@ include file="sidebar.jsp" %>

        <div class="comment-section">
            <div class="comment-header">
                <br>
                <div class="comment-section">
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
                                        좋아요 3 <i class="fas fa-heart"></i>
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
                                        좋아요 5 <i class="fas fa-heart"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 추가적인 리뷰 카드에도 동일하게 추가 -->
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
                                        좋아요 10 <i class="fas fa-heart"></i>
                                    </button>
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
