<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "DBConn.jsp" %>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String orderno = "";
	String m_code = request.getParameter("movie");
	String[] s_arr = request.getParameterValues("seat");
	String seat = "";
	int i = 0;
	if(s_arr.length == 1) {
		seat = s_arr[0];
	}
	else {
		for(i = 0; i < s_arr.length - 1; i++) {
			seat += s_arr[i] + ",";
		}
	}
	if(s_arr.length >= 2) seat += s_arr[i];
	String sql = "select max(orderno) + 1 from m_order";
	try {
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			orderno = rs.getString(1);
			if(orderno == null) orderno = "1";
			//처음 값이 없어서 max출력하지 않음
			sql = "insert into m_order values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, orderno);
			pstmt.setString(2, m_code);
			pstmt.setString(3, seat);
			pstmt.executeUpdate();
			%>
			<script>
				alert("예매가 완료되었습니다!");
				location.href = "index.jsp";
			</script>
			<%
		}
	}
	catch(SQLException e) {
		e.printStackTrace();
	}
%>