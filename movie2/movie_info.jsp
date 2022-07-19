<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://kit.fontawesome.com/4f485c5b0b.js" crossorigin="anonymous"></script>
<link rel = "stylesheet" href = "css/movie_info.css">
</head>
<body>
	<div class = "reserve">
		<a href = "insert_movie.jsp"><i class="fa-solid fa-ticket"><span>&nbsp;예매하기</span></i></a>
	</div>
	<div class = "container">
		<header>
			<a href = "index.jsp">창원 시네마</a>
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
					<li><a href = "logoutProcess.jsp">로그아웃</a></li>
					<li><a href = "insert_member.jsp">회원가입</a></li>
					<li><a href = "#"><%=nickname %>님</a></li>
					<li><a href = "#">고객센터</a></li>
				</ul>
				<%
			}
			%>
			
		</header>
		<nav>
			<ul class = "main-menu">
				<li><a href = "insert_movie.jsp">예매하기</a>
				<li><a href = "#">영화정보</a>
				<li><a href = "#">이벤트</a>
				<li><a href = "#">등급별 혜택</a>
				<li><a href = "#">포인트 샵</a>
			</ul>
		</nav>
		<section>
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from movie order by m_code";
			try {
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int count = 1;
				while(rs.next()) {
					int cnt = count++;
					String m_code = rs.getString(1);
					String m_name = rs.getString(2);
					String m_price = rs.getString(3);
					String m_director = rs.getString(4);
					String m_actor = rs.getString(5);
					String m_category = rs.getString(6);
					String m_duration = rs.getString(7);
					%>
					<article class = "info" id = "<%=m_code%>">
						<img class = "poster" src = "img/movie<%=cnt %>.jpg">
						<div class = "desc">
							<h2><%=m_name %></h2>
							<p>감독 : <%=m_director %></p>
							<p>출연 배우 : <%=m_actor %></p>
							<p>장르 : <%=m_category %></p>
							<p>상영시간 : <%=m_duration %>분</p>
							<a href = "insert_movie.jsp?movie=<%=m_code %>">예매하기</a>
						</div>
					</article>	
					<%
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
			}
		%>
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