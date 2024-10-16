<%@page import="com.smhrd.model.MovieDAO"%>
<%@page import="com.smhrd.model.UserInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CINEM@GRAFO</title>
  <!-- base:css -->
  <link rel="stylesheet" href="resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="resources/vendors/feather/feather.css">
  <link rel="stylesheet" href="resources/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- plugin css for this page -->
  <link rel="stylesheet" href="resources/vendors/flag-icon-css/css/flag-icon.min.css"/>
  <link rel="stylesheet" href="resources/vendors/font-awesome/css/font-awesome.min.css">
  <link rel="stylesheet" href="resources/vendors/jquery-bar-rating/fontawesome-stars-o.css">
  <link rel="stylesheet" href="resources/vendors/jquery-bar-rating/fontawesome-stars.css">
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="resources/css/style.css">
  <link rel="stylesheet" href="resources/css/style2.css">
  <link rel="stylesheet" href="resources/css/fonts.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="resources/images/favicon.png" />
  
  <style>
  	body {
		font-family: 'S-CoreDream-3Light', sans-serif;
		background-color: #f4f7fa;
	}
	


        /* 모달 스타일 */
        .modals {
            display: none; /* 기본적으로 숨김 */
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 10;
        }

        .chat-container {
            width: 90%;
            max-width: 600px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 20px;
            box-shadow: 0 8px 35px rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: column;
            height: 80vh;
            overflow: hidden;
            z-index: 1;
        }

        .chat-header {
            display: flex;
            align-items: center;
            padding: 15px;
            background-color: #6c757d;
            border-top-left-radius: 20px;
            border-top-right-radius: 20px;
            color: white;
        }

        .chat-header img {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 15px;
        }

        .chat-header h2 {
            margin: 0;
            flex: 1;
            font-size: 1.5em;
        }

        .chat-body {
            padding: 20px;
            flex: 1;
            overflow-y: auto;
            background-color: #f8f9fa;
            position: relative;
            overflow-x: hidden; /* 가로 스크롤 제거 */
        }

        .message {
            display: flex;
            align-items: flex-start;
            margin-bottom: 20px;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.5s forwards;
        }

        .message.user {
            justify-content: flex-end; /* 사용자의 메시지 오른쪽 정렬 */
        }

        .message.receiver {
            justify-content: flex-start; /* 수신자의 메시지 왼쪽 정렬 */
        }

        .message-content {
            background-color: #28a745;
            border-radius: 15px;
            padding: 15px;
            max-width: 70%;
            position: relative;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-left: 10px !important; /* !important 추가 */
        }

        .message.receiver .message-content {
            background-color: #f1f1f1; /* 수신자 메시지의 배경색 */
            margin-left: 0 !important; /* 왼쪽 정렬로 인한 여백 제거 */
            margin-right: 10px !important; /* 사용자 메시지와의 간격 */
        }

        .message.user .message-content {
            background-color: #B2E0D4; /* 사용자 메시지의 배경색 */
            color: white; /* 사용자 메시지 텍스트 색상 */
        }

        .message-time {
            font-size: 0.75em;
            color: #888;
            margin-right: 5px !important; /* 메시지와 시간 사이 간격 */
        }

        .read-receipt {
            font-size: 0.75em;
            color: #007bff;
            cursor: pointer; /* 클릭 가능 표시 */
            margin-top: 5px; /* 메시지 아래쪽에 여백 추가 */
        }

        .input-area {
            display: flex;
            padding: 15px;
            background-color: #ffffff;
            border-top: 1px solid #ddd;
        }

        .input-area input {
            flex: 1;
            padding: 10px 15px;
            border: 1px solid #ddd;
            border-radius: 25px;
            margin-right: 10px;
            font-size: 1em;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .input-area button {
            padding: 10px 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 25px;
            font-size: 1em;
            cursor: pointer;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: background-color 0.3s, transform 0.3s;
        }

        .input-area button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message-info {
            display: flex;
            flex-direction: column;
            align-items: flex-end !important; /* 오른쪽 정렬 */
            margin-left: 10px !important; /* 메시지 내용과의 간격 */
        }
	
  </style>
  
</head>
<body>
	
	<%
	UserInfo member = (UserInfo)session.getAttribute("member");
	String user_email = member.getUser_email();
	MovieDAO dao = new MovieDAO();
	member = dao.userLoad(user_email);
	session.setAttribute("member", member);
	session.setMaxInactiveInterval(60*60); 
	%>
	    <!-- partial:partials/_navbar.html -->
    <nav class="navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row"> <!-- 상단바 -->
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="main.jsp"><img src="resources/images/logo-w.png" alt="logo"/></a>
        <a class="navbar-brand brand-logo-mini" href="main.jsp"><img src="resources/images/logo-mini.png" alt="logo"/></a>
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-center justify-content-end">
        <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
          <span class="icon-menu"></span>
        </button>
        <ul class="navbar-nav mr-lg-2">
          <li class="nav-item nav-search d-none d-lg-block">
            <div class="input-group">
              <div class="input-group-prepend">
                <span class="input-group-text" id="search">
                  <i class="icon-search"></i>
                </span>
              </div>
              <form action="searchResult.jsp">
              	<input type="text" class="form-control" name="search" placeholder="리뷰가 궁금한 영화를 검색해 보세요!" size=50 aria-label="search" aria-describedby="search">
			  </form>            
            </div>
          </li>
        </ul>
        <ul class="navbar-nav navbar-nav-right">	
          <li class="nav-item dropdown d-flex">
            <a class="nav-link count-indicator dropdown-toggle d-flex justify-content-center align-items-center" id="messageDropdown" href="#" data-toggle="dropdown">
              <i class="icon-air-play mx-0"></i>
            </a>
            <div style="height:40px;" class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="messageDropdown">
              <a class="dropdown-item preview-item">
				<button id="openChat" style="position: absolute; padding: 5px; border: none; border-radius: 5px; background-color: #ffffff; color: black; cursor: pointer;">
				    팀장과 채팅
				</button>
              </a>
            </div>
          </li>
          <li class="nav-item dropdown d-flex mr-4 ">
            <a class="nav-link count-indicator dropdown-toggle d-flex align-items-center justify-content-center" id="notificationDropdown" href="#" data-toggle="dropdown">
              <i class="icon-cog"></i>
            </a>
            <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list" aria-labelledby="notificationDropdown">
              <p class="mb-0 font-weight-normal float-left dropdown-header">Settings</p>
              <a class="dropdown-item preview-item">               
                  <i class="icon-head"></i> Profile
              </a>
              <a class="dropdown-item preview-item" href="Logout">
                  <i class="icon-inbox"></i> Logout
              </a>
            </div>
          </li>		
        </ul>
        <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="icon-menu"></span>
        </button>
      </div>
    </nav> <!-- 상단바 ends -->
    
    
<!-- 모달 팝업 -->
<div class="modals" id="chatModal">
    <div class="chat-container">
        <div class="chat-header">
            <img src="resources/images/팀장.jpg" alt="Profile Image">
            <h2>팀장</h2>
        </div>
        <div class="chat-body" id="chatBody">
            <!-- 메시지 카드가 여기에 추가됩니다. -->
        </div>
        <div class="input-area">
            <input type="text" id="messageInput" placeholder="메시지를 입력하세요...">
            <button id="sendButton">전송</button>
        </div>
    </div>
</div>
    
<script>
    // 채팅 열기 버튼 클릭 시 모달 열기
    document.getElementById('openChat').addEventListener('click', function() {
        document.getElementById('chatModal').style.display = 'flex'; // 모달 표시
    });

    // 모달 외부 클릭 시 모달 닫기
    document.getElementById('chatModal').addEventListener('click', function(event) {
        if (event.target === this) {
            this.style.display = 'none'; // 모달 숨김
        }
    });

    document.getElementById('sendButton').addEventListener('click', function() {
        const messageInput = document.getElementById('messageInput');
        const messageText = messageInput.value.trim();
        
        if (messageText) {
            addMessage('User', messageText); // 'User'는 현재 사용자
            messageInput.value = ''; // 입력 필드 초기화
        }
    });

    function addMessage(user, message) {
        const chatBody = document.getElementById('chatBody');
        
        const messageElement = document.createElement('div');
        messageElement.className = 'message ' + (user === 'User' ? 'user' : 'receiver'); // 메시지 스타일 조정
        
        const messageContent = document.createElement('div');
        messageContent.className = 'message-content';
        messageContent.textContent = message;

        // 메시지 정보 추가
        const messageInfo = document.createElement('div');
        messageInfo.className = 'message-info';

        const messageTime = document.createElement('div');
        messageTime.className = 'message-time';
        messageTime.textContent = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

        const readReceipt = document.createElement('div');
        readReceipt.className = 'read-receipt';
        readReceipt.textContent = '1'; // 읽음 표시 숫자

        // 읽음 표시 클릭 이벤트
        readReceipt.addEventListener('click', function() {
            readReceipt.style.display = 'none'; // 읽음 표시 숨기기
            console.log(user + '의 메시지 읽음 표시가 사라졌습니다.'); // 로그 출력
        });

        // 시간과 읽음 표시 추가
        messageInfo.appendChild(messageTime);
        messageInfo.appendChild(readReceipt);
        messageElement.appendChild(messageInfo); // 메시지 정보 추가
     // 메시지 내용 추가
        messageElement.appendChild(messageContent);
        
        chatBody.appendChild(messageElement);
        
        chatBody.scrollTop = chatBody.scrollHeight; // 새 메시지로 스크롤

        // 애니메이션 효과
        setTimeout(function() {
            messageElement.style.opacity = 1;
            messageElement.style.transform = 'translateY(0)';
        }, 100);
    }
</script>
    
</body>
</html>