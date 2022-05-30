<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	int cnt = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select count(*) from lecturer0530";
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
<h2>강사 목록</h2>
<p>총 <%=cnt %>명의 강사가 있습니다.</p>
<table border = "1" id = "tab1">
<tr>
	<th>강사코드<th>
	<th>강사명<th>
	<th>전공<th>
	<th>세부전공<th>
	<th>관리<th>
</tr>
<%
	sql = "select * from lecturer0530";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String idx = rs.getString(1);
			String name = rs.getString(2);
			String major = rs.getString(3);
			String field = rs.getString(4);
			%>
			<tr>
				<td><%=idx %></td>
				<td><%=name %></td>
				<td><%=major %></td>
				<td><%=field %></td>
				<td>
					<a href = "update_lecturer.jsp?idx=<%=idx %>">수정</a> / 
					<a href = "delete_lecturerProcess.jsp?idx=<%=idx %>"onclick = "if(!confirm('정말 삭제하시겠습니까?')) return false;">삭제</a>
				</td>
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
	<input class = "button" type = "button" value = "작성" onclick = "move()">
</div>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function move() {
	location.href = "insert_lecturer.jsp";
}
</script>
</body>
</html>