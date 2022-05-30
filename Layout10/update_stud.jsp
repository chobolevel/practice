<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>

<%
	String studno = request.getParameter("studno");
	String name = "";
	String dept = "";
	String position = "";
	String[] hobby = new String[8];
	String address = "";
	String phone = "";
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from stud0530 where studno = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, studno);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			name = rs.getString(2);
			dept = rs.getString(3);
			position = rs.getString(4);
			address = rs.getString(5);
			phone = rs.getString(6);
			hobby= rs.getString(7).split(", ");
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<header>
<%@include file = "header.jsp" %>
</header>

<nav>
<%@include file = "nav.jsp" %>
</nav>

<section>
<h2>학사 정보 수정 화면</h2>
<form name = "form" method = "post" action = "update_studProcess.jsp">
<table border = "1" id = "tab2">
<tr>
	<th>학번</th>
	<td><input type = "text" name = "studno"  value = "<%=studno %>"></td>
</tr>
<tr>
	<th>성명</th>
	<td><input type = "text" name = "name" value = "<%=name %>"></td>
</tr>
<tr>
	<th>학과</th>
	<td>
		<select name = "dept">
			<option value = "1" <%=dept.equals("1") ? "selected" : "" %>>컴퓨터공학과</option>
			<option value = "2" <%=dept.equals("2") ? "selected" : "" %>>기계공학과</option>
			<option value = "3" <%=dept.equals("3") ? "selected" : "" %>>전자과</option>
			<option value = "4" <%=dept.equals("4") ? "selected" : "" %>>영문학과</option>
			<option value = "5" <%=dept.equals("5") ? "selected" : "" %>>일어과</option>
			<option value = "6" <%=dept.equals("6") ? "selected" : "" %>>경영학과</option>
			<option value = "7" <%=dept.equals("7") ? "selected" : "" %>>무역학과</option>
			<option value = "8" <%=dept.equals("8") ? "selected" : "" %>>교육학과</option>
		</select>
	</td>
</tr>
<tr>
	<th>학년</th>
	<td>
		<input type = "radio" name = "position" value = "1" <%=position.equals("1") ? "checked" : "" %>>1학년
		<input type = "radio" name = "position" value = "2" <%=position.equals("2") ? "checked" : "" %>>2학년
		<input type = "radio" name = "position" value = "3" <%=position.equals("3") ? "checked" : "" %>>3학년
		<input type = "radio" name = "position" value = "4" <%=position.equals("4") ? "checked" : "" %>>4학년
	</td>
</tr>
<tr>
	<th>취미</th>
	<td>
		<input type = "checkbox" name = "hobby" value = "프로그램" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("프로그램")) out.print("checked");%>>프로그램
		<input type = "checkbox" name = "hobby" value = "독서" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("독서")) out.print("checked");%>>독서
		<input type = "checkbox" name = "hobby" value = "등산" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("등산")) out.print("checked");%>>등산
		<input type = "checkbox" name = "hobby" value = "여행" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("여행")) out.print("checked");%>>여행
		<input type = "checkbox" name = "hobby" value = "낚시" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("낚시")) out.print("checked");%>>낚시
		<input type = "checkbox" name = "hobby" value = "영화보기" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("영화보기")) out.print("checked");%>>영화보기
		<input type = "checkbox" name = "hobby" value = "잠자기" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("잠자기")) out.print("checked");%>>잠자기
		<input type = "checkbox" name = "hobby" value = "멍때리기" <%for(int i = 0; i < hobby.length; i++) if(hobby[i].equals("멍때리기")) out.print("checked");%>>멍때리기
	</td>
</tr>
<tr>
	<th>주소</th>
	<td><input type = "text" name = "address" value = "<%=address %>"></td>
</tr>
<tr>
	<th>연락처</th>
	<td><input type = "text" name = "phone" value = "<%=phone %>"></td>
</tr>
<tr>
	<td colspan = "2" align = "center">
		<input type = "button" value = "등록" onclick = "check()">
		<input type = "button" value = "취소" onclick = "move()">
	</td>
</tr>
</table>
</form>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function move() {
	location.href = "select_stud.jsp";
}
function check() {
	if(!document.form.studno.value || document.form.studno.value == "") {
		alert("학번이 입력되지 않았습니다.");
		document.form.studno.focus();
	}
	else if(!document.form.name.value || document.form.name.value == "") {
		alert("이름이 입력되지 않았습니다.");
		document.form.name.focus();
	}
	else {
		document.form.submit();
	}
}
</script>
</body>
</html>