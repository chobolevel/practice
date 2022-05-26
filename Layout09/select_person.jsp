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
<h2>직원 정보 조회</h2>
<hr>
<table border = "1" id = "tab2">
<tr>
	<th>no</th>
	<th>성명</th>
	<th>사번</th>
	<th>직급</th>
	<th>직책</th>
	<th>연락처</th>
	<th>소속부서</th>
</tr>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select rownum, name, id, position, duty, phone, dept from person0526";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			String rownum = rs.getString(1);
			String name = rs.getString(2);
			String id = rs.getString(3);
			String position = rs.getString(4);
			String duty = rs.getString(5);
			String phone = rs.getString(6);
			String dept = rs.getString(7);
			%>
			<tr>
				<td><%=rownum %></td>
				<td><%=name %></td>
				<td><a href = "update_person.jsp?id=<%=id %>"><%=id %></a></td>
				<td><%=position %></td>
				<td><%=duty %></td>
				<td><%=phone %></td>
				<td><%=dept %></td>
			</tr>
			<%
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>

</table>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>

</body>
</html>