<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String dunggub = request.getParameter("dunggub");
	String salary = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select salary from hobong0609 where dunggub = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dunggub);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			salary = rs.getString(1);
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
<h2>인사관리 호봉 수정 화면</h2>
<form name = "form" method = "post" action = "update_hobongProcess.jsp">
<table border = "1" id = "tab1">
<tr>
	<th>직급</th>
	<td>
		<select name = "dunggub">
			<option value = "1" <%=dunggub.equals("1") ? "selected" : "" %>>1급</option>
			<option value = "2" <%=dunggub.equals("2") ? "selected" : "" %>>2급</option>
			<option value = "3" <%=dunggub.equals("3") ? "selected" : "" %>>3급</option>
			<option value = "4" <%=dunggub.equals("4") ? "selected" : "" %>>4급</option>
			<option value = "5" <%=dunggub.equals("5") ? "selected" : "" %>>5급</option>
		</select>
	</td>
</tr>
<tr>
	<th>급여</th>
	<td><input type = "text" name = "salary" value = "<%=salary %>"></td>
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