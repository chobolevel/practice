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
<h2>인사관리 호봉 등록 화면</h2>
<form name = "form" method = "post" action = "insert_hobongProcess.jsp">
<table border = "1" id = "tab1">
<tr>
	<th>직급</th>
	<td>
		<select name = "dunggub">
			<option value = "1">1급</option>
			<option value = "2">2급</option>
			<option value = "3">3급</option>
			<option value = "4">4급</option>
			<option value = "5">5급</option>
		</select>
	</td>
</tr>
<tr>
	<th>급여</th>
	<td><input type = "text" name = "salary"></td>
</tr>
<tr>
	<td colspan = "2" align = "center">
		<input type = "button" value = "등록" onclick = "check()">
		<input type = "button" value = "취소" onclick = "move()">
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
	location.href = "index.jsp";
}
function check() {
	if(document.form.salary.value == "") {
		alert("급여가 입력되지 않았습니다.");
		document.form.salary.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>