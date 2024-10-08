<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="write">
	영화코드 : <input type="text"> <br>
	영화 평점 : <input type="text"> <br>
	리뷰 내용 <br>
	<textarea rows="10" class="form-control" name="content"></textarea><br>
	관람일자 : <input type="date"> <br>
	공개여부 : 공개 <input type="radio" name="" value="공개">  비공개<input type="radio" name="" value="비공개"><br>
	이미지 첨부 : <input type="file" class="form-control" name="img"><br>
	긍정 부정 : 긍정 <input type="radio" name="" value="긍정">  부정<input type="radio" name="" value="부정"><br>
	<button type="submit">작성</button>
	<button type="reset">리셋</button>
	
	<!-- id는 세션에서 받아서 넘기기 -->
	





</form>





</body>
</html>