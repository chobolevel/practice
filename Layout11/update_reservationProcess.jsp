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
	String sql = "update reservation0531 set custname = ?, bookno = ?, outdate = ?, indate = ?, status = ?, class = ? where lentno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, custname);
		pstmt.setString(2, bookno);
		pstmt.setString(3, outdate);
		pstmt.setString(4, indate);
		pstmt.setString(5, status);
		pstmt.setString(6, Class);
		pstmt.setString(7, lentno);
		pstmt.executeUpdate();
		%>
		<script>
			alert("예약 정보 수정 성공");
			location.href = "select_reservation.jsp";
		</script>
		<%
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>