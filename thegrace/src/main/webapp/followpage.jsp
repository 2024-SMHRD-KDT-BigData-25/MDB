<%@ page import="com.smhrd.model.FollowingInfo"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.UserInfo"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	
	<%
	UserInfo member = (UserInfo)session.getAttribute("member");
	String user_email = member.getUser_email();
	MovieDAO dao = new MovieDAO();
	%>
	
	<%
	List<UserInfo> UserList = dao.getUserList();
	for ( UserInfo m : UserList ) {
	%>
		<tr>
			<td><a href=><%=m.getNick() %></a></td>
			<td><button id="followBtn">follow</button></td>
		</tr>
		<div id="alert"></div>
	<% } %>
	
	<%
	String followerCnt = dao.followerCnt(user_email);
	System.out.println(followerCnt);
	%>
	
	<%
	String followeeCnt = dao.followeeCnt(user_email);
	System.out.println(followeeCnt);
	%>
	
	<%
	int allReviewRecmCnt = dao.allReviewRecmCnt(user_email);
	System.out.println(allReviewRecmCnt);
	%>

	<script src="resources/js/follow.js"></script>
</body>
</html>