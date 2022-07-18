<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4f485c5b0b.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "css/insert_movie.css">
</head>
<body>

	<div class = "container">
		<header>
			<p>창원 시네마</p>
			<%
			String id = (String)session.getAttribute("signedId");
			String name = (String)session.getAttribute("signedName");
			String nickname = (String)session.getAttribute("signedNickname");
			if(nickname == null) {
				%>
				<ul class = "top-menu">
					<li><a href = "login.jsp">로그인</a></li>
					<li><a href = "insert_member.jsp">회원가입</a></li>
					<li><a href = "#">마이페이지</a></li>
					<li><a href = "#">고객센터</a></li>
				</ul>
				<%
			}
			else {
				%>
				<ul class = "top-menu">
					<li><a href = "#">로그아웃</a></li>
					<li><a href = "#">회원가입</a></li>
					<li><a href = "#"><%=nickname %>님</a></li>
					<li><a href = "#">고객센터</a></li>
				</ul>
				<%
			}
			%>
			
		</header>
		<nav>
			<ul class = "main-menu">
				<li><a href = "#">예매하기</a>
				<li><a href = "#">영화정보</a>
				<li><a href = "#">이벤트</a>
				<li><a href = "#">등급별 혜택</a>
				<li><a href = "#">포인트 샵</a>
			</ul>
		</nav>
		<section>
			<form name = "form" method = "post" action = "insert_movieProcess.jsp">
				<article class = "movie">
					<h2>영화</h2>
				</article>
				<article class = "time">
					<h2>시간대</h2>
					<ul>
						<li><input type = "radio" name = "time" id = "t1" value = "1000"><label for = "t1">10:00</label></li>
						<li><input type = "radio" name = "time" id = "t2" value = "1230"><label for = "t2">12:30</label></li>
						<li><input type = "radio" name = "time" id = "t3" value = "1540"><label for = "t3">15:40</label></li>
						<li><input type = "radio" name = "time" id = "t4" value = "1850"><label for = "t4">18:50</label></li>
						<li><input type = "radio" name = "time" id = "t5" value = "2125"><label for = "t5">21:25</label></li>
						<li><input type = "radio" name = "time" id = "t6" value = "2350"><label for = "t6">23:50</label></li>
					</ul>
				</article>
				<article class = "seat">
					<h2>좌석</h2>
				</article>
			</form>
		</section>
		<footer>
			<ul class = "contact">
				<li><a href = "#"><i class="fa-brands fa-instagram"></i> 인스타그램</a></li>
				<li><a href = "#"><i class="fa-brands fa-facebook-f"></i> 페이스북</a></li>
				<li><a href = "#"><i class="fa-brands fa-twitter"></i> 트위터</a></li>
			</ul>
			<p>프로젝트명 : 영화관 좌석 예매 사이트</p>
			<p>프로젝트 담당자 : 강인재</p>
			<p>연락처 : 010-9565-7072 이메일 : rodaka123@naver.com</p>
		</footer>
	</div>

</body>
</html>