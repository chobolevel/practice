<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String duty = request.getParameter("duty");
	String phone = request.getParameter("phone");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "update person0526 set name = ?, dept = ?, position = ?, duty = ?, phone = ? where id = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, duty);
		pstmt.setString(5, phone);
		pstmt.setString(6, id);
		pstmt.executeUpdate();
		%>
		<script>
			alert("사원 정보 변경 성공");
			location.href = "select_person.jsp";
		</script>
		<%
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>