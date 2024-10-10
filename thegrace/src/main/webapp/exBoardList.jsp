<%@page import="com.smhrd.model.ReviewInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
	      
	      	<!-- partial -->
	      	<div class="main-panel">
		      	<div class="content-wrapper">
					내 리뷰 목록 출력<br>
					<a href="exBoardForm.jsp">리뷰쓰기</a>
				</div>
					<table class="table table-bordered">
		    <thead>
		      <tr>
		        <th>번호</th>
		        <th>리뷰 내용</th>
		        <th>작성자</th>
		        <th>작성일</th>
		      </tr>
		    </thead>
		    <tbody>
		    <% for (ReviewInfo R:) { %>
		    <!-- JSP에서 list라는 MyBoard 객체의 리스트를 순회하면서, 각 객체를 b이라는 변수에 저장하고, 
			그에 따라 반복문 안의 코드를 실행하는 구문이다. -->
		      <tr>
		        <td><%= b.getIdx() %></td>
		        <td><a href="boardcontent.jsp?idx=<%=b.getIdx()%>"><%= b.getTitle() %></a></td>
		        <td><%= b.getWriter() %></td>
		        <td><%= b.getIndate() %></td>
		      </tr>
		    <% } %>
		      <tr>
		      	<td colspan="4"> 
		      		<button class="btn btn-sm btn-success" onclick="location.href='boardform.jsp'">글작성</button>
		      		<button class="btn btn-sm btn-warning" onclick="window.open('chat.jsp', '채팅방', 'width=500, height=700, top=50, left=500')">채팅하기</button>
		      		<!-- window.open('파일이름', '식별자', 'width=?, height=?') -->
		      		<!-- onclick은 버튼을 클릭했을 때 작동하는 속성 -->
		      	</td>
		      </tr>
		    </tbody>
		  </table>
				<div>
					<button class="btn btn-sm btn-warning">리뷰 삭제</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>