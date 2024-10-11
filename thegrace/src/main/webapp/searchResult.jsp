<%@page import="com.smhrd.model.MovieInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CINEM@GRAFO</title>
<style>
.main-panel{

align-items:center;

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
      	<% String search_text =request.getParameter("search");
      	System.out.print(search_text);
      	MovieDAO dao = new MovieDAO();
      	List<MovieInfo> resultList = dao.movieSearching(search_text);
      	%>
      
      
      	
      	<div class="result-section">
                <h4>검색하신 <%=search_text  %>에 대한 검색 결과입니다.</h4>
                <br>
                <% for (MovieInfo mv:resultList) { %>
                        <div class="comment-body result-content">
                            <img src="<%=mv.getMv_poster() %>" alt="Movie Poster" class="comment-poster">
                            <div>
			                  <h3><%=mv.getMv_title() %></h3>
			                  <h5><%=mv.getMv_title_eng() %></h5>
			                  <p><%=mv.getOpen_year() %> · <%=mv.getMv_genre() %> · <%=mv.getMv_country() %> · <%=mv.getPlay_time() %>분</p>
                            </div>
                        </div>
                <% } %>
          </div>

      	
      	
	  </div>
    <!-- page-body-wrapper ends -->
    </div>
  
  <!-- container-scroller ends -->
  </div>
  
</body>
</html>