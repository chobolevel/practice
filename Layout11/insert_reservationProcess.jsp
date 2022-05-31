<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String lentno = request.getParameter("lentno");
	String custname = request.getParameter("custname");
	String bookno = request.getParameter("bookno");
	String outdate = request.getParameter("outdate");
	String indate = request.getParameter("indate");
	String status = request.getParameter("status");
	String Class = request.getParameter("class");
	PreparedStatement pstmt = null;
	String sql = "insert into reservation0531 values(?, ?, ?, ?, ?, ?, ?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, lentno);
		pstmt.setString(2, custname);
		pstmt.setString(3, bookno);
		pstmt.setString(4, outdate);
		pstmt.setString(5, indate);
		pstmt.setString(6, status);
		pstmt.setString(7, Class);
		pstmt.executeUpdate();
		%>
		<script>
			alert("등록이 완료되었습니다.");
			location.href = "select_reservation.jsp";
		</script>
		<%
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>