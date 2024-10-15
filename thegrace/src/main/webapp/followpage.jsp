<%@page import="com.smhrd.model.FollowPf"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.UserInfo"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>팔로우 페이지</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        .followBtn {
            background-color: green; /* 초록색 */
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
        .unfollowBtn {
            background-color: red; /* 빨간색 */
            color: white;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
        }
    </style>

</head>
<body>

    <%
    UserInfo member = (UserInfo)session.getAttribute("member");
    String user_email = member.getUser_email();
    MovieDAO dao = new MovieDAO();
    %>
    
    <h3>팔로우 사용자 목록</h3>
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

    <h3>팔로우 중인 사용자 목록</h3>
    <table>
        <%
        List<FollowPf> followeeList = dao.getFollowee(user_email);
        for ( FollowPf m : followeeList ) {
        %>
            <tr>
                <td><%=m.getFollowee() %></td>
                <td>
                    <button class="unfollowBtn" data-followee="<%=m.getFollowee()%>">Unfollow</button>
                    <button class="followBtn" data-followee="<%=m.getFollowee()%>" style="display:none;">Follow</button>
                </td>
            </tr>
        <% } %>
    </table>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="follow.js"></script>
    <script>
	    document.addEventListener("DOMContentLoaded", function() {
	        const followBtns = document.querySelectorAll('.followBtn');
	        const unfollowBtns = document.querySelectorAll('.unfollowBtn');
            const userId = '<%= user_email %>'; // 세션에서 userID 가져오기

            // 페이지 로드 시 팔로우 상태 확인 (userId와 각 followee(targetID)로 확인)
            followBtns.forEach(button => {
                const followee = button.getAttribute('data-followee');
                checkFollowStatus(userId, followee, button);  // 팔로우 상태 확인
            });
	        
	        followBtns.forEach(button => {
	            button.addEventListener('click', function() {
	                const followee = this.getAttribute('data-followee');
	                follow(followee, button);
	            });
	        });
	        
	        unfollowBtns.forEach(button => {
	            button.addEventListener('click', function() {
	                const followee = this.getAttribute('data-followee');
	                unfollow(followee, button);
	            });
	        });
	    });
    </script>
</body>
</html>
