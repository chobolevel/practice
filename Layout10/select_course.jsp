<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	int cnt = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select count(*) from course0530";
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
<h2>교과목 목록</h2>
<p>총 <%=cnt %>개의 교과목이 있습니다.</p>
<table border = "1" id = "tab1">
<tr>
	<th>과목코드</th>
	<th>과목명</th>
	<th>학점</th>
	<th>담당강사</th>
	<th>요일</th>
	<th>시작시간</th>
	<th>종료시간</th>
	<th>관리</th>
</tr>
<%
	sql = "select a.id, a.name, a.credit, b.name, a.week, a.start_hour, a.end_hour from course0530 a, lecturer0530 b where a.lecturer = b.idx";
 	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String id = rs.getString(1);
			String name = rs.getString(2);
			String credit = rs.getString(3);
			String lecturer = rs.getString(4);
			String week = rs.getString(5);
			String start_hour = rs.getString(6);
			String end_hour = rs.getString(7);
			%>
			<tr>
				<td><%=id %></td>
				<td><%=name %></td>
				<td><%=credit %></td>
				<td><%=lecturer %></td>
				<td><%=week %></td>
				<td><%=start_hour %></td>
				<td><%=end_hour %></td>
				<td>
					<a href = "update_course.jsp?id=<%=id %>">수정</a> / 
					<a href = "delete_courseProcess.jsp?id=<%=id %>" onclick = "if(!confirm('정말 삭제하시겠습니까?')) return false;">삭제</a>
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
	location.href = "insert_course.jsp";
}
</script>
</body>
</html>