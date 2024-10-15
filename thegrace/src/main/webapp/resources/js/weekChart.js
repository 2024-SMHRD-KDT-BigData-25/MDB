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
                .then(response => response.json())
                .then(data => {
                    myChart.data.labels = data.movieTitles;
                    myChart.data.datasets[0].data = data.results;
                    myChart.update();
                })
                .catch(error => console.error('Error fetching results:', error));
        }

        // 페이지 로딩 시 투표 결과 불러오기
        window.onload = fetchResults;

        // 투표 폼 제출 처리
        document.getElementById('voteForm').addEventListener('submit', function(event) {
            event.preventDefault();
            const selectedMovie = document.querySelector('input[name="movieId"]:checked');
            if (selectedMovie) {
                const formData = new FormData(this);
                fetch('/thegrace/vote', {
                    method: 'POST',
                    body: formData
                })
                .then(response => response.json())
                .then(data => {
                    if (data.error) {
                        alert(data.error);  // 이미 투표한 경우
                    } else {
                        fetchResults();  // 투표 후 최신 결과 불러오기
                        alert('투표가 성공적으로 완료되었습니다!');
                    }
                })
                .catch(error => console.error('Error during voting:', error));
            } else {
                alert('영화를 선택해주세요.');
            }
        });