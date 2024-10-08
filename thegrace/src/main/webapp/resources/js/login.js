const loginId = document.getElementById('input_email');
const loginPw = document.getElementById('input_pw');
const loginBtn = document.getElementById('LOGIN_BTN');
const emailWarning = document.getElementById('email-warning'); // 경고 메시지 요소
const passwordWarning = document.getElementById('password-warning'); // 경고 메시지 요소


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

function moveToMain(){
    location.replace("./main.html");
}

function checkInputs() {
    // 이메일 검증
    if (loginId.value.length === 0) {
        emailWarning.style.display = 'block'; // 경고 메시지 보이기
    } else {
        emailWarning.style.display = 'none'; // 경고 메시지 숨기기
    }

    // 비밀번호 검증
    if (loginPw.value.length === 0) {
        passwordWarning.style.display = 'block'; // 경고 메시지 보이기
    } else {
        passwordWarning.style.display = 'none'; // 경고 메시지 숨기기
    }
}

loginId.addEventListener('keyup', color);
loginPw.addEventListener('keyup', color);
loginBtn.addEventListener('click',moveToMain);
