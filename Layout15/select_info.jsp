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
<h2>사원 정보 조회</h2>
<table border = "1" id = "tab2">
<tr>
	<th>no</th>
	<th>사번</th>
	<th>성명</th>
	<th>직급</th>
	<th>직책</th>
	<th>연락처</th>
	<th>소속부서</th>
	<th>주소</th>
</tr>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from info0609";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		while(rs.next()) {
			int cnt = count++;
			String id = rs.getString(1);
			String name = rs.getString(2);
			String dept = rs.getString(3);
			if(dept.equals("10")) {
				dept = "인사부";
			}
			else if(dept.equals("20")) {
				dept = "기획부";
			}
			else if(dept.equals("30")) {
				dept = "홍보부";
			}
			else if(dept.equals("40")) {
				dept = "영업부";
			}
			else if(dept.equals("50")) {
				dept = "경리부";
			}
			else {
				dept = "부서없음";
			}
			String position = rs.getString(4);
			String duty = rs.getString(5);
			String phone = rs.getString(6);
			String address = rs.getString(7);
			%>
			<tr>
				<td><%=cnt %></td>
				<td><a href = "update_info.jsp?id=<%=id %>"><%=id %></a></td>
				<td><%=name %></td>
				<td><%=position %></td>
				<td><%=duty %></td>
				<td><%=phone %></td>
				<td><%=dept %></td>
				<td><%=address %></td>
			</tr>
			<%
		}
	}
	catch(SQLException e) {
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