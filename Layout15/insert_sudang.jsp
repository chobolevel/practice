<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>
    
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
<%
	String id = request.getParameter("id");
	String name = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select name from info0609 where id = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			name = rs.getString(1);
		}
		else if(id == null) {
			id = "";
		}
		else {
			%>
			<script>
				alert("등록되어 있지 않는 사원번호 입니다.");
				history.back(-1);
			</script>
			<%
		}
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>
<h2>수당 정보 등록</h2>
<form name = "form" method = "post" action = "insert_sudang.jsp">
<table border = "1" id = "tab4">
<tr>
	<th>사원번호</th>
	<td><input type = "text" name = "id" onchange = "id_change()" value = "<%=id %>"></td>
	<th>이름</th>
	<td><input type = "text" name = "name" value = "<%=name %>"></td>
</tr>
<tr>
	<th>가족수당</th>
	<td><input type = "text" name = "gajok"></td>
	<th>직책수당</th>
	<td><input type = "text" name = "jikchak"></td>
</tr>
<tr>
	<th>근속수당</th>
	<td><input type = "text" name = "gunsok"></td>
</tr>
<tr>
	<th>기타수당</th>
	<td colspan = "3">
		<input type = "text" name = "gitasudang">
	</td>
</tr>
<tr>
	<td colspan = "4" align = "center">
		<input type = "button" value = "목록" onclick = "move()">
		<input type = "button" value = "저장" onclick = "check()">
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
	location.href = "select_sudang.jsp";
}
function check() {
	if(document.form.id.value == "") {
		alert("사원번호가 입력되지 않았습니다.");
		document.form.id.focus();
	}
	else if(document.form.gajok.value == "") {
		alert("가족수당이 입력되지 않았습니다.");
		document.form.gajok.focus();
	}
	else if(document.form.jikchak.value == "") {
		alert("직책수당이 입력되지 않았습니다.");
		document.form.jikchak.focus();
	}
	else if(document.form.gunsok.value == "") {
		alert("근속수당이 입력되지 않았습니다.");
		document.form.gunsok.focus();
	}
	else if(document.form.gitasudang.value == "") {
		alert("기타수당이 입력되지 않았습니다.");
		document.form.gitasudang.focus();
	}
	else {
		form.action = "insert_sudangProcess.jsp";
		document.form.submit();
	}
}
function id_change() {
	document.form.submit();
}
</script>
</body>
</html>