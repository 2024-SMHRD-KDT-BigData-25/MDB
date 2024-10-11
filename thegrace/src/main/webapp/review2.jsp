<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <meta charset="UTF-8">
    <title>CINEM@GRAFO</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            width: 100vw;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Arial', sans-serif;
            overflow: hidden; /* 스크롤 방지 */
        }

        /* 비디오 배경 스타일 */
        .video-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .video-background video {
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: -1;
            object-fit: cover; /* 비디오의 비율 유지 */
        }

        /* 카드 스타일 */
        .card {
            background-color: rgba(240, 240, 240, 0.8); /* 비오는 날에 어울리는 색상 */
            color: black;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            width: 500px;
            max-height: 80vh; /* 카드 최대 높이를 화면 높이의 80%로 제한 */
            height: auto; /* 높이를 auto로 설정하여 내용에 맞게 조정 */
            max-width: 90%;
            overflow-y: auto; /* 스크롤 가능하게 설정 */
        }

        h4.card-description {
            margin-bottom: 20px;
            text-align: center;
            font-size: 1.5em;
            color: #333;
        }

        .btn {
            transition: background-color 0.3s, transform 0.2s, box-shadow 0.2s;
            background-color: #2f2f2f !important;
            color: white !important;
            border-radius: 5px;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            position: relative; /* 아이콘을 버튼 내부에 위치시키기 위해 필요 */
            display: flex; /* 아이콘과 텍스트 정렬을 위해 플렉스 사용 */
            align-items: center; /* 중앙 정렬 */
        }

        .btn i {
            margin-right: 5px; /* 아이콘과 텍스트 간 간격 조정 */
        }

        .btn:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 40px; /* 폼 그룹 간 간격 조정 (40px로 수정) */
        }

        .form-control {
            padding: 10px;
            margin-right: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 16px;
            flex: 1;
            transition: border-color 0.3s, box-shadow 0.3s; /* 부드러운 효과 */
        }

        .form-control:focus {
            border-color: #ff5722; /* 포커스된 입력 필드 테두리 색상 */
            box-shadow: 0 0 5px rgba(255, 87, 34, 0.5);
        }

        .rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            position: relative;
            font-size: 1.5em;
        }

        .rating input {
            display: none;
        }

       
    .rating label {
        color: #888; /* 기본 색상 변경 */
        cursor: pointer;
        padding: 0 5px;
        transition: color 0.3s, text-shadow 0.3s; /* 부드러운 효과 */
    }

        .rating input:checked ~ label,
        .rating input:hover ~ label {
            color: #f5b301;
        }

        .rating label:hover,
        .rating label:hover ~ label {
            color: #f5b301;
        }

        .rating-text {
            font-size: 1em;
            color: #444;
            text-align: center;
            margin-top: 5px;
        }

        .button-group {
            display: flex; /* 버튼을 수평으로 정렬 */
            justify-content: space-between; /* 버튼 간 공간을 분배 */
            margin-top: 20px; /* 버튼 간 간격 조정 */
        }

        @media (max-width: 600px) {
            .card {
                width: 90%;
                padding: 20px;
            }

            h4.card-description {
                font-size: 1.2em;
            }
        }
    </style>
</head>

<body>
    <!-- 비디오 배경 -->
    <div class="video-background">
        <video autoplay muted loop>
            <source src="resources/videos/rain.mp4" type="video/mp4">
        </video>
    </div>

    <div class="container-fluid page-body-wrapper">
        <div class="comment-section">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-description">영화에 대한 솔직한 평가를 남겨주세요.</h4>
                    <form class="forms-sample">
                        <!-- 영화 코드 입력 -->
                        <div class="form-group">
                            <label for="exampleInputName1"><i class="fas fa-film"></i> 영화코드</label>
                            <input type="text" class="form-control" id="exampleInputName1" readonly>
                            <button type="button" class="btn"><i class="fas fa-search"></i>영화 찾기</button>
                        </div>

                        <!-- 영화 평점 입력 -->
                        <div class="form-group">
                            <label for="exampleInputEmail3"><i class="fas fa-star"></i> 영화평점</label>
                            <div class="rating">
                                <input type="radio" name="stars" id="star5" value="5">
                                <label for="star5" title="5 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" name="stars" id="star4" value="4">
                                <label for="star4" title="4 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" name="stars" id="star3" value="3">
                                <label for="star3" title="3 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" name="stars" id="star2" value="2">
                                <label for="star2" title="2 stars"><i class="fas fa-star"></i></label>
                                <input type="radio" name="stars" id="star1" value="1">
                                <label for="star1" title="1 star"><i class="fas fa-star"></i></label>
                            </div>
                            <div class="rating-text">평점을 선택하세요: 1 ~ 5</div>
                        </div>

                        <!-- 리뷰 내용 입력 -->
                        <div class="form-group">
                            <label for="exampleTextarea1"><i class="fas fa-comment"></i> 리뷰내용</label>
                            <textarea class="form-control" id="exampleTextarea1" rows="6" placeholder="리뷰를 작성하세요"></textarea>
                        </div>

                        <!-- 관람일자 입력 -->
                        <div class="form-group">
                            <label for="watchDate"><i class="fas fa-calendar-alt"></i> 관람일자</label>
                            <input type="date" class="form-control" id="watchDate">
                        </div>

                        <div class="form-group">
                            <label for="openStatus"><i class="fas fa-eye"></i> 공개 여부</label>
                            <div>
                                <input type="radio" name="openStatus" id="open" value="공개">
                                <label for="open">공개</label>
                                <input type="radio" name="openStatus" id="private" value="비공개">
                                <label for="private">비공개</label>
                            </div>
                        </div>

                        <!-- 이미지 첨부 -->
                      <!-- 이미지 첨부 부분 수정 -->
<div class="form-group">

    <div class="input-group">
        <input type="file" name="img[]" id="fileUpload" class="form-control" style="display: none;">
        <button class="file-upload-browse btn" onclick="document.getElementById('fileUpload').click()">
            <i class="fas fa-upload"></i> Upload
        </button>
    </div>
</div>

                        <div class="form-group">
                            <label for="reviewSentiment"><i class="fas fa-smile"></i> 리뷰 감정</label>
                            <div>
                                <input type="radio" name="sentiment" id="positive" value="긍정">
                                <label for="positive">긍정</label>
                                <input type="radio" name="sentiment" id="negative" value="부정">
                                <label for="negative">부정</label>
                            </div>
                        </div>

                        <!-- 버튼 그룹 -->
                        <div class="button-group">
                            <button type="submit" class="btn btn-primary mr-2"><i class="fas fa-paper-plane"></i>작성</button>
                            <button type="reset" class="btn btn-light"><i class="fas fa-undo"></i>리셋</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
