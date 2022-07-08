<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBConn.jsp" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String[] poster = {"poster/movie1.jpg", "poster/movie2.jpg", "poster/movie3.jpg", "poster/movie4.jpg", "poster/movie5.jpg"};
	String[] desc = {"마녀 Part2. The Other One은 2022년 개봉한 대한민국의 미스터리, 액션 공포 영화이다. 박훈정이 감독과 각본을 맡았으며, 2018년 영화 《마녀》의 속편이다.",
			"어벤져스 실사영화 시리즈의 4번째 작품이자, 마블 시네마틱 유니버스의 스물 두번째 작품이며, 페이즈 3의 10번째 작품이자 지난 2008년, 아이언맨을 시작으로 장장 11년동안 이어져온 인피니티 사가를 마무리하는 작품",
			"2019년에 개봉한 봉준호 감독의 7번째 장편 영화. 상류층과 하류층, 두 가족의 만남을 다룬 대한민국의 블랙 코미디 가족 드라마 영화다.",
			"2014년에 개봉한, 이순신 장군의 명량 해전을 다룬 한국 영화이다. 감독은《최종병기 활》을 연출한 김한민. 원작은 박은우의 소설《명량》이며, 개봉 전 영화를 소설로 옮겨 각본 전철홍, 김한민, 지은이 김호경의《명량》이 출판되었다.",
			"조선시대 각종 기록에서 등장하는 기인으로 실존인물이자 고전 소설의 주인공이다. 호는 우사(羽士)이며 조선시대의 도사 및 마법사의 대표주자이기도 하다.(고려시대의 도사 선배(?)로 이영간이 있는데, 전우치와 비슷하게 실존 인물이다."};
	int[] price = {12000, 11000, 10000, 9000, 8000};
	ArrayList<String> seat = new ArrayList<String> ();
	String m_code = request.getParameter("movie");
	if(m_code == null) m_code = "100";
	System.out.println(m_code);
	int idx = 0;
	switch(m_code) {
	case "100" :
		idx = 0;
		break;
	case "101" :
		idx = 1;
		break;
	case "102" :
		idx = 2;
		break;
	case "103" :
		idx = 3;
		break;
	default :
		idx = 4;
	}
	String sql = "select order_seat from m_order where m_code = '" + m_code + "'";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String[] s_arr = rs.getString(1).split(",");
			for(int i = 0; i < s_arr.length; i ++) {
				seat.add(s_arr[i]);
			}
		}
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "css/style.css">
<style>
/* 미디어 쿼리 넣기 */
</style>
</head>
<body>

<section>
<div class = "container">
	<div id = "poster" class = "poster">	
		<img id = "photo" src = "<%=poster[idx] %>">
		<div class = "description">
		<p id = "desc"><%=desc[idx] %></p>
		</div>
	</div>
	<div class = "info">
		<form name = "form" method = "post" action = "insert_movie.jsp">
		<div class = "select">
			<span>영화 선택</span>
			<select id = "select" name = "movie" onchange = "change()">
				<option value = "100" <%=m_code.equals("100") ? "selected" : "" %>>마녀(魔女) Part2. The Other One</option>
				<option value = "101" <%=m_code.equals("101") ? "selected" : "" %>>어벤져스 : 엔드게임(Avengers: Endgame)</option>
				<option value = "102" <%=m_code.equals("102") ? "selected" : "" %>>기생충(parasite)</option>
				<option value = "103" <%=m_code.equals("103") ? "selected" : "" %>>명량(鳴梁, Roaring Currents)</option>
				<option value = "104" <%=m_code.equals("104") ? "selected" : "" %>>전우치(jeon-uchi)</option>
			</select>
			<p>영화금액 : <span id = "price" ><%=price[idx] %></span>원(1인기준)</p>
		</div>
		<div class = "seatState">
			<ul>
				<li><div class = "box"></div> 예약 좌석</li>
				<li><div class = "box"></div> 예매 가능</li>
				<li><div class = "box"></div> 선택 좌석</li>
			</ul>
		</div>
		<div class = "seat">
			<h2>좌석을 선택하세요</h2>
			<div align = "center"><p style = "font-size:20px;margin:5px" class = "screen">[screen]</p></div>
			<p align = "center"><span style = "visibility:hidden;">2</span><span class = "cols">1</span><span class = "cols">2</span><span class = "cols">3</span><span class = "cols">4</span><span class = "cols">5</span><span class = "cols">6</span><span class = "cols">7</span></p>
			<%
				String[][] arr = new String[7][7];
				for(int i = 1; i <= 7; i++) {
					%>
					<span><%=i %></span>
					<%
					for(int j = 1; j <= 7; j++) {
						%>
						<input id = "<%=i + "-" + j %>" name = "seat" type = "checkbox" value = "<%=i +"-" + j %>" onchange = "choose()"  <%for(int k = 0; k < seat.size(); k++) if(seat.get(k).equals(i + "-" + j)) out.print("checked disabled"); %>>
						<label for = "<%=i + "-" + j %>" class = "lbl"><%=i + "-" + j %></label>
						<%
					}
					%>
					<br>
					<%
				}
			%>
			<h3>총 금액 : <span id = "s_price"></span>원</h3>
			<div class = "but">
				<input type = "button" value = "예매하기" onclick = "check()">
			</div>
		</div>
		</form>
	</div>
	<div class = "footer">
		<p>영화관 전화번호  : 010-0000-1234 // 영화관 위치 : 경남 창원시 의창구</p>
	</div>
</div>
</section>
<script>
function change() {
	document.form.submit();
}
function choose() {
	var seat = document.getElementsByName("seat");
	var cnt = 0;
	for(var i = 0; i < seat.length; i++) {
		if(seat[i].checked == true) {
			cnt++;
		}
	}
	for(var j = 0; j < seat.length; j++) {
		if(seat[j].disabled == true) {
			cnt--;
		}
	}
	document.querySelector("#s_price").innerHTML = Number(document.getElementById("price").innerHTML) * cnt;
}
function check() {
	var cnt = 0;
	var arr = document.getElementsByName("seat");
	for(var i = 0; i < arr.length; i++) {
		if(arr[i].checked == true) {
			cnt++;
			break;
		}
		for(var j = 0; j < arr.length; j++) {
			if(arr[j].disabled == true) {
				cnt--;
			}
		}
	}
	if(cnt == 0) {
		alert("최소 1자리 이상 선택해 주세요!");
		return false;
	}
	else {
		form.action = "insert_movieProcess.jsp";
		document.form.submit();
	}
}
</script>
</body>
</html>