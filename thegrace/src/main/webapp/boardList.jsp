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
            padding: 20px;
        }
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
    </style>
</head>

<body>
 <div class="container">
        <h2>게시판</h2>
        <div class="form-container" id="formContainer">
            <h3>글쓰기</h3>
            <input type="text" id="postTitle" placeholder="제목을 입력하세요" required>
            <input type="text" id="postAuthor" placeholder="작성자를 입력하세요" required>
            <textarea id="postContent" rows="4" placeholder="내용을 입력하세요" required></textarea>
            <input type="file" id="postImage" accept="image/*" onchange="previewImage(event)">
            <img id="imagePreview" class="image-preview" src="" alt="이미지 미리보기" style="display:none;">
            <button onclick="submitPost()">제출</button>
        </div>
        <button class="write-button" onclick="toggleForm()">글쓰기</button>
        <table id="postTable">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>추천</th>
                    <th>이미지</th>
                </tr>
            </thead>
            <tbody id="postBody">
                <!-- 게시글이 여기 추가됩니다. -->
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
                    <td>${post.image ? `<img src="${URL.createObjectURL(post.image)}" class="image-preview" style="max-width: 100px;">` : ''}</td>
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

        // 초기 게시글 추가 (예시)
        for (let i = 0; i < 30; i++) {
            addPost(`게시글 ${i + 1}`, `작성자 ${i + 1}`, `내용 ${i + 1}`, null);
        }
    </script>
    </div>
    
  </div>

</body>
</html>