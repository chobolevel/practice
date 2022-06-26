<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel = "stylesheet" href = "style.css">
</head>
<body>

<section>
<div class = "container">
	<div id = "poster" class = "poster">	
		<img id = "photo" src = "poster/movie1.jpg">
		<div class = "description">
		<p id = "desc">《마녀(魔女) Part2. The Other One》은
		 2022년 개봉한 대한민국의 미스터리, 액션 공포 영화이다.
		  박훈정이 감독과 각본을 맡았으며, 2018년 영화 《마녀》의 속편이다.</p>
		</div>
	</div>
	<div class = "info">
		<div class = "select">
			<span>영화 선택</span>
			<select id = "select" name = "movie" onchange = "change()">
				<option value = "1">마녀(魔女) Part2. The Other One</option>
				<option value = "2">어벤져스 : 엔드게임(Avengers: Endgame)</option>
				<option value = "3">기생충(parasite)</option>
				<option value = "4">명량(鳴梁, Roaring Currents)</option>
				<option value = "5">전우치(jeon-uchi)</option>
			</select>
			<p>영화금액 : <span id = "price" >12000</span>원(1인기준)</p>
		</div>
		<div class = "seatState">
			<ul>
				<li><div class = "box"></div> =예약 좌석</li>
				<li><div class = "box"></div> =예매 가능</li>
				<li><div class = "box"></div> =선택 좌석</li>
			</ul>
		</div>
		<div class = "seat">
			<h2>좌석을 선택하세요</h2>
			<p style = "font-size:20px;margin:5px">[screen]</p>
			<p>&emsp;1&emsp;&emsp;2&emsp;&emsp;3&emsp;&emsp;4&emsp;&emsp;5&emsp;&emsp;6&emsp;&emsp;7</p>
			<%
				String[][] arr = new String[7][7];
				for(int i = 1; i <= 7; i++) {
					%>
					<span><%=i %></span>
					<%
					for(int j = 1; j <= 7; j++) {
						%>
						<label class = "lbl"><input name = "seat" type = "checkbox" value = "<%=i +"," + j %>" onchange = "choose()"></label>
						<%
					}
					%>
					<br>
					<%
				}
			%>
			<h3>총 금액 : <span id = "s_price"></span>원</h3>
			<div class = "but">
				<input type = "submit" value = "예매하기">
			</div>
		</div>
	</div>
	<div class = "footer">
		<p>영화관 전화번호  : 010-0000-1234 // 영화관 위치 : 경남 창원시 의창구</p>
	</div>
</div>
</section>
<script>
function change() {
	var movie = document.getElementById("select");
	if(movie.options[movie.selectedIndex].value == "1") {
		document.getElementById("photo").src = "poster/movie1.jpg";
		document.querySelector("#price").innerHTML = 12000;
		document.querySelector("#desc").innerHTML = "[마녀(魔女) Part2. The Other One]은 2022년 개봉한 대한민국의 미스터리, 액션 공포 영화이다. 박훈정이 감독과 각본을 맡았으며, 2018년 영화 《마녀》의 속편이다.";
	}
	else if(movie.options[movie.selectedIndex].value == "2") {
		document.getElementById("photo").src = "poster/movie2.jpg";
		document.querySelector("#price").innerHTML = 11000;
		document.querySelector("#desc").innerHTML = "어벤져스 실사영화 시리즈의 4번째 작품이자, 마블 시네마틱 유니버스의 스물 두번째 작품이며, 페이즈 3의 10번째 작품이자 지난 2008년, 아이언맨을 시작으로 장장 11년동안 이어져온 인피니티 사가를 마무리하는 작품";
	}
	else if(movie.options[movie.selectedIndex].value == "3") {
		document.getElementById("photo").src = "poster/movie3.jpg";
		document.querySelector("#price").innerHTML = 10000;
		document.querySelector("#desc").innerHTML = "2019년에 개봉한 봉준호 감독의 7번째 장편 영화. 상류층과 하류층, 두 가족의 만남을 다룬 대한민국의 블랙 코미디 가족 드라마 영화다.";
	}
	else if(movie.options[movie.selectedIndex].value == "4") {
		document.getElementById("photo").src = "poster/movie4.jpg";
		document.querySelector("#price").innerHTML = 9000;
		document.querySelector("#desc").innerHTML = "2014년에 개봉한, 이순신 장군의 명량 해전을 다룬 한국 영화이다. 감독은《최종병기 활》을 연출한 김한민. 원작은 박은우의 소설《명량》이며, 개봉 전 영화를 소설로 옮겨 각본 전철홍, 김한민, 지은이 김호경의《명량》이 출판되었다.";
	}
	else {
		document.getElementById("photo").src = "poster/movie5.jpg";
		document.querySelector("#price").innerHTML = 8000;
		document.querySelector("#desc").innerHTML = "조선시대 각종 기록에서 등장하는 기인으로 실존인물이자 고전 소설의 주인공이다. 호는 우사(羽士)이며 조선시대의 도사 및 마법사의 대표주자이기도 하다.(고려시대의 도사 선배(?)로 이영간이 있는데, 전우치와 비슷하게 실존 인물이다.";
	}
}
function choose() {
	var seat = document.getElementsByName("seat");
	var cnt = 0;
	for(var i = 0; i < seat.length; i++) {
		if(seat[i].checked == true) {
			cnt++;
		}
	}
	document.querySelector("#s_price").innerHTML = Number(document.getElementById("price").innerHTML) * cnt;
}
</script>
</body>
</html>