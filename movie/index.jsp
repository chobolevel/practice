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
	<div class = "poster">	
		<img name = "poster" src = "poster/movie1.jpg">
	</div>
	<div class = "description">
		<p>《마녀(魔女) Part2. The Other One》은
		 2022년 개봉한 대한민국의 미스터리, 액션 공포 영화이다.
		  박훈정이 감독과 각본을 맡았으며, 2018년 영화 《마녀》의 속편이다.</p>
	</div>
	<div class = "info">
		<input type = "radio" name = "movie" value = "1" onchange = "change()">마녀
		<input type = "radio" name = "movie" value = "2" onchange = "change()">어벤져스
		<input type = "radio" name = "movie" value = "3">기생충
		<input type = "radio" name = "movie" value = "4">명량
		<input type = "radio" name = "movie" value = "5">전우치
	</div>
</div>
</section>
<script>
function change() {
	var arr = document.getElementsByName("movie");
	if(arr[0].checked == true) {
		document.getElementsByName("poster").src = "poster/movie1.jpg";
	}
	else if(arr[1].checked == true) {
		alert("어벤져스");
		document.getElementsByName("poster").src = "poster/movie2.jpg"; 
	}
	else {
		alert("다른 영화");
	}
}
</script>
</body>
</html>