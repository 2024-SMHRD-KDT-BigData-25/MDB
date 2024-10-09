<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINEM@GRAFO</title>
<style>
	.result-section {
		padding:40px;
	
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
      	<% String search_text =request.getParameter("search"); %>
      
      
      	
      	<div class="result-section">
                <h4>검색하신 <%=search_text  %>에 대한 검색 결과입니다.</h4>
                <br>
                <div class="review-card">
                  <h5>#mv_title</h5>
                  <p>#영화장르</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <h5>#mv_title</h5>
                  <p>#영화장르</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
                <div class="review-card">
                  <h5>#mv_title</h5>
                  <p>#영화장르</p>
                  <img src="#mv_poster" alt="Movie Poster" style="width:100px;">
                </div>
              </div>
      	
      	
      	
	  </div>
    <!-- page-body-wrapper ends -->
    </div>
  
  <!-- container-scroller ends -->
  </div>
  
</body>
</html>