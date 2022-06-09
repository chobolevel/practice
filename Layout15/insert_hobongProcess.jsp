<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String dunggub = request.getParameter("dunggub");
	String salary = request.getParameter("salary");
	PreparedStatement pstmt = null;
	String sql = "insert into hobong0609 values(?, ?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dunggub);
		pstmt.setString(2, salary);
		pstmt.executeUpdate();
		%>
		<script>
			alert("호봉 정보 등록 성공!");
			location.href = "select_hobong.jsp";
		</script>
		<%
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>