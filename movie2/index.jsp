<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4f485c5b0b.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "css/style.css">
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
			<article class = "preview">
				<video src = "img/preview.mp4" controls autoplay muted loop></video>
				<p>
				<span>마녀(魔女) Part2</span><br>
				대호, 낙원의밤<br>
				박훈정 감독 작품
				</p>
			</article>
			<article class = "rank">
				<h2>창원 시네마 영화 랭킹</h2>
				<ul>
					<li><img src = "img/movie1.jpg"><a href = "#">마녀2</a><button>상세보기</button><button>예매하기</button></li>
					<li><img src = "img/movie2.jpg"><a href = "#">어벤져스:엔드게임</a><button>상세보기</button><button>예매하기</button></li>
					<li><img src = "img/movie3.jpg"><a href = "#">기생충</a><button>상세보기</button><button>예매하기</button></li>
					<li><img src = "img/movie4.jpg"><a href = "#">명량</a><button>상세보기</button><button>예매하기</button></li>
					<li><img src = "img/movie5.jpg"><a href = "#">전우치</a><button>상세보기</button><button>예매하기</button></li>
				</ul>
			</article>
			<article class = "event">
				<h2>창원 시네마 이벤트</h2>
				<ul>
					<li><a href = "#">마녀2 무대인사 일정</a>
					<li><a href = "#">어벤져스 공식 굿즈 발매일</a>
					<li><a href = "#">영화관내 여행권을 찾아라!</a>
					<li><a href = "#">명량 1000만 기념 재방영</a>
					<li><a href = "#">전우치 무삭제본 방영 일정</a>
				</ul>
			</article>
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