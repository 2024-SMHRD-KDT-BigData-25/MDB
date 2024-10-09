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
			</div>
		</div>
	</div>
</body>
</html>