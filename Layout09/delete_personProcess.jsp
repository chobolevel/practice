<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select name from person0526 where id = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String temp_name = rs.getString(1);
			if(name.equals(temp_name)) {
				sql = "delete from person0526 where id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				%>
				<script>
					alert("사원 정보 삭제 성공!");
					location.href = "select_person.jsp";
				</script>
				<%
			}
			else {
				%>
				<script>
					alert("이름이 일치하지 않습니다.");
					history.back(-1);
				</script>
				<%
			}
		}
		else {
			%>
			<script>
				alert("사원번호가 존재하지 않습니다.");
				history.back(-1);
			</script>
			<%
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>