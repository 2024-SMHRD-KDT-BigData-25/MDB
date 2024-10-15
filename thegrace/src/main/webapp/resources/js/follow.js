

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

// 팔로우 상태를 확인하는 함수
function checkFollowStatus(userId, targetId, button) {
    // AJAX 요청을 통해 서버에서 팔로우 상태를 받아옵니다.
    $.ajax({
        url: '/thegrace/followStatus',  // 서버의 팔로우 상태 확인 API
        type: 'post',
        data: {
            userId: userId,
            targetId: targetId
        },
        success: function(response) {
            // 서버에서 팔로우 상태를 반환한다고 가정합니다.
            let followStatus = response.followStatus; // "following", "follower", "mutual", "none"
            handleFollowStatus(followStatus, button);
        },
        error: function(error) {
            console.error("Error fetching follow status:", error);
        }
    });
}

// 팔로우 상태에 따른 처리 함수
function handleFollowStatus(status, button) {
	const followBtn = button;
	const unfollowBtn = followBtn.nextElementSibling;
	
    switch (status) {
        case 'following':
			followBtn.style.display = 'none';
			unfollowBtn.style.display = 'inline-block';
            // 여기서 UI 업데이트 등을 처리
            break;
        case 'follower':
			followBtn.style.display = 'inline-block';
			unfollowBtn.style.display = 'none';
            break;
        case 'F4F':
			followBtn.style.display = 'none';
			unfollowBtn.style.display = 'inline-block';
            break;
        case 'none':
			followBtn.style.display = 'inline-block';
			unfollowBtn.style.display = 'none';
            break;
        default:
            console.log("Unknown follow status.");
    }
}