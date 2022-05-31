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
	String lentno = request.getParameter("lentno");
	String custname = request.getParameter("custname");
	String bookno = request.getParameter("bookno");
	String bookname = "";
	String outdate = request.getParameter("outdate");
	String indate = request.getParameter("indate");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select bookname from bookinfo0531 where bookno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bookno);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			bookname = rs.getString(1);
		}
		else if(bookno == null) {
			bookno = "";
		}
		else {
			%>
			<script>
				alert("등록되어 있지 않는 도서코드 입니다.");
				history.back(-1);
			</script>
			<%
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>
<h2>도서 대출 예약 정보 등록 화면</h2>
<form name = "form" method = "post" action = "insert_reservation.jsp">
<table border = "1" id = "tab3">
<tr>
	<th>대출번호</th>
	<td><input type = "text" name = "lentno" value = "<%=(lentno == null) ? "" : lentno %>"></td>
	<th>고객성명</th>
	<td><input type = "text" name = "custname" value = "<%=(custname == null) ? "" : custname %>"></td>
</tr>
<tr>
	<th>도서코드</th>
	<td><input type = "text" name = "bookno" onchange = "no_change()" value = "<%=bookno %>"></td>
	<th>도서이름</th>
	<td><input type = "text" name = "bookname" value = "<%=bookname %>"></td>
</tr>
<tr>
	<th>대출일자</th>
	<td><input type = "text" name = "outdate" value = "<%=(outdate == null) ? "" : outdate %>"></td>
	<th>반납일자</th>
	<td><input type = "text" name = "indate" onchange = "date_change()" value = "<%=(indate == null) ? "" : indate %>"></td>
</tr>
<tr>
	<th>대출상태</th>
	<td>
		<input type = "radio" name = "status" value = "1" checked>대출
		<input type = "radio" name = "status" value = "2" <%if(indate != null && indate != "") out.print("checked"); %>>반납
	</td>
	<th>등급</th>
	<td>
		<select name = "class">
			<option value = "S">S</option>
			<option value = "A">A</option>
			<option value = "B">B</option>
			<option value = "C">C</option>
		</select>
	</td>
</tr>
<tr>
	<td colspan = "4" align = "center">
		<input type = "button" value = "저장" onclick = "check()">
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
	if(!document.form.lentno.value || document.form.lentno.value == "") {
		alert("대출번호가 입력되지 않았습니다.");
		document.form.lentno.focus();
	}
	else if(!document.form.custname.value || document.form.custname.value == "") {
		alert("고객성명이 입력되지 않았습니다.");
		document.form.custname.focus();
	}
	else if(!document.form.bookno.value || document.form.bookno.value == "") {
		alert("도서코드가 입력되지 않았습니다.");
		document.form.bookno.focus();
	}
	else if(!document.form.outdate.value || document.form.outdate.value == "") {
		alert("대출일자가 입력되지 않았습니다.");
		document.form.outdate.focus();
	}
	else {
		form.action = "insert_reservationProcess.jsp";
		document.form.submit();
	}
}
function no_change() {
	document.form.submit();
}
function date_change() {
	if(document.form.indate.value != "") {
		document.form.submit();
	}
}
</script>
</body>
</html>