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
    <script>
        $(document).ready(function() {
            // 팔로우 버튼 클릭 이벤트
            $('.followBtn').on('click', function() {
                const followee = $(this).data('followee');
                const button = $(this);
                
                $.ajax({
                    url: '/thegrace/Follow', // 팔로우 요청을 처리할 URL
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ followee: followee }),
                    success: function(response) {
                        if (response.available) {
                            button.hide(); // Follow 버튼 숨김
                            button.siblings('.unfollowBtn').show(); // Unfollow 버튼 표시
                        }
                    },
                    error: function(jqXHR) {
                        console.error("Error:", jqXHR);
                    }
                });
            });

            // 언팔로우 버튼 클릭 이벤트
            $('.unfollowBtn').on('click', function() {
                const followee = $(this).data('followee');
                const button = $(this);
                
                $.ajax({
                    url: '/thegrace/Unfollow', // 언팔로우 요청을 처리할 URL
                    type: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify({ followee: followee }),
                    success: function(response) {
                        if (response.available) {
                            button.hide(); // Unfollow 버튼 숨김
                            button.siblings('.followBtn').show(); // Follow 버튼 표시
                        }
                    },
                    error: function(jqXHR) {
                        console.error("Error:", jqXHR);
                    }
                });
            });
        });
    </script>
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

</body>
</html>
