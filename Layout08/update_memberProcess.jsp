<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");
	PreparedStatement pstmt = null;
	String sql = "update member0525 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, phone);
		pstmt.setString(3, address);
		pstmt.setString(4, joindate);
		pstmt.setString(5, grade);
		pstmt.setString(6, city);
		pstmt.setString(7, custno);
		pstmt.executeUpdate();
		%>
		<script>
			alert("회원정보 수정이 완료되었습니다.");
		</script>
		<%
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>