<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" href = "css/insert_memberStyle.css">
</head>
<body>

<div id = "container">
	<h1>회원가입을 환영합니다</h1>
	<form name = "form" method = "post" action = "insert_memberProcess.jsp">
		<div id = "input_id">
			<label for = "id">아이디</label>
			<input type = "text" name = "id" id = "id" placeholder =  "USER_ID">
		</div>
		<div id = "input_pass">
			<label for = "password">비밀번호</label>
			<input type = "password" name = "password" id = "password" placeholder = "PASSWORD">	
		</div>
		<div id = "input_passcheck">
			<label for = "passcheck">비밀번호 확인</label>
			<input type = "password" name = "passcheck" id = "passcheck" placeholder = "PASSCHECK">			
		</div>
		<div id = "input_name">
			<label for = "name">이 름</label>
			<input type = "text" name = "name" id = "name" placeholder = "NAME">
		</div>
		<div id = "input_gender">
			<label>성별</label>
			<input type = "radio" name = "gender" value = "1"> 남성
			<input type = "radio" name = "gender" value = "2"> 여성		
		</div>
		<div id = "input_birth">
			<label>생년월일</label>
			<select name = "birth1" id = "birth1">
			<%
				for(int i = 1900; i < 2023; i++) {
					%>
					<option value = "<%=i %>"><%=i + "년" %></option>
					<%
				}
			%>
			</select> 년
			<select name = "birth2" id = "birth2">
			<%
				for(int i = 1; i < 13; i++) {
					%>
					<option value = "<%=i %>"><%=i + "월" %></option>
					<%
				}
			%>
			</select> 월
			<input style = "width:40px;"type = "text" name = "birth3" id = "birth3"> 일
		</div>
		<div id = "input_phone">
			<label>전화번호</label>
			<select name = "phone1" id = "phone1">
				<option value = "010">010</option>
				<option value = "011">011</option>
				<option value = "012">012</option>
				<option value = "017">017</option>
				<option value = "019">019</option>
			</select> - 
			<input style = "width:60px;" type = "text" name = "phone2" id = "phone2"> - 
			<input style = "width:60px;" type = "text" name = "phone3" id = "phone3">
		</div>
		<div id = "input_address">
			<label for = "address">주소</label>
			<input type = "text" name = "address" id = "address" placeholder = "ADDRESS">			
		</div>
		<div id = "submit">
			<input type = "button" value = "회원가입" onclick = "check()">
			<input type = "button" value = "가입취소" onclick = "move()">
		</div>
	</form>
</div>
<script>
function move() {
	location.href = "login.jsp";
}
function check() {
	var pass = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/
	var kr = /^[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]+$/
	
	if(document.form.id.value == "") {
		alert("아이디가 입력되지 않았습니다.");
		document.form.id.focus();
		return false;
	}
	if(document.form.id.value.length < 5 || document.form.id.value.length > 15) {
		alert("아이디는 최소 5글자 이상 최대 15자 미만입니다.");
		document.form.id.focus();
		return false;
	}
	if(document.form.password.value == "") {
		alert("비밀번호가 입력되지 않았습니다.");
		document.form.password.focus();
		return false;
	}
	if(pass.test(document.form.password.value) == false) {
		alert("비밀번호는 최소 8자이상, \n최소 하나의 문자와 숫자를 포함해야합니다.");
		document.form.password.focus();
		return false;
	}
	if(document.form.passcheck.value == "") {
		alert("확인 비밀번호가 입력되지 않았습니다.");
		document.form.passcheck.focus();
		return false;
	}
	if(document.form.password.value != document.form.passcheck.value) {
		alert("비밀번호와 확인 비밀번호가 일치하지 않습니다.");
		document.form.passcheck.focus();
		return false;
	}
	if(document.form.name.value == "") {
		alert("회원이름이 입력되지 않았습니다.");
		document.form.name.focus();
		return false;
	}
	if(kr.test(document.form.name.value) == false) {
		alert("이름은 한글로만 입력해주세요.");
		document.form.name.focus();
		return false;
	}
	var cnt = 0;
	var gen = document.getElementsByName("gender");
	for(var i = 0; i < gen.length; i++) {
		if(gen[i].checked == true) {
			cnt++;
			break;
		}
	}
	if(cnt == 0) {
		alert("성별이 선택되지 않았습니다.");
		return false;
	}
	if(document.form.birth3.value == "") {
		alert("생년월일이 입력되지 않았습니다.");
		document.form.birth3.focus();
		return false;
	}
	if(document.form.phone2.value == "" || document.form.phone3.value == "") {
		alert("전화번호가 입력되지 않았습니다.");
		return false;
	}
	if(document.form.address.value == "") {
		alert("주소가 입력되지 않았습니다.");
		document.form.address.focus();
		return false;
	}
	document.form.submit();
}
</script>
</body>
</html>