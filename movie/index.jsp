<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/indexstyle.css">
</head>
<body>
<div id = "container">

<header>
<div id = "logo">
	<a href = "index.jsp">창원 시네마</a>
</div>
<div id = "top-menu">
	<ul>
		<li><a href = "#">로그인</a></li>
		<li><a href = "#">회원가입</a></li>
		<li><a href = "#">마이페이지</a></li>
	</ul>
</div>
</header>

<nav>
<ul id = "main-menu">
	<li><a href = "#">예매 하기</a></li>
	<li><a href = "#">현재상영 영화</a></li>
	<li><a href = "#">예매 관리</a>
		<ul id = "sub-menu">
			<li><a href = "#">예매 확인</a>
			<li><a href = "#">예매 변경</a>
			<li><a href = "#">예매 취소</a>
		</ul>
	</li>
	<li><a href = "#rank">영화 순위 보기</a></li>
	<li><a href = "#">이벤트</a></li>
	<li><a href = "#">문의 하기</a></li>
</ul>
</nav>

<section>
<div id = "main-content">
	<img src = "images/bg-img03.jpg">
	<img src = "images/bg-img04.jpg">
	<img src = "images/bg-img05.jpg">
	<img src = "images/bg-img06.jpg">
	<img src = "images/bg-img07.jpg">
	<button id = "prev">&lang;</button>
	<button id = "next">&rang;</button>
</div>
<div id = "sub-content">
	<div id = "rank">
		<h2>현재 영화 순위</h2>
		<ul>
			<li><img id = "poster" src = "poster/movie1.jpg"><span>1등(마녀2)</span></li>
			<li><img id = "poster" src = "poster/movie2.jpg"><span>2등(어벤져스)</span></li>
			<li><img id = "poster" src = "poster/movie3.jpg"><span>3등(기생충)</span></li>
		</ul>
	</div>
	<div id = "event">
		<h2>현재 진행 이벤트</h2>
		<ul id = "event-list">
			<li>마녀2 무대인사</li>
			<li>기생충 배우들의 온라인 팬미팅</li>
			<li>코로나 19 방역지침 변경</li>
			<li>토르2의 개봉일정 변경</li>
			<li>토르2 예매 인증 피규어 증정 이벤트</li>
		</ul>
	</div>
</div>
</section>

<footer>
<p>경남 창원시 의창구 ***동 // 문의 전화 010-1234-1231</p>
<p>프로젝트 제작자 : 강인재 // mail : rodaka123@naver.com</p>
<p>프로젝트 시작 : 2022-07-08</p>
<div id= "sns">
	<a href = "#"><img src = "images/sns-1.png"></a>
	<a href = "#"><img src = "images/sns-2.png"></a>
	<a href = "#"><img src = "images/sns-3.png"></a>
</div>
</footer>
<script>
var images = document.querySelectorAll("#main-content > img");
var prev = document.getElementById("prev");
var next = document.getElementById("next");

var current = 0;

showImages(current);
prev.onclick = prevImage;
next.onclick = nextImage;

function showImages(n) {
	for(var i = 0; i < images.length; i++) {
		images[i].style.display = "none";
	}
	images[n].style.display = "block";
}
function prevImage() {
	if(current > 0) current -= 1;
	else current = images.length - 1;
	showImages(current);
}
function nextImage() {
	if(current < images.length - 1) current += 1;
	else current = 0;
	showImages(current);
}
</script>
</div>
</body>
</html>