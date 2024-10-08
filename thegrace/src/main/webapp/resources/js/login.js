const loginId = document.getElementById('input_email');
const loginPw = document.getElementById('input_pw');
const loginBtn = document.getElementById('login_btn');
const emailWarning = document.getElementById('email_warning'); // 경고 메시지 요소
const passwordWarning = document.getElementById('password_warning'); // 경고 메시지 요소


function color() {
    if((loginId.value.length>0 && loginId.value.indexOf("@")!==-1) 
        && loginPw.value.length>=5){
        loginBtn.style.backgroundColor = "#0095F6";
        loginBtn.disabled = false;
    }else{
        loginBtn.style.backgroundColor = "#C0DFFD";
        loginBtn.disabled = true;
    }
}

function checkInputs(event) {
    // 기본 제출 동작 방지
    event.preventDefault();

    let isValid = false; // 유효성 검사를 위한 플래그

    // 이메일 검증
    if (loginId.value.length === 0) {
        emailWarning.style.display = 'block'; // 경고 메시지 표시
        isValid = false; // 유효하지 않음
    } else {
        emailWarning.style.display = 'none'; // 경고 메시지 숨기기
		isValid = true;
    }

    // 비밀번호 검증
    if (loginPw.value.length === 0) {
        passwordWarning.style.display = 'block'; // 경고 메시지 표시
        isValid = false; // 유효하지 않음
    } else {
        passwordWarning.style.display = 'none'; // 경고 메시지 숨기기
		isValid = true;
    }

    // 두 필드가 모두 유효할 경우 메인 페이지로 이동
	if (!isValid) {
	    event.preventDefault();  // 기본 폼 제출 동작 방지
	}
}

// loginId.addEventListener('input', color);
// loginPw.addEventListener('input', color);
loginBtn.addEventListener('click', checkInputs);
