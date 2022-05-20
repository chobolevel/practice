<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file = "DBConn.jsp" %>
    
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

<%
	String name = "";
	int unitprice = 0;		//제품당 가격
	String orderdate = request.getParameter("orderdate");
	String ordername = request.getParameter("ordername");
	String productid = request.getParameter("productid");
	String orderqty = request.getParameter("orderqty");
	//request부분은 입력한 것이 onchange 수행후 사라지기 때문에 다시 작성하는 부분
	//값이 없을 때 수행되면 null값이 됨
	int unitinstock = 0;		//주문수량
	int qty = 0;		//주문수량 int형으로 형변환 변수/입력한 것을 받을 때는 문자형으로만 받아짐
	int orderprice = 0;		//제품당 가격 * 주문 수량
	
	if(orderqty == null || orderqty == "") {
		qty = 0;
	}
	else {
		qty = Integer.parseInt(orderqty);
	}
	//null일 경우 정수형 변환이 안되기 때문에 이렇게 수행함
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select name, unitprice, unitinstock from product0518 where productid = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			name = rs.getString(1);
			unitprice = rs.getInt(2);
			unitinstock = rs.getInt(3);
			if(qty > unitinstock) {
				//재고량보다 주문량이 많은 경우
				%>
				<script>
					orderqty = 0;
					alert("주문수량이 재고수량보다 많습니다.");
					history.back(-1);
				</script>
				<%
			}
			if(unitprice > 0 || qty > 0) {
				orderprice = unitprice * qty;		//주문금액을 자동으로 계산할 수 있도록 만듦
				//이렇게 조건문을 달아서 기본값 ""상태에서도 자동계산 하지 않도록 할 수 있음
			}
			
			}
			else if(productid == null || productid == "") {
				productid = "";
				//처음에 진입할 때 null값 없어야 진입이 가능함	null을 인식하여 계속 productid로 찾음
				//처음에 값이 없는데 null이 입력되어 상태가 변하는 것으로 인식함
				//jsp진입할 때 마다 조건문을 확인하기 때문에
			}
			else {
				%>
				<script>
					alert("상품코드가 올바르지 않습니다.");
					history.back(-1);
				</script>
				<%
			}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>

<h2>주문 정보 등록</h2>
<hr>
<form name = "form" method = "post" action = "insert_order.jsp" >
<table border = "1" id = "tab5">
<tr>
	<th>주문일자</th>
	<td><input type = "text" name = "orderdate" value = "<%=(orderdate == null) ? "" : orderdate %>"></td>
	<th>주문자 이름</th>
	<td width = "40%"><input type = "text" name = "ordername" value = "<%=(ordername == null) ? "" : ordername %>"></td>
</tr>
<tr>
	<th>상품코드</th>
	<td><input type = "text" name = "productid" onchange = "id_change()" value = "<%=productid %>"></td>
	<th>상품명</th>
	<td width = "40%"><input type = "text" name = "name" value = "<%=name %>"></td>
</tr>
<tr>
	<th>단가</th>
	<td><input type = "text" name = "unitprice" value = "<%=(unitprice == 0) ? "" : unitprice %>"></td>
	<th>주문수량</th>
	<td width = "40%"><input type = "text" name = "orderqty" value = "<%=(qty == 0) ? "" : qty %>" onchange = "qty_change()"></td>
</tr>
<tr>
	<th>주문금액</th>
	<td><input type = "text" name = "orderprice" value = "<%=(orderprice == 0) ? "" : orderprice %>"></td>
	<th>주문주소</th>
	<td width = "40%"><input type = "text" name = "orderaddress"></td>
</tr>
<tr height = "30px">
	<td colspan = "4" align = "center">
		<input type = "button" value = "목록" onclick = "move()" >
		<input type = "submit" value = "저장" onclick = "check()">
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
	location.href = "select_order.jsp";
}
function id_change() {
	document.form.submit();
	//action이 자기자신임
}
function qty_change() {
	document.form.submit();
}
function check() {
	if(!document.form.orderdate.value || document.form.orderdate.value == "") {
		alert("주문일자를 입력하세요.");
		document.form.orderdate.focus();
	}
	else if(!document.form.ordername.value || document.form.ordername.value == "") {
		alert("주문자이름을 입력하세요.");
		document.form.ordername.focus();
	}
	else if(!document.form.productid.value || document.form.productid.value == "") {
		alert("상품코드를 입력하세요.");
		document.form.productid.focus();
	}
	else if(!document.form.orderqty.value || document.form.orderqty.value == "") {
		alert("주문수량을 입력해주세요.");
		document.form.orderqty.focus();
	}
	else if(!document.form.orderaddress.value || document.form.orderaddress.value == "") {
		alert("주문자 주소를 입력하세요.");
		document.form.orderaddress.focus();
	}
	else {
		form.action = "insert_orderProcess.jsp";
	}
}
</script>
</body>
</html>
