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
