<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String id = request.getParameter("id");
	String name = "";
	String dept = "";
	String position = "";
	String duty = "";
	String phone = "";
	String address = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from info0609 where id = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			name = rs.getString(2);
			dept = rs.getString(3);
			position = rs.getString(4);
			duty = rs.getString(5);
			phone = rs.getString(6);
			address = rs.getString(7);
		}
	}
	catch(SQLException e) {
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
<h2>인사관리 사원정보 수정 화면</h2>
<form name = "form" method = "post" action = "update_infoProcess.jsp">
<table border = "1" id = "tab1">
<tr>
	<th>사원번호</th>
	<td><input type = "text" name = "id" value = "<%=id %>"></td>
</tr>
<tr>
	<th>성명</th>
	<td><input type = "text" name = "name" value = "<%=name %>"></td>
</tr>
<tr>
	<th>소속부서</th>
	<td>
		<select name = "dept">
			<option value = "10" <%=dept.equals("10") ? "selected" : "" %>>인사부</option>
			<option value = "20" <%=dept.equals("20") ? "selected" : "" %>>기획부</option>
			<option value = "30" <%=dept.equals("30") ? "selected" : "" %>>홍보부</option>
			<option value = "40" <%=dept.equals("40") ? "selected" : "" %>>영업부</option>
			<option value = "50" <%=dept.equals("50") ? "selected" : "" %>>경리부</option>
		</select>
	</td>
</tr>
<tr>
	<th>직급</th>
	<td>
		<select name = "position">
			<option value = "1" <%=position.equals("1") ? "selected" : "" %>>1급</option>
			<option value = "2" <%=position.equals("2") ? "selected" : "" %>>2급</option>
			<option value = "3" <%=position.equals("3") ? "selected" : "" %>>3급</option>
			<option value = "4" <%=position.equals("4") ? "selected" : "" %>>4급</option>
			<option value = "5" <%=position.equals("5") ? "selected" : "" %>>5급</option>
		</select>
	</td>
</tr>
<tr>
	<th>직책</th>
	<td><input type = "text" name = "duty" value = "<%=duty %>"></td>
</tr>
<tr>
	<th>연락처</th>
	<td><input type = "text" name = "phone" value = "<%=phone %>"></td>
</tr>
<tr>
	<th>주소</th>
	<td><input type = "text" name = "address" value = "<%=address %>"></td>
</tr>
<tr>
	<td colspan = "2" align = "center">
		<input type = "button" value = "수정" onclick = "check()">
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
	if(document.form.name.value == "") {
		alert("성명이 입력되지 않았습니다.");
		document.form.name.focus();
	}
	else if(document.form.duty.value == "") {
		alert("직책이 입력되지 않았습니다.");
		document.form.duty.focus();
	}
	else if(document.form.phone.value == "") {
		alert("연락처가 입력되지 않았습니다.");
		document.form.phone.focus();
	}
	else if(document.form.address.value == "") {
		alert("주소가 입력되지 않았습니다.");
		document.form.address.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>