<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.MovieInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 검색</title>

<style>
	body {
		background-color: #f0f0f0;
	}
	.page {
		text-align:center;
		width:600px;
		height:75px;
		margin: 0 auto;
	}
	
	.result-area {
		margin-top:20px;
		background-color: rgba(256,256,256,0.8);
		width:500px;
		height:350px;
		padding:10px;
		border-radius: 10px;
		margin: 0 auto;
		overflow-y: auto; /* 스크롤 가능하게 설정 */
	}
	
	.poster {
		width:100px;
	}
	
	td {
		padding:5px;
	}


</style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<div class="page">
		<h5>영화의 제목을 검색하세요</h5>
		<input id="searchText" type="text">
		<button id="searching">검색</button>
	</div>
		<hr>
	<div class="result-area" id="results">
		
		
	</div>
	
	
	
	
	
	
	<script>
	
	const searchButton = document.getElementById('searching');
    const searchInput = document.getElementById('searchText');
    const resultsDiv = document.getElementById('results');

    searchButton.addEventListener('click', function() {
        const query = searchInput.value.trim();
        console.log(query);
        resultsDiv.innerHTML = ''; // 이전 검색 결과 초기화
        $.ajax({
			url: "/thegrace/search", //요청경로
			type: "get",//요청방식
			data: {"query":query},
			success:printList,
			error : function(){
				alert("통신 실패")
			}
		})
    });
    

	
	function printList(data){
		console.log("printList 실행")
		var data = JSON.parse(data);
		var html = "<table>"; //id=list 라는 곳에 추가가 될 html 코드
		html += "<tr><th>포스터</th><th>Code</th><th>영화 제목</th></tr>";
		
		for(var search of data) {
	    	html += "<tr onclick='send("+search.mv_cd+",\""+search.mv_title+"\")'>"
	    	html += "<td> <img class='poster' src='" +search.mv_poster+"'></td>"	
	    	html += "<td class='mv_cd'>" +search.mv_cd+"</td>"	
	    	html += "<td class='mv_title'>" +search.mv_title+"</td>"	
	      	html += "</tr>"
	    }
	
		//html():특정태그사이에 html코드를 바꾸고 싶을 때
		//text() : text 바꾸고 싶을 때
		//append() :특정태그 사이에 값을 추가(뒤에)
		html += "</table>";
		$("#results").html(html)
		
	};
	
	function send(mv_cd,mv_title) {
		console.log(mv_cd,mv_title);
		opener.document.getElementById('mv_cd').value = mv_cd;
		opener.document.getElementById('exampleInputName1').value = mv_title;
		window.close();
	}

	
	
	</script>
</body>
</html>