<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String id = request.getParameter("id");
	String name = "";
	String credit = "";
	String lecturer = "";
	String week = "";
	String start_hour = "";
	String end_hour = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from course0530 where id = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			name = rs.getString(2);
			credit = rs.getString(3);
			lecturer = rs.getString(4);
			week = rs.getString(5);
			start_hour = rs.getString(6);
			end_hour = rs.getString(7);
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
<h2>교과목 정보 수정</h2>
<form name = "form" method = "post" action = "update_courseProcess.jsp">
<table border = "1" id = "tab2">
<tr>
	<th>교과목 코드</th>
	<td><input type = "text" name = "id" value = "<%=id %>"></td>
</tr>
<tr>
	<th>과목명</th>
	<td><input type = "text" name = "name" value = "<%=name %>"></td>
</tr>
<tr>
	<th>학점</th>
	<td><input type = "text" name = "credit" value = "<%=credit %>"></td>
</tr>
<tr>
	<th>담당강사</th>
	<td>
		<select name = "lecturer">
			<option value = "">담당강사 선택</option>
			<option value = "1" <%=lecturer.equals("1") ? "selected" : "" %>>김교수</option>
			<option value = "2" <%=lecturer.equals("2") ? "selected" : "" %>>이교수</option>
			<option value = "3" <%=lecturer.equals("3") ? "selected" : "" %>>박교수</option>
			<option value = "4" <%=lecturer.equals("4") ? "selected" : "" %>>우교수</option>
			<option value = "5" <%=lecturer.equals("5") ? "selected" : "" %>>최교수</option>
			<option value = "6" <%=lecturer.equals("6") ? "selected" : "" %>>강교수</option>
			<option value = "7" <%=lecturer.equals("7") ? "selected" : "" %>>황교수</option>
		</select>
	</td>
</tr>
<tr>
	<th>요일</th>
	<td>
		<input type = "radio" name = "week" value = "1" <%=week.equals("1") ? "checked" : "" %>>월
		<input type = "radio" name = "week" value = "2" <%=week.equals("2") ? "checked" : "" %>>화
		<input type = "radio" name = "week" value = "3" <%=week.equals("3") ? "checked" : "" %>>수
		<input type = "radio" name = "week" value = "4" <%=week.equals("4") ? "checked" : "" %>>목
		<input type = "radio" name = "week" value = "5" <%=week.equals("5") ? "checked" : "" %>>금
		<input type = "radio" name = "week" value = "6" <%=week.equals("6") ? "checked" : "" %>>토
	</td>
</tr>
<tr>
	<th>시작</th>
	<td><input type = "text" name = "start_hour" value = "<%=start_hour %>"></td>
</tr>
<tr>
	<th>종료</th>
	<td><input type = "text" name = "end_hour" value = "<%=end_hour %>"></td>
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