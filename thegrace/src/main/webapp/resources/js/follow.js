document.addEventListener("DOMContentLoaded", function() {
    const followBtns = document.querySelectorAll('.followBtn');
    const unfollowBtns = document.querySelectorAll('.unfollowBtn');
    
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

// 팔로우 기능 구현
function follow(followee, button) {
    $.ajax({
        url: '/thegrace/Follow',
        type: "POST",
        contentType: 'application/json',
        data: JSON.stringify({ "followee": followee }),
        success: function(response) {
            if (response.available) {
                $(button).hide(); // follow 버튼 숨김
                $(button).siblings('.unfollowBtn').show(); // unfollow 버튼 표시
            }
        },
        error: handleError
    });
}

// 언팔로우 기능 구현
function unfollow(followee, button) {
    $.ajax({
        url: '/thegrace/Unfollow',
        type: "POST",
        contentType: 'application/json',
        data: JSON.stringify({ "followee": followee }),
        success: function(response) {
            if (response.available) {
                $(button).hide(); // unfollow 버튼 숨김
                $(button).siblings('.followBtn').show(); // follow 버튼 표시
            }
        },
        error: handleError
    });
}

// 에러 처리 함수
function handleError(jqXHR) {
    console.log("에러 세부사항: ", jqXHR);
    const message = jqXHR.status === 404 ? "요청 URL이 잘못되었습니다." :
                    jqXHR.status === 500 ? "서버 내부 오류가 발생했습니다." :
                    "오류가 발생했습니다. 다시 시도해주세요.";
    $('#alert').text(message).css('color', 'red');
}