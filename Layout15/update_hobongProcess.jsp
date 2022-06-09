<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String dunggub = request.getParameter("dunggub");
	String salary = request.getParameter("salary");
	PreparedStatement pstmt = null;
	String sql = "update hobong0609 set salary = ? where dunggub = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, salary);
		pstmt.setString(2, dunggub);
		pstmt.executeUpdate();
		%>
		<script>
			alert("호봉 정보 수정 성공!");
			location.href = "select_hobong.jsp";
		</script>
		<%
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>