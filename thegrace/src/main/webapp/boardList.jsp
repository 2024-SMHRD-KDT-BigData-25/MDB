<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINEM@GRAFO</title>
    <style>
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
        <h2>게시판</h2>
        <button class="write-button">글쓰기</button> <!-- 글쓰기 버튼 -->
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>추천</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td class="title-link" onclick="location.href='page1.html'">첫 번째 게시글입니다.</td>
                    <td>홍길동</td>
                    <td>2024-10-01</td>
                    <td>100</td>
                    <td>10</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td class="title-link" onclick="location.href='page2.html'">두 번째 게시글입니다.</td>
                    <td>김철수</td>
                    <td>2024-10-02</td>
                    <td>80</td>
                    <td>5</td>
                </tr>
                <!-- 추가 게시글은 여기에서 계속 추가할 수 있습니다. -->
            </tbody>
        </table>
        <div class="pagination">
            <button>이전</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>다음</button>
        </div>
    </div>
    </div>
    
  </div>

</body>
</html>