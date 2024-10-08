<%@page import="org.json.JSONObject"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 로그인</title>


</head>
<body>

	<%
	session.invalidate(); // 기존 세션 무효화
    String clientId = "H1vuE8JE6UJiGKXQiRzY";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "HoGTIyWmPf";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://localhost:8081/thegrace/callback.jsp", "UTF-8");
    String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
        + "&client_id=" + clientId
        + "&client_secret=" + clientSecret
        + "&redirect_uri=" + redirectURI
        + "&code=" + code
        + "&state=" + state
        + "&prompt=login"; // 항상 로그인 요구
    String accessToken = "";
    String refresh_token = "";
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      if (responseCode == 200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuilder res = new StringBuilder();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if (responseCode == 200) {
          // JSON 응답을 파싱하여 access token과 refresh token을 가져옴
          JSONObject jsonResponse = new JSONObject(res.toString());
          accessToken = jsonResponse.getString("access_token");
          refresh_token = jsonResponse.getString("refresh_token"); // 필요 시 refresh token도 가져올 수 있음
          int expiresIn = jsonResponse.getInt("expires_in"); // 만료 시간(초)
          
          session = request.getSession();
          session.setAttribute("accessToken", accessToken);
          
          out.println("Access Token: " + accessToken); // 확인을 위해 출력
          out.println("Refresh Token: " + refresh_token); // 필요 시 출력
      }
  } catch (Exception e) {
      // Exception 로깅
      System.out.println(e);
  }
      System.out.println(accessToken);
      
%>

<%
    // JSP에서 accessToken을 저장한 후 AccessTokenServlet으로 리다이렉트
    response.sendRedirect("AccessToken");
%>


  
  

</body>
</html>