<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String studno = request.getParameter("studno");
	PreparedStatement pstmt = null;
	String sql = "delete from stud0530 where studno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		pstmt.executeUpdate();
		%>
		<script>
			alert("학사 정보 삭제 성공");
			location.href = "select_stud.jsp";
		</script>
		<%
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>