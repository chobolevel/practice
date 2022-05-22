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
	String productid = request.getParameter("id");
	String orderdate = "";
	String ordername = "";
	int orderqty = 0;
	String orderaddress = "";
	//변수 초기화 부분
	//정보 변경을 위해 주문 정보를 자동으로 불러오기 위한 변수들
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select to_char(orderdate, 'YYYY-MM-DD'), ordername, orderqty, orderaddress from order0518 where productid = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			orderdate = rs.getString(1);
			ordername = rs.getString(2);
			orderqty = rs.getInt(3);
			orderaddress = rs.getString(4);
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
	
	if(productid == null) {
		orderdate = request.getParameter("orderdate");
		ordername = request.getParameter("ordername");
		productid = request.getParameter("productid");
		orderqty = Integer.parseInt(request.getParameter("orderqty"));
		orderaddress = request.getParameter("orderaddress");
	}

	//변수 초기화 부분
	String name = "";
	int unitprice = 0;
	int qty = 0;			//orderqty를 정수형으로 받는 변수
	int orderprice = 0;		//orderqty를 이용해서 untiprice와 계산하는 변수
	int currentqty = 0;		//orderqty에 따라 재고량 변경을 위한 변수
	
	
	/* //만약 입력이 없다면 null이 되기 떄문에 이 조건문 없이는 Integer.parseInt 불가능
	if(orderqty == null || orderqty == "") {
		qty = 0;
	}
	else {
		qty = Integer.parseInt(orderqty);
	} */
	
	
	sql = "select name, unitprice from product0518 where productid = ?";
	try {
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, productid);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			name = rs.getString(1);
			unitprice = rs.getInt(2);
			sql = "select unitinstock from product0518 where productid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, productid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				currentqty = rs.getInt(1);
				if(qty > currentqty) {
					%>
					<script>
						alert("주문 수량이 재고 수량보다 많습니다.");
						history.back(-1);
					</script>
					<%
				}
			}
			if(orderqty != 0 ) {
				//만약 값이 없을 떄는 orderprice를 계산하지 않음
				orderprice = orderqty * unitprice;
			}
		}
		else if(productid == null || productid == "") {
			productid = "";
		}
		else {
			%>
			<script>
				alert("등록되지 않은 코드입니다.");
				history.back(-1);
			</script>
			<%
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
	}
%>
<h2>주문 정보 수정 화면</h2>
<hr>
<form name = "form" method = "post" action = "update_order.jsp">
<table border = "1" id = "tab5">
<tr>
	<th>주문일자</th>
	<td><input type = "text" name = "orderdate" value = "<%=orderdate %>"></td>
	<th>주문자 이름</th>
	<td><input width = "40%" type = "text" name = "ordername" value = "<%=ordername %>"></td>
</tr>
<tr>
	<th>상품코드</th>
	<td><input type = "text" name = "productid" onchange = "id_change()" value = "<%=productid %>"></td>
	<th>상품명</th>
	<td><input width = "40%" type = "text" name = "name" value = "<%=name %>"></td>
</tr>
<tr>
	<th>단가</th>
	<td><input type = "text" name = "unitprice" value = "<%=(unitprice == 0) ? "" : unitprice %>"></td>
	<th>주문수량</th>
	<td><input width = "40%" type = "text" name = "orderqty" onchange = "qty_change()" value = "<%=orderqty %>"></td>
</tr>
<tr>
	<th>주문금액</th>
	<td><input type = "text" name = "orderprice" value = "<%=orderprice %>"></td>
	<th>주문주소</th>
	<td><input width = "40%" type = "text" name = "orderaddress" value = "<%=orderaddress %>"></td>
</tr>
<tr>
	<td colspan = "4" align = "center">
		<input type = "button" value = "목록" onclick = "move()" >
		<input type = "submit" value = "저장" onclick = "check()" >
	</td>
</tr>
</table>
</form>
</section>

<footer>
<%@include file = "footer.jsp" %>
</footer>
<script>
function id_change() {
	document.form.submit();
}
function check() {
	if(!document.form.orderdate.value || document.form.orderdate.value == "") {
		alert("주문일자를 입력해주세요.");
		document.form.orderdate.focus();
	}
	else if(!document.form.ordername.value || document.form.ordername.value == "") {
		alert("주문자이름을 입력해주세요.");
		document.form.ordername.focus();
	}
	else if(!document.form.productid.value || document.form.productid.value == "") {
		alert("상품코드를 입력하세요.");
		document.form.productid.focus();
	}
	else if(!document.form.orderaddress.value || document.form.orderaddress.value == "") {
		alert("주문자 주소를 입력하세요.");
		document.form.orderaddress.focus();
	}
	else {
		form.action = "update_orderProcess.jsp";
		location.href = "select_order.jsp";
	}
}
function qty_change() {
	document.form.submit();
}
function move() {
	location.href = "select_order.jsp";
}
</script>
</body>
</html>
