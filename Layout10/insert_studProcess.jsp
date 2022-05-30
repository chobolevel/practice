<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String studno = request.getParameter("studno");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String[] arr = request.getParameterValues("hobby");
	String hobby = "";
	for(int i = 0; i < arr.length; i++) {
		if(arr.length == 1) {
			hobby += arr[i];
		}
		else {
			hobby += arr[i] + ", ";
		}
	}
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	PreparedStatement pstmt = null;
	String sql = "insert into stud0530 values(?, ?, ?, ?, ?, ?, ?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, address);
		pstmt.setString(6, phone);
		pstmt.setString(7, hobby);
		pstmt.executeUpdate();
		%>
		<script>
			alert("완료되었습니다.");
			location.href = "select_stud.jsp";
		</script>
		<%
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>