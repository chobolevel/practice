<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "p_order.P_orderDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String p_code = request.getParameter("p_code");
	String id = (String)session.getAttribute("signedId");
	String name = request.getParameter("name");
	String point = request.getParameter("point");
	String address = request.getParameter("address");
	String req = request.getParameter("request");
	String order_qty = request.getParameter("order_qty");
	String total = request.getParameter("total");
	P_orderDAO p_orderDAO = new P_orderDAO();
	int result = p_orderDAO.insertP_order(p_code, id, name, point, address, req, order_qty, total);
	if(result == 1) {
		%>
		<script>
			alert("주문이 완료되었습니다.");
			location.href = "myPage.jsp";
		</script>
		<%
	}
	else {
		%>
		<script>
			alert("주문을 실패하였습니다.");
			history.back(-1);
		</script>
		<%
	}
%>