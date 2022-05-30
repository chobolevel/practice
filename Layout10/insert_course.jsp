<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
<%@include file = "header.jsp" %>
</header>

<nav>
<%@include file = "nav.jsp" %>
</nav>

<section>
<h2>교과목 추가</h2>
<form name = "form" method = "post" action = "insert_courseProcess.jsp">
<table border = "1" id = "tab2">
<tr>
	<th>교과목 코드</th>
	<td><input type = "text" name = "id"></td>
</tr>
<tr>
	<th>과목명</th>
	<td><input type = "text" name = "name"></td>
</tr>
<tr>
	<th>학점</th>
	<td><input type = "text" name = "credit"></td>
</tr>
<tr>
	<th>담당강사</th>
	<td>
		<select name = "lecturer">
			<option value = "">담당강사 선택</option>
			<option value = "1">김교수</option>
			<option value = "2">이교수</option>
			<option value = "3">박교수</option>
			<option value = "4">우교수</option>
			<option value = "5">최교수</option>
			<option value = "6">강교수</option>
			<option value = "7">황교수</option>
		</select>
	</td>
</tr>
<tr>
	<th>요일</th>
	<td>
		<input type = "radio" name = "week" value = "1" checked>월
		<input type = "radio" name = "week" value = "2">화
		<input type = "radio" name = "week" value = "3">수
		<input type = "radio" name = "week" value = "4">목
		<input type = "radio" name = "week" value = "5">금
		<input type = "radio" name = "week" value = "6">토
	</td>
</tr>
<tr>
	<th>시작</th>
	<td><input type = "text" name = "start_hour"></td>
</tr>
<tr>
	<th>종료</th>
	<td><input type = "text" name = "end_hour"></td>
</tr>
<tr>
	<td colspan = "2" align = "center">
		<input type = "button" value = "목록" onclick = "move()">
		<input type = "button" value = "등록" onclick = "check()">
	</td>
</tr>
</table>
</form>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function move() {
	location.href = "select_course.jsp";
}
function check() {
	if(!document.form.id.value || document.form.id.value == "") {
		alert("교과목 코드가 입력되지 않았습니다.");
		document.form.id.focus();
	}
	else if(!document.form.name.value || document.form.name.value == "") {
		alert("과목명이 입력되지 않았습니다.");
		document.form.name.focus();
	}
	else if(!document.form.credit.value || document.form.credit.value == "") {
		alert("학점이 입력되지 않았습니다.");
		document.form.credit.focus();
	}
	else if(!document.form.lecturer.value || document.form.lecturer.value == "") {
		alert("담당강사가 선택되지 않았습니다.");
		document.form.lecturer.focus();
	}
	else if(!document.form.start_hour.value || document.form.start_hour.value == "") {
		alert("시작시간이 입력되지 않았습니다.");
		document.form.start_hour.focus();
	}
	else if(!document.form.end_hour.value || document.form.end_hour.value == "") {
		alert("종료시간이 입력되지 않았습니다.");
		document.form.end_hour.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>