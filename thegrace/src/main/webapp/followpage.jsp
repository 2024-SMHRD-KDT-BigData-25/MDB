<%@page import="com.smhrd.model.FollowPf"%>
<%@page import="java.util.ArrayList"%>
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>

	
	<%
	UserInfo member = (UserInfo)session.getAttribute("member");
	String user_email = member.getUser_email();
	MovieDAO dao = new MovieDAO();
	%>
	
	<table>
	<%
	List<UserInfo> userList = dao.getUserList();
	for ( UserInfo u : userList ) {
	%>
		<tr>
			<td><%=u.getNick() %></td>
			<td>
			<button class="followBtn" data-followee="<%=u.getUser_email()%>">Follow</button>
			<button class="unfollowBtn" data-followee="<%=u.getUser_email()%>" style="display:none;">Unfollow</button>
			</td>
		</tr>
	<% } %>
	</table>
	<table>
	<%
	List<FollowPf> followeeList = dao.getFollowee(user_email);
	for ( FollowPf m : followeeList ) {
	%>
		<tr>
			<td><%=m.getFollowee() %></td>
			<td>
			<button class="followBtn" data-followee="<%=m.getFollowee()%>">Follow</button>
			</td>
		</tr>
	<% } %>
	</table>
	

	<%
	String followerCnt = dao.followerCnt(user_email);
	%>
	
	<%
	String followeeCnt = dao.followeeCnt(user_email);
	%>
	
	<%
	int allReviewRecmCnt = dao.allReviewRecmCnt(user_email);
	%>

	<script src="resources/js/follow.js"></script>
</body>
</html>