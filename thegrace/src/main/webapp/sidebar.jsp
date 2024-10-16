<%@page import="com.smhrd.model.MovieDAO"%>
<%@page import="com.smhrd.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <title>CINEM@GRAFO</title>
</head>
<body>
      <%
   UserInfo member_side = (UserInfo)session.getAttribute("member");
   
   String user_email_side = member_side.getUser_email();
   MovieDAO dao_side = new MovieDAO();
   %>

   <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar"> <!-- 사이드바 영역 -->
        <div class="user-profile">
          <div class="user-image">
            <img src="resources/images/<%=member_side.getPf_img() %>">
          </div>
          <div class="user-name">
              <%=member_side.getNick() %>
          </div>
          <div class="user-designation">
              <%=member_side.getUser_email() %>
          </div>
        </div>
                <ul class="nav">
          <li class="nav-item">
            <a class="nav-link" href="main.jsp">
              <i class="icon-box menu-icon"></i>
              <span class="menu-title">Main</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="myReview.jsp">
              <i class="icon-file menu-icon"></i>
              <span class="menu-title">Review</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="myPage.jsp">
              <i class="icon-pie-graph menu-icon"></i>
              <span class="menu-title">My Grafo</span>
            </a>
          </li>
        </ul>
      </nav>
      

</body>
</html>