<%@page import="com.smhrd.model.ReviewInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Review</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
	<style>

        .container {
            max-width: 800px; /* 최대 너비 설정 */
            margin: 0 auto; /* 중앙 정렬 */
            background-color: #fff;
            border-radius: 8px;
            padding: 20px; /* 패딩 */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: left; /* 제목 왼쪽 정렬 */
            margin-bottom: 20px; /* 아래쪽 여백 */
        }
        .container > .write-button {
            float: right; /* 오른쪽 정렬 */
            padding: 10px 20px; /* 패딩 */
            background-color: #2f2f2f; /* 버튼 색상 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 모양 변경 */
            text-align: center; /* 중앙 정렬 */
            transition: background-color 0.3s; /* 부드러운 전환 */
            margin-bottom:10px;
        }
        .write-button:hover {
            background-color: #1f1f1f; /* 호버 시 색상 변경 */
        }
        table {
            width: 100%; /* 테이블 너비 100% */
            border-collapse: collapse; /* 테두리 겹침 제거 */
        }
        th, td {
            border: none; /* 세로선 제거 */
            padding: 10px; /* 내부 여백 */
            text-align: left; /* 왼쪽 정렬 */
        }
        th {
            background-color: #f2f2f2; /* 헤더 배경색 */
        }
        .title-link {
            cursor: pointer; /* 커서 모양 변경 */
            color: #007BFF; /* 제목 색상 */
            text-decoration: underline; /* 밑줄 */
        }
        .pagination {
            text-align: center; /* 중앙 정렬 */
            margin-top: 20px; /* 위쪽 여백 */
        }
        .pagination button {
            margin: 0 5px; /* 좌우 여백 */
            padding: 5px 10px; /* 패딩 */
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 모양 변경 */
        }
        .pagination button:hover {
            background-color: #f2f2f2; /* 호버 시 색상 변경 */
        }
        .image-preview {
            max-width: 100%; /* 최대 너비 100% */
            margin-top: 10px; /* 위쪽 여백 */
        }
        
                h2 {
            text-align: left; /* 제목 왼쪽 정렬 */
            margin-bottom: 20px; /* 아래쪽 여백 */
        }
        .write-button {
            float: right; /* 오른쪽 정렬 */
            padding: 10px 20px; /* 패딩 */
            background-color: #4CAF50; /* 버튼 색상 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 모양 변경 */
            text-align: center; /* 중앙 정렬 */
            transition: background-color 0.3s; /* 부드러운 전환 */
        }
        .write-button:hover {
            background-color: #45a049; /* 호버 시 색상 변경 */
        }
        table {
            width: 100%; /* 테이블 너비 100% */
            border-collapse: collapse; /* 테두리 겹침 제거 */
        }
        th, td {
            border: none; /* 세로선 제거 */
            padding: 10px; /* 내부 여백 */
            text-align: left; /* 왼쪽 정렬 */
        }
        th {
            background-color: #f2f2f2; /* 헤더 배경색 */
        }
        .title-link {
            cursor: pointer; /* 커서 모양 변경 */
            color: #007BFF; /* 제목 색상 */
            text-decoration: underline; /* 밑줄 */
        }
        .pagination {
            text-align: center; /* 중앙 정렬 */
            margin-top: 20px; /* 위쪽 여백 */
        }
        .pagination button {
            margin: 0 5px; /* 좌우 여백 */
            padding: 5px 10px; /* 패딩 */
            border: 1px solid #ddd; /* 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 모양 변경 */
        }
        .pagination button:hover {
            background-color: #f2f2f2; /* 호버 시 색상 변경 */
        }
        .form-container {
            display: none; /* 처음에는 숨김 */
            margin-bottom: 20px; /* 아래쪽 여백 */
            border: 1px solid #ddd; /* 테두리 */
            padding: 10px; /* 패딩 */
            border-radius: 5px; /* 모서리 둥글게 */
            background-color: #f9f9f9; /* 배경색 */
        }
        .form-container input, .form-container textarea {
            width: 100%; /* 너비 100% */
            padding: 10px; /* 패딩 */
            margin: 5px 0; /* 여백 */
            border: 1px solid #ccc; /* 테두리 */
            border-radius: 5px; /* 모서리 둥글게 */
        }
        .form-container button {
            background-color: #007BFF; /* 버튼 색상 */
            color: white; /* 버튼 텍스트 색상 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 모서리 둥글게 */
            cursor: pointer; /* 커서 모양 변경 */
            padding: 10px; /* 패딩 */
            transition: background-color 0.3s; /* 부드러운 전환 */
        }
        .form-container button:hover {
            background-color: #0056b3; /* 호버 시 색상 변경 */
        }
        .image-preview {
            max-width: 100%; /* 최대 너비 100% */
            margin-top: 10px; /* 위쪽 여백 */
        }
        
        /* 카드 스타일 */
        .modal > .card {
            top:10%; 
            background-color: #ffffff; 
            color: black;
            padding-top:10px;
            padding-bottom: 50px;
            padding-left: 30px;
            padding-right: 30px;
            border-radius: 20px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.3);
            width: 800px;
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
            justify-content:center;
        }
        
        .button-group > button {
            margin: 10px; /* 버튼 간 간격 조정 */
            margin-bottom: 20px;
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
        

		.modal {
		    position:absolute;
            display:none;
            justify-content: center;
            top:0;
            left:0;
            width:100%;
            height:100%;
            background-color: rgba(0,0,0,0.4);
		
		}
		
		.form-group > label {
			width:90px;
		}

		
		.card-body > h5 {
			
		}
		
		.x-button > img {
			float:right;
			width:60px;
		}
        
        .x-button {
        float:right;
        	width:100%;
        }
        
    </style>
</head>
<body>

	<%
		String userEmail = (String) session.getAttribute("user_email");
		MovieDAO dao = new MovieDAO();
		List<ReviewInfo> list = dao.getReview(); // -> 여기서 getList()는 DAO의 메서드 이름이다
		System.out.println("리뷰 개수: " + list.size());
	%>

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
   		 <div class="modal">
   		 	<div class="card">
                <div class="card-body">
                	<div class="x-button"><img src="resources/images/x-button.png" class="modal-close"></div>
                    <p>영화 감상을 남기고 GRAFO에서 그 기록을 공유하세요.<br><br></p>
                    <form class="forms-sample">
                        <!-- 영화 코드 입력 -->
                        <div class="form-group">
                            <label for="exampleInputName1"><i class="fas fa-film"></i> 영화코드</label>
                            <input type="text" class="form-control" id="exampleInputName1" readonly>
                            <button type="button" class="btn"><i class="fas fa-search"></i>영화 찾기</button>
                        </div>
						<input type="text" name="mv_cd"  required hidden>
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
							<label for="img"><i class="fas fa-upload"></i>이미지</label>
							<div>
						        <input type="file" name="img[]" id="fileUpload" class="form-control">
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
   
   
        <h2>나의 리뷰 보기</h2>
        <button class="write-button modal-open-btn" onclick="toggleForm()">글쓰기</button>
        <table id="postTable">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>작성자</th>
                    <th>리뷰내용</th>                    
                    <th>작성일</th>
                </tr>
            </thead>
            <tbody id="postBody">
                <!-- 게시글이 여기 추가됩니다. -->
                <% for (ReviewInfo rev : list) { %>
		      <tr>
		        <td><%=rev.getReview_cd()%></td>		        
		        <td><%=rev.getUser_email()%></td>
		        <td><%=rev.getReview_content()%></td>		        		        
		        <td><%= rev.getView_dt() %></td>
		      </tr>
		    <% } %>
		    
		    
            </tbody>
        </table>
        <div class="pagination" id="pagination">
            <!-- 페이지 버튼이 여기 추가됩니다. -->
        </div>
    </div>

    <script>
        let posts = []; // 게시글 배열
        const postsPerPage = 15; // 페이지당 게시글 수
        let currentPage = 1; // 현재 페이지

        function toggleForm() {
            const formContainer = document.getElementById('formContainer');
            formContainer.style.display = formContainer.style.display === 'none' ? 'block' : 'none';
        }

        function previewImage(event) {
            const imagePreview = document.getElementById('imagePreview');
            const file = event.target.files[0];
            const reader = new FileReader();

            reader.onload = function() {
                imagePreview.src = reader.result;
                imagePreview.style.display = 'block'; // 이미지 미리보기 표시
            }

            if (file) {
                reader.readAsDataURL(file);
            } else {
                imagePreview.src = '';
                imagePreview.style.display = 'none'; // 이미지 미리보기 숨김
            }
        }

        function addPost(title, author, content, image) {
            const postCount = posts.length + 1; // 현재 게시글 수
            const newPost = {
                id: postCount,
                title: title,
                author: author,
                content: content,
                image: image,
                date: new Date().toLocaleDateString(),
                views: Math.floor(Math.random() * 100),
                likes: Math.floor(Math.random() * 20)
            };
            posts.push(newPost); // 새 게시글 추가
            renderPosts(); // 게시글 렌더링
        }

        function submitPost() {
            const title = document.getElementById('postTitle').value;
            const author = document.getElementById('postAuthor').value;
            const content = document.getElementById('postContent').value;
            const image = document.getElementById('postImage').files[0]; // 이미지 파일

            addPost(title, author, content, image);

            // 입력 필드 초기화
            document.getElementById('postTitle').value = '';
            document.getElementById('postAuthor').value = '';
            document.getElementById('postContent').value = '';
            document.getElementById('postImage').value = ''; // 파일 초기화
            document.getElementById('imagePreview').src = ''; // 미리보기 초기화
            document.getElementById('imagePreview').style.display = 'none'; // 미리보기 숨김
        }

        function renderPosts() {
            const postBody = document.getElementById('postBody');
            postBody.innerHTML = ''; // 기존 게시글 초기화

            const start = (currentPage - 1) * postsPerPage;
            const end = start + postsPerPage;
            const paginatedPosts = posts.slice(start, end); // 현재 페이지에 해당하는 게시글

            paginatedPosts.forEach(post => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${post.id}</td>
                    <td class="title-link" onclick="location.href='post${post.id}.html'">${post.title}</td>
                    <td>${post.author}</td>
                    <td>${post.date}</td>
                    <td>${post.views}</td>
                    <td>${post.likes}</td>
                `;
                postBody.appendChild(row);
            });

            renderPagination(); // 페이지네이션 렌더링
        }

        function renderPagination() {
            const pagination = document.getElementById('pagination');
            pagination.innerHTML = ''; // 기존 페이지 버튼 초기화

            const pageCount = Math.ceil(posts.length / postsPerPage); // 총 페이지 수

            for (let i = 1; i <= pageCount; i++) {
                const button = document.createElement('button');
                button.innerText = i;
                button.onclick = function() {
                    currentPage = i; // 현재 페이지 변경
                    renderPosts(); // 게시글 렌더링
                };
                pagination.appendChild(button);
            }
        }

        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.modal-open-btn');

        btnOpenModal.addEventListener("click", ()=>{
            modal.style.display="flex";
        });

        const btnCloseModal=document.querySelector('.modal-close');

        btnCloseModal.addEventListener("click", ()=>{
            modal.style.display="none";
        });
        
    </script>
    </div>
    
  </div>

</body>
</html>