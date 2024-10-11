document.addEventListener("DOMContentLoaded", function() {
    // 모든 Follow 버튼에 대해 클릭 이벤트 리스너 추가
    const followBtns = document.querySelectorAll('.followBtn');
    
    followBtns.forEach(button => {
        button.addEventListener('click', function() {
            // data-followee 속성에서 followee 값을 가져옴
            const followee = this.getAttribute('data-followee');
            // follow 함수를 호출하거나 AJAX 요청을 보냄
            follow(followee, button);
        });
    });
});

document.addEventListener("DOMContentLoaded", function() {
    // 모든 Follow 버튼에 대해 클릭 이벤트 리스너 추가
	const unfollowBtns = document.querySelectorAll('.unfollowBtn');
    
    unfollowBtns.forEach(button => {
        button.addEventListener('click', function() {
            // data-followee 속성에서 followee 값을 가져옴
            const followee = this.getAttribute('data-followee');
            // follow 함수를 호출하거나 AJAX 요청을 보냄
            unfollow(followee, button);
        });
    });
});

// 비동기 통신 시 사용하는 데이터 형식 : json {key:value, key:value} / xml
function follow(followee, button) {
	$.ajax( {
		url : '/thegrace/Follow',
		type : "POST",
		contentType: 'application/json', // 요청 데이터 타입 설정
		data: JSON.stringify({ "followee" : followee }), // JSON 형식으로 데이터 전송
		success : 	function(response) {
				    // 서버의 응답을 기반으로 결과 표시
				    if (response.available) {
				        // 팔로우 성공 시 followBtn을 숨기고, unfollowBtn을 보여줌
						$(button).hide(); // 클릭한 followBtn 숨기기
						$(button).siblings('.unfollowBtn').show(); // 해당 followBtn의 형제 요소인 unfollowBtn 보여주기
				    } else {
				        // 팔로우 실패 시 unfollowBtn을 숨기고, followBtn을 보여줌
						$(button).show(); // followBtn을 보여줌
						$(button).siblings('.unfollowBtn').hide(); // 형제 요소 unfollowBtn을 숨김
				    }
			 },
		error : function(jqXHR, textStatus, errorThrown) {
				// 콘솔에 에러 정보 출력하여 확인
				console.log("Error details: ", jqXHR, textStatus, errorThrown);

				// 에러 상태 코드 확인
				if (jqXHR.status === 404) {
				    $('#alert').text("요청 URL이 잘못되었습니다.").css('color', 'red');
				} else if (jqXHR.status === 500) {
				    $('#alert').text("서버 내부 오류가 발생했습니다.").css('color', 'red');
				} else {
				    $('#alert').text("오류가 발생했습니다. 다시 시도해주세요.").css('color', 'red');
				}
		}
	})
}

// 언팔로우 기능 구현
function unfollow(followee, button) {
	$.ajax( {
		url : '/thegrace/Unfollow',
		type : "POST",
		contentType: 'application/json', // 요청 데이터 타입 설정
		data: JSON.stringify({ "followee" : followee }), // JSON 형식으로 데이터 전송
		success : 	function(response) {
				    // 서버의 응답을 기반으로 결과 표시
				    if (response.available) {
				        // 팔로우 성공 시 followBtn을 숨기고, unfollowBtn을 보여줌
						$(button).hide(); // 클릭한 unfollowBtn 숨기기
						$(button).siblings('.followBtn').show(); // 해당 followBtn의 형제 요소인 followBtn 보여주기
				    } else {
				        // 팔로우 실패 시 unfollowBtn을 숨기고, followBtn을 보여줌
						$(button).show(); // unfollowBtn을 보여줌
						$(button).siblings('.followBtn').hide(); // 형제 요소 followBtn을 숨김
				    }
			 },
		error : function(jqXHR, textStatus, errorThrown) {
				// 콘솔에 에러 정보 출력하여 확인
				console.log("Error details: ", jqXHR, textStatus, errorThrown);

				// 에러 상태 코드 확인
				if (jqXHR.status === 404) {
				    $('#alert').text("요청 URL이 잘못되었습니다.").css('color', 'red');
				} else if (jqXHR.status === 500) {
				    $('#alert').text("서버 내부 오류가 발생했습니다.").css('color', 'red');
				} else {
				    $('#alert').text("오류가 발생했습니다. 다시 시도해주세요.").css('color', 'red');
				}
		}
	})
}

function followYn() {
	
}

