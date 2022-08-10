<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "m_order.M_order" %>
<%@ page import = "m_order.M_orderDAO" %>
<%@ page import = "movie.Movie" %>
<%@ page import = "movie.MovieDAO" %>
<%
	request.setCharacterEncoding("UTF-8");
	String orderno = request.getParameter("orderno");
	String id = (String)session.getAttribute("signedId");
	String m_code = request.getParameter("movie");
	String m_time = request.getParameter("time");
	String[] arr = request.getParameterValues("seat");
	String order_seat = "";
	if(arr.length == 1) {
		order_seat = arr[0];
	}
	else {
		int i = 0;
		for(i = 0; i < arr.length - 1; i++) {
			order_seat += arr[i] + ",";
		}
		order_seat += arr[i];
	}

	M_orderDAO m_orderDAO = new M_orderDAO();
	M_order p_order = m_orderDAO.select_order(orderno);
	int p_order_price = Integer.parseInt(p_order.getOrder_price());
	//이전 예매 정보의 주문 가격을 가져옴
	int p_point = p_order_price / 10;
	//여기까지 이전 정보
	
	MovieDAO movieDAO = new MovieDAO();
	Movie movie = movieDAO.selectMovie(m_code);
	int order_cnt = arr.length;
	int order_price = Integer.parseInt(movie.getM_price()) * order_cnt;
	int point = order_price / 10;
	//수정할 정보
	int result = m_orderDAO.updateM_order(p_point, id, point, m_code, m_time, order_seat, order_cnt, order_price, orderno);
	if(result == 1) {
		%>
		<script>
			alert("예매를 수정하였습니다.");
			location.href = "myPage.jsp";
		</script>
		<%
	}
	else {
		%>
		<script>
			alert("수정을 실패하였습니다.");
			history.back(-1);
		</script>
		<%
	}
%>