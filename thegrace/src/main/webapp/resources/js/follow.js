
const followBtn = document.getElementById("followBtn")

// 비동기 통신 시 사용하는 데이터 형식 : json {key:value, key:value} / xml
function follow(user_email) {
	$.ajax( {
		url : '/thegrace/Follow',
		data : {"user_email" : user_email}, // 서버로 보낼 데이터(json)
		type : "get",
		success : 		function(response) {
				        // 서버의 응답을 기반으로 결과 표시
				        if (response.available) {
				            // 팔로우 성공
				            $('#followBtn').text("unfollow");
				        } else {
				            // 팔로우 실패
				            $('#alert').text("팔로우 실패").css('color', 'red');
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

loginBtn.addEventListener('click', follow);