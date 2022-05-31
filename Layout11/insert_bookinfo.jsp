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
<h2>도서 정보 등록 화면</h2>
<form name = "form" method = "post" action = "insert_bookinfoProcess.jsp">
<table border = "1" id = "tab1">
<tr>
	<th>도서코드</th>
	<td><input type = "text" name = "bookno"></td>
</tr>
<tr>
	<th>저자</th>
	<td><input type = "text" name = "author"></td>
</tr>
<tr>
	<th>도서이름</th>
	<td><input type = "text" name = "bookname" ></td>
</tr>
<tr>
	<td colspan = "2" align = "center">
		<input type = "button" value = "등록" onclick = "check()">
		<input type = "reset" value = "취소">
	</td>
</tr>
</table>
</form>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function check() {
	if(!document.form.bookno.value || document.form.bookno.value == "") {
		alert("도서코드가 입력되지 않았습니다.");
		document.form.bookno.focus();
	}
	else if(!document.form.author.value || document.form.author.value == "") {
		alert("저자가 입력되지 않았습니다.");
		document.form.author.focus();
	}
	else if(!document.form.bookname.value || document.form.bookname.value == "") {
		alert("도서이름이 입력되지 않았습니다.");
		document.form.bookname.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>