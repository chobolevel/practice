<%--
  Created by IntelliJ IDEA.
  User: icomm
  Date: 2022-11-15
  Time: 오후 7:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String language = "korea";
    String cookie = request.getHeader("Cookie");

    if(cookie != null) {
        Cookie cookies[] = request.getCookies();

        for(Cookie co : cookies) {
            if(co.getName().equals("language")) {
                language = co.getValue();
            }
        }
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    if(language.equals("korea")) {
%>
    <h3>안녕하세요. 이것은 쿠키 예제입니다.</h3>
<%
    } else {
        %>
        <h3>Hello, This is Cookie example</h3>
        <%
    }
%>
<form action="cookieExample2.jsp" method="post">
    <input type="radio" name="language" value="korea">
</form>
</body>
</html>
