<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	int cnt = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select count(*) from reservation0531";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt(1);
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
<h2>도서 예약 정보 조회</h2>
<p>총 <%=cnt %>권이 도서 예약 정보가 있습니다.</p>
<table border = "1" id = "tab4" >
<tr>
	<th>no</th>
	<th>대출번호</th>
	<th>고객성명</th>
	<th>도서코드</th>
	<th>도서명</th>
	<th>대출일자</th>
	<th>반납일자</th>
	<th>대출상태</th>
	<th>등급</th>
</tr>
<%
	sql = "select rownum, a.lentno, a.custname, a.bookno, b.bookname, to_char(a.outdate, 'YYYY-MM-DD'), to_char(a.indate, 'YYYY-MM-DD'), a.status, a.class from reservation0531 a, bookinfo0531 b where a.bookno = b.bookno order by a.bookno";
 	try {
 		pstmt = conn.prepareStatement(sql);
 		rs = pstmt.executeQuery();
 		while(rs.next()) {
 			String rownum = rs.getString(1);
 			String lentno = rs.getString(2);
 			String custname = rs.getString(3);
 			String bookno = rs.getString(4);
 			String bookname = rs.getString(5);
 			String outdate = rs.getString(6);
 			String indate = rs.getString(7);
 			String status = rs.getString(8);
 			String Class = rs.getString(9);
 			%>
 			<tr>
				<td><%=rownum %></td>
				<td><a href = "update_reservation.jsp?lentno=<%=lentno %>"><%=lentno %></a></td>
				<td><%=custname %></td>
				<td><%=bookno %></td>
				<td><%=bookname %></td>
				<td><%=outdate %></td>
				<td><%=indate %></td>
				<td><%=status %></td>
				<td><%=Class %></td>
			</tr>
 			<%
 		}
 	}
 	catch (SQLException e) {
 		e.printStackTrace();
 	}
%>

</table>
<div align = "center">
	<input class = "button" type = "button" value = "예약 정보 추가" onclick = "move()">
</div>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function move() {
	location.href = "insert_reservation.jsp";
}
</script>
</body>
</html>