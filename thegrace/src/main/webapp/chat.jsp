<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅창</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }

        /* 비디오 배경 */
        .video-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -1;
        }

        .chat-container {
            width: 90%;
            max-width: 600px;
            margin: 20px auto;
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
            margin-left: 10px;
            font-size: 1em;
        }

        .message.receiver .message-content {
            background-color: #f1f1f1; /* 수신자 메시지의 배경색 */
            margin-left: 0; /* 왼쪽 정렬로 인한 여백 제거 */
            margin-right: 10px; /* 사용자 메시지와의 간격 */
        }

        .message.user .message-content {
            background-color: #B2E0D4; /* 사용자 메시지의 배경색 */
            color: white; /* 사용자 메시지 텍스트 색상 */
        }

        .message-time {
            font-size: 0.75em;
            color: #888;
            margin-right: 5px; /* 메시지와 시간 사이 간격 */
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
        
        .message .message-info {
            display: flex;
            flex-direction: column;
            align-items: flex-start; /* 시간과 숫자를 왼쪽 정렬 */
            margin-right: 10px; /* 메시지 내용과의 간격 */
        }

        /* 사용자 메시지에 대해 왼쪽 정렬 적용 */
        .message.user .message-info {
            align-items: flex-end; /* 시간과 숫자를 오른쪽 정렬 */
        }

    </style>
</head>
<body>

<!-- 비디오 배경 -->
<video class="video-background" autoplay loop muted>
    <source src="resources/videos/chat.mp4" type="video/mp4">
</video>

<div class="chat-container">
    <div class="chat-header">
        <img src="resources/images/프로필캐릭2.jpg" alt="Profile Image">
        <h2>천지희</h2>
    </div>
    <div class="chat-body" id="chatBody">
        <!-- 메시지 카드가 여기에 추가됩니다. -->
    </div>
    <div class="input-area">
        <input type="text" id="messageInput" placeholder="메시지를 입력하세요...">
        <button id="sendButton">전송</button>
    </div>
</div>

<%
String user_email = (String)session.getAttribute("user_email");
String followee = request.getParameter("followee");
%>

<script>
	// 소켓서버에 연결 (WebSocket)
    const userEmail = "<%=user_email%>"; // 세션에서 사용자 이메일 가져오기
    const followee = "<%=followee%>"; // 버튼 클릭 시 전달된 대화 상대 이메일 가져오기
    const webSocket = new WebSocket(`ws://localhost:8081/mavenboard/chat/\${userEmail}/\${followee}`);
	
	webSocket.onopen = onOpen;
	webSocket.onclose = onClose;
	webSocket.onmessage = onMessage;

    document.getElementById('sendButton').addEventListener('click', function() {
        const messageInput = document.getElementById('messageInput');
        const messageText = messageInput.value.trim();
        
        if (messageText) {
        	webSocket.send(JSON.stringify({ user: userEmail, message: messageText })); // 메시지 전송
            addMessage('User', messageText); // 'User'는 현재 사용자
            messageInput.value = ''; // 입력 필드 초기화
        }
    });
    
	function onOpen() { //현재 클라이언트가 서버로 접속 시도할 때 호출
		// 현재 로그인한 사용자의 닉네임값을 서버로 보내고 싶은 경우
		// 서버 => "닉네임" 님이 접속했습니다!
		//webSocket.send(보내고 싶은 값(json));
		//webSocket.send(JSON.Stringify({"nick":"하츄핑"}));
		//서버 => String(json) => JAVA Object (GSON 라이브러리 활용)
		webSocket.send(JSON.Stringify({"user_email":user_email, "followee":followee}));
	}
	
	function onClose() {
		//webSocket.send(JSON.Stringify({"nick":"하츄핑"}));
		//서버 => String(json) => JAVA Object (GSON 라이브러리 활용)
	}

    function addMessage(user, message) {
        const chatBody = document.getElementById('chatBody');
        
        const messageElement = document.createElement('div');
        messageElement.className = 'message ' + (user === 'User' ? 'user' : 'receiver'); // 메시지 스타일 조정
        
        const messageContent = document.createElement('div');
        messageContent.className = 'message-content';
        messageContent.textContent = message;

        // Create a container for the time and read receipt
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

        // 메시지 내용 및 읽음 표시 추가
        messageElement.appendChild(messageInfo); // 시간과 읽음 표시 먼저 추가
        messageElement.appendChild(messageContent); // 메시지 내용 추가
        
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
