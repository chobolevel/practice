<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "style.css">
</head>
<body>

<section>
<div class = "container">
	<div id = "poster" class = "poster">	
		<img id = "photo" src = "poster/movie1.jpg">
		<div class = "description">
		<p>《마녀(魔女) Part2. The Other One》은
		 2022년 개봉한 대한민국의 미스터리, 액션 공포 영화이다.
		  박훈정이 감독과 각본을 맡았으며, 2018년 영화 《마녀》의 속편이다.</p>
		</div>
	</div>
	<div class = "info">
		<div class = "select">
			<span>영화 선택</span>
			<select id = "select" name = "movie" onchange = "change()">
				<option value = "1">마녀</option>
				<option value = "2">어벤져스</option>
				<option value = "3">기생충</option>
				<option value = "4">명량</option>
				<option value = "5">전우치</option>
			</select>
			<p>영화금액 : <span id = "price" >12000</span>원</p>
		</div>
		<div class = "seatState">
			<ul>
				<li><div class = "box"></div>예약 좌석</li>
				<li><div class = "box"></div>예매 가능</li>
				<li><div class = "box"></div>선택 좌석</li>
			</ul>
		</div>
		<div class = "seat">
			<h2>좌석을 선택하세요</h2>
			<p>&emsp;1&emsp;&emsp;2&emsp;&emsp;3&emsp;&emsp;4&emsp;&emsp;5&emsp;&emsp;6&emsp;&emsp;7</p>
			<%
				String[][] arr = new String[7][7];
				for(int i = 1; i <= 7; i++) {
					%>
					<span><%=i %></span>
					<%
					for(int j = 1; j <= 7; j++) {
						%>
						<input name = "seat" type = "checkbox" value = "<%=i +"," + j %>" onchange = "choose()">
						<%
					}
					%>
					<br>
					<%
				}
			%>
			<h3>총 금액 : <span id = "s_price"></span>원</h3>
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
	}
	else if(movie.options[movie.selectedIndex].value == "2") {
		document.getElementById("photo").src = "poster/movie2.jpg";
		document.querySelector("#price").innerHTML = 11000;
	}
	else if(movie.options[movie.selectedIndex].value == "3") {
		document.getElementById("photo").src = "poster/movie3.jpg";
		document.querySelector("#price").innerHTML = 10000;
	}
	else if(movie.options[movie.selectedIndex].value == "4") {
		document.getElementById("photo").src = "poster/movie4.jpg";
		document.querySelector("#price").innerHTML = 9000;
	}
	else {
		document.getElementById("photo").src = "poster/movie5.jpg";
		document.querySelector("#price").innerHTML = 8000;
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