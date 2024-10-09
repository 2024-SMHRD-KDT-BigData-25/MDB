const ctx = document.getElementById('myChart').getContext('2d');
      const myChart = new Chart(ctx, {
        type: 'bar',
        data: {
          labels: [''], // 영화 제목
          datasets: [{
              label: '영화 제목 1', // 첫 번째 영화 제목
              data: [12], // 첫 번째 영화의 투표 수
              backgroundColor: 'rgba(255, 99, 132, 0.2)',
              borderColor: 'rgba(255, 99, 132, 1)',
              borderWidth: 1
          },
          {
              label: '영화 제목 2', // 두 번째 영화 제목
              data: [19], // 두 번째 영화의 투표 수
              backgroundColor: 'rgba(54, 162, 235, 0.2)',
              borderColor: 'rgba(54, 162, 235, 1)',
              borderWidth: 1
          },
          {
              label: '영화 제목 3', // 세 번째 영화 제목
              data: [3], // 세 번째 영화의 투표 수
              backgroundColor: 'rgba(255, 206, 86, 0.2)',
              borderColor: 'rgba(255, 206, 86, 1)',
              borderWidth: 1
          },
          {
              label: '영화 제목 4', // 네 번째 영화 제목
              data: [5], // 네 번째 영화의 투표 수
              backgroundColor: 'rgba(75, 192, 192, 0.2)',
              borderColor: 'rgba(75, 192, 192, 1)',
              borderWidth: 1
          },
          {
              label: '영화 제목 5', // 다섯 번째 영화 제목
              data: [2], // 다섯 번째 영화의 투표 수
              backgroundColor: 'rgba(153, 102, 255, 0.2)',
              borderColor: 'rgba(153, 102, 255, 1)',
              borderWidth: 1
          }]
        },
        options: {
          responsive: true,
          plugins: {
            legend: {
              display: true,
              position: 'top'
            }
          },
          scales: {
            y: {
              beginAtZero: true
            }
          }
        }
      });

      // 투표 제출 처리
      document.getElementById('voteForm').addEventListener('submit', function(event) {
        event.preventDefault();
        const selectedMovie = document.querySelector('input[name="movie"]:checked');
        if (selectedMovie) {
          alert('투표하신 영화: ' + selectedMovie.value);
        } else {
          alert('영화를 선택해주세요.');
        }
      });