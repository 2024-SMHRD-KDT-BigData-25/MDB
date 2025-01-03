<%@page import="java.math.BigInteger"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>CINEM@GRAFO</title>
  <!-- base:css -->
  <link rel="stylesheet" href="resources/vendors/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="resources/vendors/feather/feather.css">
  <link rel="stylesheet" href="resources/vendors/base/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="resources/css/style.css">
  <!-- endinject -->
  <link rel="shortcut icon" href="resources/images/favicon.png" />
  <style>
    .auth-img-bg {
      background-image: url('path/to/your/background-image.jpg'); /* 배경 이미지 경로 설정 */
      background-size: cover; /* 배경 이미지 크기 조정 */
      background-position: center; /* 배경 이미지 위치 조정 */
      height: 100vh; /* 전체 높이 설정 */
    }

    .btn-kakao, .btn-naver {
      width: 50%; /* 버튼 너비를 동일하게 설정 */
      height: 50px; /* 버튼 높이를 동일하게 설정 */
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 16px; /* 버튼 텍스트 크기를 동일하게 설정 */
      padding: 10px; /* 동일한 패딩 설정 */
    }

    .btn-kakao {
      background-color: #FEE500; /* 카카오톡 노란색 */
      color: #000;
    }

    .btn-naver {
      background-color: #03C75A; /* 네이버 연두색 */
      color: #fff;
      margine-left:100px;
    }

    .btn-kakao:hover {
      background-color: #e6c600; /* 카카오톡 hover 색상 */
    }

    .btn-naver:hover {
      background-color: #02b24b; /* 네이버 hover 색상 */
    }

    .form-check-input:checked {
      background-color: #2f2f2f; /* 체크박스 색상 */
      border-color: #2f2f2f; /* 체크박스 테두리 색상 */
    }

    .form-check-label {
      color: #2f2f2f; /* 체크박스 레이블 색상 */
    }

    .btn-info {
      background-color: #2f2f2f; /* 로그인 버튼 색상 */
      border-color: #2f2f2f; /* 로그인 버튼 테두리 색상 */
    }

    .btn-info:hover {
      background-color: #1f1f1f; /* 로그인 버튼 hover 색상 */
    }

    .remember-me-container {
      display: flex; /* 플렉스 박스 사용 */
      align-items: center; /* 수직 정렬 */
      margin-left: 25px; /* 체크박스를 오른쪽으로 약간 이동 */
    }

    .remember-me-text {
      flex: 1; /* 텍스트를 가운데 정렬하기 위해 flex-grow 사용 */
      text-align: center; /* 텍스트 가운데 정렬 */
    }
    
    a {
      display: inline-block;
    }
  </style>
</head>

<body>

	<%
    String clientId = "H1vuE8JE6UJiGKXQiRzY";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8081/thegrace/NaverLoginController", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
         + "&client_id=" + clientId
         + "&redirect_uri=" + redirectURI
         + "&state=" + state;
    session.setAttribute("state", state);
	%>

  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-stretch auth auth-img-bg">
        <div class="row flex-grow">
          <div class="col-lg-6 d-flex align-items-center justify-content-center">
            <div class="auth-form-transparent text-left p-3">
              <div class="brand-logo">
                <img src="resources/images/logo_black.png" alt="logo">
              </div>
              <br><br><br><br><br>
              <form class="pt-3" action="Login" method="post">
                <div class="form-group">
                  <label for="exampleInputEmail">USER EMAIL</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="mdi mdi-account-outline"></i>
                      </span>
                    </div>
                    <input type="text" class="form-control form-control-lg border-left-0" name="user_email" id="input_email" placeholder="로그인 email 입력"> <br>
                  </div>
                  	<p id="email_warning" style="display:none; color:red;">아이디(이메일)을 입력해주세요.</p>
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword">PASSWORD</label>
                  <div class="input-group">
                    <div class="input-group-prepend bg-transparent">
                      <span class="input-group-text bg-transparent border-right-0">
                        <i class="mdi mdi-lock-outline"></i>
                      </span>
                    </div>
                    <input type="password" class="form-control form-control-lg border-left-0" name="user_pw" id="input_pw" placeholder="PW입력"> <br>
                  </div>
                  	<p id="password_warning" style="display:none; color:red;">비밀번호를 입력해주세요.</p>
                </div>
                <div class="my-2">
                  <div class="remember-me-container">
                    <div class="remember-me-text">
                     <div class="form-check">
                      <label class="form-check-label text-muted" for="rememberMe">
                    	<input type="checkbox" class="form-check-input" name="rememberMe" id="rememberMe">
                        로그인 정보를 기억하시겠습니까?
                      </label>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="my-3">
                  <input class="btn btn-block btn-info btn-lg font-weight-medium auth-form-btn" id="login_btn" type="submit" value="LOGIN">
                </div>
                <div class="mb-2 d-flex">
                  
	                  <button type="button" class="btn btn-naver auth-form-btn ml-1">
	                    <a href="<%=apiURL%>"><img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBwgHBgkIBwgKCgkLDRYPDQwMDRsUFRAWIB0iIiAdHx8kKDQsJCYxJx8fLT0tMTU3Ojo6Iys/RD84QzQ5OjcBCgoKDQwNGg8PGjclHyU3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3Nzc3N//AABEIAMAAzAMBEQACEQEDEQH/xAAbAAEAAwEBAQEAAAAAAAAAAAAAAQYHBQQCA//EAEUQAQABAwEDAg8OBQUAAAAAAAARAQIEAwUGsRITBxQhIjE0NTZRc3SCk7LhFRYXJCZBQlJVYWVxcuIjVIOS0SWBoaPB/8QAGwEBAAIDAQEAAAAAAAAAAAAAAAEEAgMGBQf/xAA2EQEAAQMBBQMKBgIDAAAAAAAAAQIDEQQFMTJxsRITNAYUFiFRU2GBoeEVIjNBUqJykWPB0f/aAAwDAQACEQMRAD8A60vIw+VokwBgJMBJgEgCZRgQnAAIwCQAARgEgAAAAAjAJAAAHykAAAAAAAAAAAEAkAAAJAAQCQAkCUAkJBAAAAAAAAAAAAAAAAAAAAAAAAAAIlLLBIYJDBIYJDBIYJDBIYJDBIYJDBIYJDBIYJDBIYJDBIYJDBIYJDBIYJDBIYJDBIYQJAAAAAAAAAAAAAAAAAAAAAAAAAQkAAJAkCQAAAAJAkCQJA7IEgSBIEgSBIEgSBIEgiQQlIgAEwAAALLhboZGXh6OTbl6VturZS+lK216k0bqbE1RnL3rGwbl61TciuPXGX7+8jK/ndH+yqfNp9rb6OXf5x/o95GV/O6P9lTzafaejl3+cPDtfdjL2biVya6tmtZbXrqWUrTk08LGuzVTGVXWbFu6a33mc49jgtTxgAHs2Rhe6O0dHD5zm+cnromIpWv/AIypp7U4W9Fp/Ob9NrOM56Ss3vG/Ea0/ofub/No9r3fRv/l/r9z3jfiP/R+5Pm8e09G597/X7nvG/Eq+g/cjzePaejc+9/r93D3g2N7jaujp9Mc7zltbp5HJiP8AdquW+xLydo7P8ymmO12s/DH/AG5LW80AAAAABEpTgkMEhgkMEhgkMEiGrbA7iYHiLOC9b4IfRdB4W3/jHR72a2A+dWy3U07rL6UutupFaV+c5oqiKoxLNN5dkXbKza0sp8X1Orp18H3KFdvsVOF2poZ0t3EcM7v/ABx5YvLwSGHY3Rr8osPz/UuZ2uOHqbG8db+fSWmrzuwAFG6IVfjWH+i7jRV1G+HJ+UX6lvlKpy0OcwSGCQwSGCQwSGCQw+RIAAAAADWNgdw8DyezgvW+CH0PQeFt/wCMdHvZrYADwbY2bpbSwb8fVpTq9W276tfCxrp7UYlV1mlp1VqbdXy+DLs3G1cPK1MfIpydTTrFVGaezOJcDesV2bk26o9cPxQ0uxuh3x4fn+pcztccPU2N46j59JacvO6AAUXoh9t4fi7uNFW/vhynlF+pb5SqTQ5wAAAAABCUgAAAAANY3f7h4Hk9nBdt8EPoWg8Lb5R0dBmtgAIrSQVvfDYtc7Fpk41s5GlTsU+nb4Gm7b7UZh4u2NB5xb7yiPzQz3wKjjJdjc/vjw/zv9S5stR+eHp7G8dR8+ktPXXdAAKL0Q+28P8ARdxoq398OU8ov1LfKVRaXOgAAAAAAkAAAABEiGs7v9w8Dyezgu2+CH0LQeFt8o6OgzWwAAEXUkQz/fPYnSet09j2xoalf4kdi27w/lVVu0dmcw5HbOz+6q763Hqnq8G59flHh+f6lzG1xwq7H8dR8+ktQXHcgAKJ0RK/G8P9F3Gitf3uV8of1LfKVRaHOpABAJABAIAAAAAASNa3f7h4Hk9nBct8EPoOg8Lb5R0dBmtgPxy8nTxNCutrXcmyl1tta/nWlKf81RMxEZlru3KbdPaq3er6zh+lt0pbH0D8crH08rH1NDWt5WnfbF1KomM+qWFy3TcomirdKibK2ZqbJ3yxce/q215d2nd9anIuVqaexciJcrpdJVpdp0UTu9eP9S0CnYWnWwkAFE6IvbeH+i7jRWvb3K+UPHRylUGlzogAAAAEiJSkkCQJAkCQJBre7/cLA8ns4Ldvhh9A0PhbfKOjoM1sBw99e9rL8z17Wu7wS8zbHgq/l1h4ty9t9O4/SeRf8Y0betrX6dv+aItV5jEq+x9f31HdVz+aPqtFKy2vbSDz6+Lpa2voa19v8TRurWy756TStK8UYhrrtU11U1Tvjc9FEtgACh9EbtvC8Xdxor3t7lfKDjo5SqEtLniQJAkCQJAkHyJASACASAEtc3e7hbP8ns4Ldvhh3+h8Lb5R0dBmtgOHvt3s5nmeva13eF5u1/BV/LrDNcPK1cPK0snQurTU07porRMxOYcZZu1Wq4rp3w1fYu0NLamDZlaX0updT6tfnot01RVGXe6XUU6i1Fyl72SwAAAAoXRG7bwvF3caK97e5byg47fKVQaXPAIBIIAABCUgAAAAAS13d3uDs/yezhRbo4Yd/ofC2+UdHRZLQDhb7d7OZ5nr2tdzhebtfwVfy6wy9WcQ7W6u2btk59Kal1eldbrdWn1fBdRnRV2ZelsvWzpbv5uGd7UdO62+2l1taVpXq0rRadtExMZh9CQAAFB6JHbmF4u7jRXvb3L7f47fKVPanPAAAAAAIkCQJSIABMggGv7u9wdn+T2cKLVHDDv9D4W3yjo6LJaAcLffvYzPM9e1rucLzdr+Cr+XWGWyrOIKV+4Sve423Oesps3Ju6+2k6N11ezTwN9uv9pdRsbXTXHcXJ9f7LnRudAkAAFA6JHbmF4u7jRou73L+UHHRylT5aXPEgSBIEgSBIISkAAAAABr+7tf9B2f5PZwotUcMO+0PhrfKOjoSyWskhlw996/JjM/p+vawucLzdr+Dr+XWGWKziQH3oa1+hrWaujdW3Usu5Vt1PmrQ5M6K5oqiqnfDWN3dr6W19nWa1Ipq063Usp81y1RV2odzodXTqbUV/v+7qTRkuEgSCg9EjtzC8Xdxor3d7l9v8dHKVOa3PgAAAAAIE4AwBgDAGAMCTC4bO33twsDHxekLr+Z07bOVzsTFI8DZFzEYdBY23Fq1Tb7G6Mb3o+EG37Nr6b2J734Nv4/T/D6nwg2/Zt3pvYd78D8fp/h9Xh25vhbtXZethUwrtLnOT19dSYi6lexH3IqudqMK2s2vGoszaijGfj8cqrLU8PAGAMOjsLbGtsbM5/St5dl1I1NOtYpdT/LKmezOV3R6yvS19qn1x+8LJ8IN32dT03sbO9l6v4/Pu/qfCDf9m09N7DvT0gn3f1+x8IN/wBnU9N7DvT0gn3f1+zhbx7d93NXR1K4/M107a2xS6ZlhXV2nm6/XeeTTMxjDjsHn4AwBgDAGAMAYQywkMAYAwBgDAGBBgwGDAYMBgwkwBgDAgwBgwGDAYMBgwSYEmAMCJMCZMCJMBJgRIkkCQJAkCQJAkCQJAkCQJAkCQJAkCQJAkCQJAkCQJAkHylIIABIAIABIAAAAIABIAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAAAAAAARKUkgSBIEgSBIEgSBIEgSBIEgSBIEgSBIEgSBIEgSBIEghKQAAABAJAAAAAAAAAAAAAAAAAAAH/9k=" alt="Naver" style="width: 20px; margin-right: 5px;"></a>
	                    Naver
	                  </button>
                </div>
                <div class="text-center mt-4 font-weight-light">
                  계정이 없다면 지금 <a href="join.jsp" class="text-primary">회원가입</a>
                </div>
              </form>
            </div>
          </div>
          <div class="col-lg-6 login-half-bg d-flex flex-row">
            <p class="text-white font-weight-medium text-center flex-grow align-self-end">Noom Peerapong on	 Unsplash &copy; 2024 All rights reserved.</p>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- base:js -->
  <script src="resources/vendors/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="resources/js/off-canvas.js"></script>
  <script src="resources/js/hoverable-collapse.js"></script>
  <script src="resources/js/template.js"></script>
  <script src="resources/js/login.js"></script>
  <!-- endinject -->
</body>

</html>