<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String bookno = request.getParameter("bookno");
	String author = request.getParameter("author");
	String bookname = request.getParameter("bookname");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "update bookinfo0531 set author = ?, bookname = ? where bookno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, author);
		pstmt.setString(2, bookname);
		pstmt.setString(3, bookno);
		pstmt.executeUpdate();
		%>
		<script>
			alert("도서 정보 변경  완료!");
			location.href = "select_bookinfo.jsp";
		</script>
		<%
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>