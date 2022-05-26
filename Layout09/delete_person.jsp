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
<h2>인사관리 사원정보삭제 화면</h2>
<form name = "form" method = "post" action = "delete_personProcess.jsp" >
<table border = "1" id = "tab3">
<tr>
	<th>성명</th>
	<td><input type = "text" name = "name"></td>
</tr>
<tr>
	<th>사원번호</th>
	<td><input type = "text" name = "id"></td>
</tr>
<tr>
	<td colspan = "2" align = "center">
		<input type = "button" value = "삭제" onclick = "check()">
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
	location.href = "select_person.jsp";
}
function check() {
	if(!document.form.name.value || document.form.name.value == "") {
		alert("성명이 입력되지 않았습니다.");
		document.form.name.focus();
	}
	else if(!document.form.id.value || document.form.id.value == "") {
		alert("사원번호가 입력되지 않았습니다.");
		document.form.id.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>