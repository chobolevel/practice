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
<h2>수당 정보 조회</h2>
<table border = "1" id = "tab5">
<tr>
	<th>no</th>
	<th>사원번호</th>
	<th>이름</th>
	<th>가족수당</th>
	<th>직책수당</th>
	<th>근속수당</th>
	<th>기타수당</th>
	<th>수당합계</th>
	<th>구분</th>
</tr>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select a.id, b.name, a.gajok, a.jikchak, a.gunsok, a.gitasudang from sudang0609 a, info0609 b where a.id = b.id";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		int count = 1;
		while(rs.next()) {
			int cnt = count++;
			String id = rs.getString(1);
			String name = rs.getString(2);
			int gajok = rs.getInt(3);
			int jikchak = rs.getInt(4);
			int gunsok = rs.getInt(5);
			int gitasudang = rs.getInt(6);
			int sum = gajok + jikchak + gunsok + gitasudang;
			%>
			<tr>
				<td><%=cnt %></td>
				<td><%=id %></td>
				<td><%=name %></td>
				<td class = "r"><%=String.format("%,d", gajok ) %></td>
				<td class = "r"><%=String.format("%,d", jikchak ) %></td>
				<td class = "r"><%=String.format("%,d", gunsok) %></td>
				<td class = "r"><%=String.format("%,d", gitasudang ) %></td>
				<td class = "r"><%=String.format("%,d", sum) %></td>
				<td>
					<a href = "update_sudang.jsp?id=<%=id %>">수정</a> / 
					<a href = "delete_sudangProcess.jsp?id=<%=id %>" onclick = "if(!confirm('정말 삭제하시겠습니까?')) return false;">삭제</a>
				</td>
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