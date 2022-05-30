<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String studno = request.getParameter("studno");
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
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
	PreparedStatement pstmt = null;
	String sql = "update stud0530 set name = ?, dept = ?, position = ?, address = ?, phone = ?, hobby = ? where studno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, dept);
		pstmt.setString(3, position);
		pstmt.setString(4, address);
		pstmt.setString(5, phone);
		pstmt.setString(6, hobby);
		pstmt.setString(7, studno);
		pstmt.executeUpdate();
		%>
		<script>
			alert("학사 정보 수정 완료");
			location.href = "select_stud.jsp";
		</script>
		<%
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>