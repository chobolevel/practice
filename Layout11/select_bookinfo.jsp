<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	int cnt = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select count(*) from bookinfo0531";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			cnt = rs.getInt(1);
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
<h2>도서 정보 목록</h2>
<p>총 <%=cnt %>권이 도서정보가 있습니다.</p>
<hr>
<table border = "1" id = "tab2">
<tr>
	<th>no</th>
	<th>도서코드</th>
	<th>저자</th>
	<th>도서명</th>
</tr>
<%
	pstmt = null;
	rs = null;
	sql = "select rownum, bookno, author, bookname from bookinfo0531 order by bookno";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String rownum = rs.getString(1);
			String bookno = rs.getString(2);
			String author = rs.getString(3);
			String bookname = rs.getString(4);
			%>
			<tr>
				<td><%=rownum %></td>
				<td><a href = "update_bookinfo.jsp?bookno=<%=bookno %>"><%=bookno %></a></td>
				<td><%=author %></td>
				<td><%=bookname %></td>
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
	<input class = "button" type = "button" value = "도서 정보 추가" onclick = "move()">
</div>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function move() {
	location.href = "insert_bookinfo.jsp";
}
</script>
</body>
</html>