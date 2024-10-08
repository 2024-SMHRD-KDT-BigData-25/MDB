$(document).ready(function() {
    // 아이디에 값을 입력하면 중복체크 이벤트 발생
    $('#user_email').on('input', checkJoinedEmail);
});

// 아이디 중복 체크 기능
function checkJoinedEmail() {
    // 아이디 입력 필드의 값을 가져와 변수에 저장 (내부 변수로 선언)
    const user_email = $('#user_email').val().trim();

    // 아이디가 10글자 이상일 경우에만 AJAX 요청
    if (user_email.length >= 10) {
        // AJAX 요청을 통해 서버에 아이디 중복 체크 요청
        $.ajax({
            url: '/checkEmail',  // 아이디 체크를 위한 서버 엔드포인트
            type: 'POST',      // POST 방식으로 요청
            contentType: 'application/json', // 요청 데이터 타입 설정
            data: JSON.stringify({ user_email: user_email }), // JSON 형식으로 데이터 전송
            success: function(response) {
                // 서버의 응답을 기반으로 결과 표시
                if (response.available) {
                    // 아이디가 사용 가능할 때
                    $('#EmailCheck').text("사용 가능한 아이디입니다.").css('color', 'green');
                } else {
                    // 아이디가 이미 사용 중일 때
                    $('#EmailCheck').text("이미 사용 중인 아이디입니다.").css('color', 'red');
                }
            },
            error: function() {
                // 요청 실패 시 오류 메시지 표시
                $('#EmailCheck').text("오류가 발생했습니다. 다시 시도해주세요.").css('color', 'red');
            }
        });
    }
}