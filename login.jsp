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

<section>
<form name = "form" method = "post" action = "login_process.jsp">
<div>
<input type = "text" name = "id" placeholder = "아이디"><br>
<input type = "password" name = "pass" placeholder = "비밀번호"><br>
<input type = "button" value = "로그인" onclick = "check()">
<a href = "insert_member.jsp">회원가입</a>
<a href = "select_idpass.jsp">아이디/비밀번호 찾기</a>
</div>
</form>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>

</body>
</html>
