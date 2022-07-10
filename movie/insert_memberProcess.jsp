<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBConn.jsp" %>
<%
	PreparedStatement pstmt = null;
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth1 = request.getParameter("birth1");
	String birth2 = request.getParameter("birth2");
	String birth3 = request.getParameter("birth3");
	String birth = birth1 + "-" + birth2 + "-" + birth3;
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String phone = phone1 + "-" + phone2 + "-" + phone3;
	String address = request.getParameter("address");
	String sql = "insert into m_member values(?, ?, ?, ?, ?, ?, ?)";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, gender);
		pstmt.setString(5, birth);
		pstmt.setString(6, phone);
		pstmt.setString(7, address);
		pstmt.executeUpdate();
		%>
		<script>
			alert("회원가입을 진심으로 환여합니다:D\n새로운 아이디로 로그인 하시기 바랍니다!");
			location.href = "login.jsp";
		</script>
		<%
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>