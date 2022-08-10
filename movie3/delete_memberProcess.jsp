<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "member.MemberDAO" %>
<%
	String id = request.getParameter("id");
	MemberDAO memberDAO = new MemberDAO();
	int result = memberDAO.deleteMember(id);
	if(result == 1) {
		%>
		<script>
			alert("회원탈퇴 완료.");
			location.href = "bye.jsp";
		</script>
		<%
	}
	else {
		%>
		<script>
			alert("회원 탈퇴 실패!");
			history.back(-1);
		</script>
		<%
	}
%>