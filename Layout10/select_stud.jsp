<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	int cnt = 0;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select count(*) from stud0530";
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
<h2>학사 정보 목록</h2>
<p>총 <%=cnt %>명의 학사정보가 있습니다.</p>
<table border = "1" id = "tab1">
<tr>
	<th>학번</th>
	<th>성명</th>
	<th>학과</th>
	<th>학년</th>
	<th>주소</th>
	<th>연락처</th>
	<th>취미</th>
	<th>관리</th>
</tr>
<%
	sql = "select * from stud0530 order by studno";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String studno = rs.getString(1);
			String name = rs.getString(2);
			String dept = rs.getString(3);
			String position = rs.getString(4);
			String address = rs.getString(5);
			String phone = rs.getString(6);
			String hobby = rs.getString(7);
			%>
			<tr>
				<td><%=studno %></td>
				<td><%=name %></td>
				<td><%=dept %></td>
				<td><%=position %></td>
				<td><%=address %></td>
				<td><%=phone %></td>
				<td><%=hobby %></td>
				<td>
					<a href = "update_stud.jsp?studno=<%=studno %>">수정</a> / 
					<a href = "delete_studProcess.jsp?studno=<%=studno %>" onclick = "if(!confirm('정말 삭세하시겠습니까?')) return false;">삭제</a>
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
	<input class = "button" type = "button" value = "학사정보 추가" onclick = "move()">
</div>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function move() {
	location.href = "insert_stud.jsp";
}
</script>
</body>
</html>