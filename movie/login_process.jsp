<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBConn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String sql = "select password, name from m_member where id = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String temp_pass = rs.getString(1);
			String user_name = rs.getString(2);
			if(password.equals(temp_pass)) {
				session.setAttribute("signedId", id);
				session.setAttribute("signedName", user_name);
				%>
				<script>
					alert("창원 시네마에 오신 것을 환영합니다.");
					location.href = "index.jsp";
				</script>
				<%
			}
			else {
				%>
				<script>
					alert("비밀번호가 일치하지 않습니다.");
					history.back(-1);
				</script>
				<%
			}
		}
		else {
			%>
			<script>
				alert("회원 아이디가 존재하지 않습니다.");
				history.back(-1);
			</script>
			<%
		}
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>