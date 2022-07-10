<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/loginstyle.css">
</head>
<body>

<div id = "container">
		<h1>LOGIN</h1>
		<div id = "log">
			<form name = "form" method = "post" action = "login_Process.jsp">
			<div id = "input_id">
				<input type = "text" name = "id" id = "id">
				<label for = "id">USER_ID</label>
			</div>
			<div id = "input_pass">
				<input type = "password" name = "password" id = "password">
				<label for = "password">PASSWORD</label>
			</div>
			<div id = "submit">
				<input type = "button" value = "로그인" onclick = "check()">
			</div>
			</form>
			<a href = "select_info.jsp">아이디/비밀번호 찾기</a>
			<a href = "insert_member.jsp">회원가입</a>
		</div>
</div>
<script>
function check() {
	if(document.form.id.value == "") {
		alert("아이디가 입력되지 않았습니다.");
		document.form.id.focus();
	}
	else if(document.form.password.value == "") {
		alert("비밀번호가 입력되지 않았습니다.");
		document.form.password.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>