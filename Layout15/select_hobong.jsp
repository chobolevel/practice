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
<h2>호봉 정보 조회</h2>
<hr>
<table border = "1" id = "tab3">
<tr>
	<th>no</th>
	<th>등급</th>
	<th>급여</th>
</tr>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from hobong0609";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		while(rs.next()) {
			int cnt = count++;
			String dunggub = rs.getString(1);
			String salary = rs.getString(2);
			%>
			<tr>
				<td><%=cnt %></td>
				<td><a href = "update_hobong.jsp?dunggub=<%=dunggub %>"><%=dunggub + "급" %></a></td>
				<td><%=salary %></td>
			</tr>
			<%
		}
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>

</table>
<hr>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>

</body>
</html>