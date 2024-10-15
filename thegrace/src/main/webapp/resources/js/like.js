


// 좋아요 추가, 취소, 카운트
const likeButton = document.querySelector('.like-button');
const likeCountDisplay = document.getElementById('likeCount');
const likeTextDisplay = document.getElementById('likeText');

likeButton.addEventListener('click', function() {
    const isActive = this.classList.toggle('active'); // 버튼의 상태 토글
    const xhr = new XMLHttpRequest();
    const url = isActive ? "../../LikeInsertController" : "../../LikeDeleteController";

    xhr.open("POST", url, true);
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onload = function() {
        if (xhr.status === 200) {
            // 성공 시 총 좋아요 수 업데이트
            const currentLikes = parseInt(likeCountDisplay.textContent);
            likeCountDisplay.textContent = isActive ? currentLikes + 1 : currentLikes - 1; // 화면에 좋아요 수 업데이트

            // 버튼 텍스트 변경
            if (isActive) {
                likeTextDisplay.textContent = "좋아요 ♥"; // 좋아요 추가
            } else {
                likeTextDisplay.textContent = "좋아요 ♡"; // 좋아요 제거
            } 
        } else {
            console.log("요청에 실패했습니다.");
        }
    };

    // 서버로 보낼 데이터 설정
    xhr.send("email=" + encodeURIComponent("<%=email%>") + "&SH_NO=" + encodeURIComponent("<%=board.getSH_NO()%>") + "&No=" + encodeURIComponent("<%= idx %>") );
});    