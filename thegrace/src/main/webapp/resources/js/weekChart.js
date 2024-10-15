// Chart.js 그래프 초기 설정
    const ctx = document.getElementById('myChart').getContext('2d');
    const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [],  // 영화 제목이 들어갈 자리
            datasets: [{
                label: '투표 수',
                data: [],  // 투표 수 데이터가 들어갈 자리
                backgroundColor: 'rgba(54, 162, 235, 0.2)',
                borderColor: 'rgba(54, 162, 235, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    // 서버에서 투표 결과를 받아와서 그래프 갱신
    function fetchResults() {
        fetch('/thegrace/vote')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                // 그래프 업데이트
                myChart.data.labels = data.movieTitles;  // 영화 제목으로 라벨 설정
                myChart.data.datasets[0].data = data.results;  // 투표 수 데이터 설정
                myChart.update();  // 그래프 업데이트
            })
            .catch(error => console.error('Error fetching results:', error));
    }

    // 페이지 로딩 시 투표 결과 불러오기
    window.onload = fetchResults;

    // 투표 폼 제출 처리
    document.getElementById('voteForm').addEventListener('submit', function(event) {
        event.preventDefault();  // 폼 기본 제출 방지
        const selectedMovie = document.querySelector('input[name="movieId"]:checked');
        
        if (selectedMovie) {
            const formData = new FormData(this);  // 폼 데이터를 가져옴

            fetch('/thegrace/vote', {
                method: 'POST',
                body: formData
            })
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    alert(data.error);  // 중복 투표 등의 에러 처리
                } else {
                    fetchResults();  // 투표 후 최신 결과 불러오기
                    alert('투표가 성공적으로 완료되었습니다!');
                }
            })
            .catch(error => console.error('Error during voting:', error));
        } else {
            alert('영화를 선택해주세요.');  // 영화 선택하지 않았을 경우
        }
    })