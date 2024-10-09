const user_pw = document.getElementById("user_pw");
const nick = document.getElementById("nick");
const pwCheckResult = document.getElementById("pwCheckResult");
const nickCheckResult = document.getElementById("nickCheckResult");

$(document).ready(function() {
    // 아이디에 값을 입력하면 중복체크 이벤트 발생
    $('#user_email').on('input', checkEmail);
});
pwCheckResult.addEventListener('', checkPw);
nickCheckResult.addEventListener('', checkNick);

// 아이디 중복 체크 기능
function checkEmail() {
    // 아이디 입력 필드의 값을 가져와 변수에 저장 (내부 변수로 선언)
    const user_email = $('#user_email').val().trim();
	const emailReg = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

    // 이메일 형식으로 입력된 경우에만 중복 체크
    if (emailReg.test(user_email)) {
        // AJAX 요청을 통해 서버에 아이디 중복 체크 요청
        $.ajax({
            url: '/thegrace/checkEmail',  // 아이디 체크를 위한 서버 엔드포인트
            type: 'POST',      // POST 방식으로 요청
            contentType: 'application/json', // 요청 데이터 타입 설정
            data: JSON.stringify({ user_email : user_email }), // JSON 형식으로 데이터 전송
            success: function(response) {
                // 서버의 응답을 기반으로 결과 표시
                if (response.available) {
                    // 아이디가 사용 가능할 때
                    $('#emailCheckResult').text("사용 가능한 아이디입니다.").css('color', 'green');
                } else {
                    // 아이디가 이미 사용 중일 때
                    $('#emailCheckResult').text("이미 사용 중인 아이디입니다.").css('color', 'red');
                }
            },
			error: function(jqXHR, textStatus, errorThrown) {
			    // 콘솔에 에러 정보 출력하여 확인
			    console.log("Error details: ", jqXHR, textStatus, errorThrown);

			    // 에러 상태 코드 확인
			    if (jqXHR.status === 404) {
			        $('#emailCheckResult').text("요청 URL이 잘못되었습니다.").css('color', 'red');
			    } else if (jqXHR.status === 500) {
			        $('#emailCheckResult').text("서버 내부 오류가 발생했습니다.").css('color', 'red');
			    } else {
			        $('#emailCheckResult').text("오류가 발생했습니다. 다시 시도해주세요.").css('color', 'red');
			    }
			}
        });
    } else {
		$('#emailCheckResult').text("이메일을 입력해주세요").css('color', 'red');
	}
}

function checkPw(event) {
    // 기본 제출 동작 방지
    event.preventDefault();

    let isValid = false; // 유효성 검사를 위한 플래그

	if(user_pw==null) {
		$('#pwCheckResult').text("비밀번호를 입력해주세요").css('color', 'red');
		isValid = false;
	} else {
		isValid = true;
	}

    // 두 필드가 모두 유효할 경우 메인 페이지로 이동
	if (!isValid) {
	    event.preventDefault();  // 기본 폼 제출 동작 방지
	}
}

function checkNick(event) {
    // 기본 제출 동작 방지
    event.preventDefault();

    let isValid = false; // 유효성 검사를 위한 플래그

	if(user_pw==null) {
		$('#nickCheckResult').text("닉네임을 입력해주세요").css('color', 'red');
		isValid = false;
	} else {
		isValid = true;
	}

    // 두 필드가 모두 유효할 경우 메인 페이지로 이동
	if (!isValid) {
	    event.preventDefault();  // 기본 폼 제출 동작 방지
	}
}