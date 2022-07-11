<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	//로그아웃
	response.sendRedirect("login.jsp");
	//로그인 화면으로 이동
%>