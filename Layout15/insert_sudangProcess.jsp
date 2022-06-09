<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String id = request.getParameter("id");
	String gajok = request.getParameter("gajok");
	String jikchak = request.getParameter("jikchak");
	String gunsok = request.getParameter("gunsok");
	String gitasudang = request.getParameter("gitasudang");
	PreparedStatement pstmt = null;
	String sql = "insert into sudang0609 values(?, ?, ?, ?, ?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, gajok);
		pstmt.setString(3, jikchak);
		pstmt.setString(4, gunsok);
		pstmt.setString(5, gitasudang);
		pstmt.executeUpdate();
		%>
		<script>
			alert("수당 정보 등록 성공!");
			location.href = "select_sudang.jsp";
		</script>
		<%
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>