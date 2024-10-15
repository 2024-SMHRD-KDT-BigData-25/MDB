<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
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
            overflow-x: hidden;
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
            justify-content: flex-end;
        }

        .message.receiver {
            justify-content: flex-start;
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
            background-color: #f1f1f1;
            margin-left: 0;
            margin-right: 10px;
        }

        .message.user .message-content {
            background-color: #B2E0D4;
            color: white;
        }

        .message-time {
            font-size: 0.75em;
            color: #888;
            margin-right: 10px;
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
    </style>
</head>
<body>

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
        <input type="hidden" id="invitedUser" value="천지희"> <!-- 상대방 ID 추가 -->
        <input type="text" id="messageInput" placeholder="메시지를 입력하세요...">
        <button id="sendButton">전송</button>
    </div>
</div>

<script>
	
	// 추가한 코드
	$(document).ready(function() {
	    const currentRoom = $('#currentRoom').val();  // 현재 채팅방의 croom_cd 값을 가져옴
	
	    // AJAX 요청을 통해 채팅방에 입장할 수 있는지 확인
	    $.ajax({
	        url: 'ChatRoomController',  // 서버에 채팅방 접근을 확인할 엔드포인트
	        type: 'POST',
	        data: { croom_cd: currentRoom },
	        success: function(response) {
	            if (response.access === 'denied') {
	                alert('해당 채팅방에 접근할 수 없습니다.');
	                window.location.href = 'errorPage.jsp';  // 접근 거부 시 다른 페이지로 리다이렉트
	            } else {
	                console.log('채팅방 입장 허용');
	            }
	        },
	        error: function() {
	            alert('채팅방 접근 오류가 발생했습니다.');
	        }
	    });
	});


	//소켓 서버에 연결 (WebSocket)
	const webSocket = new WebSocket("ws://localhost:8081/thegrace/chat3");

	webSocket.onopen = function () {
	    console.log("WebSocket 연결 성공");
	};

	webSocket.onclose = function () {
	    console.log("WebSocket 연결 종료");
	};

	webSocket.onmessage = function (msg) {
	    const msgData = msg.data;
	    console.log("Received message:", msgData);  // 서버에서 받은 메시지 확인
	    // 서버에서 받은 메시지를 화면에 추가
	    const messageElement = `
	        <div class="message receiver">
	            <div class="message-content">\${msgData}</div>
	        </div>`;
	    document.getElementById("chatBody").insertAdjacentHTML('beforeend', messageElement);

	    // 스크롤을 맨 아래로 이동
	    const chatBody = document.getElementById("chatBody");
	    chatBody.scrollTop = chatBody.scrollHeight;
	};

	document.getElementById("sendButton").addEventListener("click", function () {
	    const messageInput = document.getElementById("messageInput");
	    const messageText = messageInput.value.trim();

	    if (messageText && webSocket.readyState === WebSocket.OPEN) { // WebSocket이 열려 있는지 확인
	        // 자신의 메시지를 화면에 추가 (보낸 메시지)
	        const messageElement = `
	            <div class="message user">
	                <div class="message-content">\${messageText}</div>
	            </div>`;
	        document.getElementById("chatBody").insertAdjacentHTML('beforeend', messageElement);

	        // 스크롤을 맨 아래로 이동
	        const chatBody = document.getElementById("chatBody");
	        chatBody.scrollTop = chatBody.scrollHeight;

	        // WebSocket으로 메시지 전송
	        webSocket.send(messageText);

	        // 입력 필드 초기화
	        messageInput.value = '';
	    } else {
	        console.log("WebSocket이 열려 있지 않습니다. 메시지를 전송할 수 없습니다.");
	    }
	});
</script>
</body>
</html>