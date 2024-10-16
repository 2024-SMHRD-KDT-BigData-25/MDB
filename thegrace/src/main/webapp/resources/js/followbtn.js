const followButton = document.getElementById('followButton');

followButton.addEventListener('click', function() {
    this.classList.toggle('following'); // Following 상태 토글
    this.textContent = this.classList.contains('following') ? 'Following' : 'Follow';
});

followButton.addEventListener('mouseenter', function() {
    if (this.classList.contains('following')) {
        this.textContent = 'Unfollow'; // 마우스오버 시 텍스트 변경
    }
});

followButton.addEventListener('mouseleave', function() {
    if (this.classList.contains('following')) {
        this.textContent = 'Following'; // 마우스가 나가면 원래 텍스트로 복원
    }
});