<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/myPage.css">
</head>
<body>

<div id = "container">

<header>
<div id = "logo">
	<a href = "index.jsp">창원 시네마</a>
</div>
<div id = "top-menu">
	<%
		String name = (String)session.getAttribute("signedName");
		String id = (String)session.getAttribute("signedId");
		if(name == null) {
			%>
			<ul>
				<li><a href = "login.jsp">로그인</a></li>
				<li><a href = "insert_member.jsp">회원가입</a></li>
				<li><a href = "myPage.jsp">마이페이지</a></li>
			</ul>
			<%
		}
		else {
			%>
			<ul>
				<li><a href = "logoutProcess.jsp" onclick = "if(!confirm('정말 로그아웃 하시겠습니까?')) return false;">로그아웃</a></li>
				<li><a href = "insert_member.jsp">회원가입</a></li>
				<li><a href = "myPage.jsp"><%=name %>님</a></li>
			</ul>
			<%
		}
	%>
	
</div>
</header>

<nav>
<ul id = "main-menu">
	<li><a href = "insert_movie.jsp">예매 하기</a></li>
	<li><a href = "#">현재상영 영화</a></li>
	<li><a href = "#">예매 관리</a>
		<ul id = "sub-menu">
			<li><a href = "#">예매 확인</a>
			<li><a href = "#">예매 변경</a>
			<li><a href = "#">예매 취소</a>
		</ul>
	</li>
	<li><a href = "#rank">영화 순위 보기</a></li>
	<li><a href = "#event">이벤트</a></li>
	<li><a href = "#">문의 하기</a></li>
</ul>
</nav>

<section>
	<div id = "info">
		<img src = "images/user.jpg">
			<div id = "id">
				<p class = "id" ><%=name %>님<span style = "font-size : 20px;">(<%=id %>)</span></p>
				<p>고객님은 <span style = "text-decoration : underline; font-weight : 500;">브론즈</span> 등급입니다.</p>
			</div>
			<div id = "point">
				<h2>현재 창원 시네마 포인트</h2>
				<p>총 포인트 : P</p>
				<p>현재 포인트 : P</p>
				<p>사용한 포인트 : P</p>
			</div>
			<a class = "update" href = "update_myPage.jsp">정보 수정</a>
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

</div>

</body>
</html>