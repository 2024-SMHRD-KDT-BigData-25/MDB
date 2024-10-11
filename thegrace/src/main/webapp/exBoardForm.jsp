<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="write" method="post" enctype="multipart/form-data">
	영화코드 : <input type="text" name="mv_cd"> <br>
	영화 평점 : <input type="text" name="mv_rating" > <br>
	리뷰 내용 <br>
	<textarea rows="10" class="form-control" name="review_content"></textarea><br>
	관람일자 : <input type="date" name="view_dt"> <br>
	공개여부 : 공개 <input type="radio" name="open_yn" value="Y">  비공개<input type="radio" name="open_yn" value="N"><br>
	이미지 첨부 : <input type="file" class="form-control" name="review_img"><br>
	긍정 부정 : 긍정 <input type="radio" name="pos_neg" value="P">  부정<input type="radio" name="pos_neg" value="N"><br>
	<input type="hidden" name="user_id" value="<%= session.getAttribute("userId") %>"> <!-- 세션에서 ID를 가져옴 -->
	<button type="submit">작성</button>
	<button type="reset">리셋</button>
	
	<!-- id는 세션에서 받아서 넘기기 -->
	





</form>





</body>
</html>