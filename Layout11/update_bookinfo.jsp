<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String bookno = request.getParameter("bookno");
	String author = "";
	String bookname = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from bookinfo0531 where bookno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookno);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			author = rs.getString(2);
			bookname = rs.getString(3);
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>
    
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
<h2>도서 정보 수정 화면</h2>
<form name = "form" method = "post" action = "update_bookinfoProcess.jsp">
<table border = "1" id = "tab1">
<tr>
	<th>도서코드</th>
	<td><input type = "text" name = "bookno" value = "<%=bookno %>"></td>
</tr>
<tr>
	<th>저자</th>
	<td><input type = "text" name = "author" value = "<%=author %>"></td>
</tr>
<tr>
	<th>도서이름</th>
	<td><input type = "text" name = "bookname" value = "<%=bookname %>"></td>
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