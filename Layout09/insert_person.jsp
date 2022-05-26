<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String id = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select person_seq.nextval from dual";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			id = rs.getString(1);
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
<h2>인사관리 사원등록 화면</h2>
<hr>
<form name = "form" method = "post" action = "insert_perosnProcess.jsp">
<table border = "1" id = "tab1">
<tr>
	<th>사원번호</th>
	<td><input type = "text" name = "id" value = "<%=id %>"></td>
</tr>
<tr>
	<th>성명</th>
	<td><input type = "text" name = "name"></td>
</tr>
<tr>
	<th>소속부서</th>
	<td>
		<select name = "dept">
			<option value = "인사부">인사부</option>
			<option value = "기획부">기획부</option>
			<option value = "홍보부">홍보부</option>
			<option value = "영업부">영업부</option>
			<option value = "경리부">경리부</option>
		</select>
	</td>
</tr>
<tr>
	<th>직급</th>
	<td>
		<select name = "position">
			<option value = "1">1급</option>
			<option value = "2">2급</option>
			<option value = "3">3급</option>
			<option value = "4">4급</option>
		</select>
	</td>
</tr>
<tr>
	<th>직책</th>
	<td><input type = "text" name = "duty"></td>
</tr>
<tr>
	<th>연락처</th>
	<td><input type = "text" name = "phone"></td>
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
	location.href = "select_person.jsp";
}
function check() {
	if(!document.form.id.value || document.form.id.value == "") {
		alert("사번이 입력되지 않았습니다.");
		document.form.id.focus();
	}
	else if(!document.form.name.value || document.form.name.value == "") {
		alert("성명이 입력되지 않았습니다.");
		document.form.name.focus();
	}
	else if(!document.form.dept.value || document.form.dept.value == "") {
		alert("소속부서가 입력되지 않았습니다.");
		document.form.dept.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>