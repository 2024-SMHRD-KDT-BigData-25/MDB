<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@page import="com.smhrd.model.ReviewInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>CINEM@GRAFO</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>



	<%
		String userEmail = (String) session.getAttribute("userEmail");
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
	    <div class="main-panel">
		<div class="content-wrapper">
			내 리뷰 목록 출력<br>
			<a href="exBoardForm.jsp">리뷰쓰기</a>
		</div>
			<table class="table table-bordered">
		     <thead>
		       <tr>
		        <th>작성자</th>
		        <th>번호</th>
		        <th>리뷰 내용</th>
		        <th>작성일</th>
		      </tr>
		   	 </thead>
		    <tbody>
		    
		    <% for (ReviewInfo rev : list) { %>
		      <tr>
		        <td><%=rev.getUser_email()%></td>		        
		        <td><%=rev.getUser_email()%></td>		        
		        <td><%= rev.getReview_cd() %></td>
		        <td><%= rev.getReview_content() %></td>
		        <td><%= rev.getView_dt() %></td>
		      </tr>
		    <% } %>
		      <tr>
		      	<td colspan="4"> 
		      	</td>
		      </tr>
		    </tbody>
		  </table>
		  
	</div>
    
    <div class="panel-body">
    	  <table class="table table-bordered">
		    <thead>
		      <tr>
		      	<th>번호</th>
		        <th>제목</th>
		        <th>작성자</th>
		        <th>작성일</th>
		      </tr>
		    </thead>
		    <tbody id="list">
		    
		    </tbody>
		  </table>
    	</div>
  	</div>
	</div>
	
</body>
</html>
