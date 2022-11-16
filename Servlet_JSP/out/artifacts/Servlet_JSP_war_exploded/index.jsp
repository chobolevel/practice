<%--
  Created by IntelliJ IDEA.
  User: icomm
  Date: 2022-11-16
  Time: 오전 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HOME</title>
</head>
<body>
<%
    String id = (String)session.getAttribute("id");
    if(id == null) {
        %>
        <a href="/login.go">로그인</a>
        <a href="/join.go">회원가입</a>
        <%
    } else {
        %>
        <a href="logout">로그아웃</a>
        <h3>${id}님 반갑습니다.</h3>
        <%
    }
%>
</body>
</html>
