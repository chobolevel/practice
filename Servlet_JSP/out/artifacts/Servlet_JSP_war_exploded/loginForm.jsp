<%--
  Created by IntelliJ IDEA.
  User: icomm
  Date: 2022-11-16
  Time: 오전 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<form name="loginForm" action="loginProcess.jsp" method="post">
    <center>
        <table border="1">
            <tr>
                <td colspan="2" align="center">
                    <b><fort size="5">로그인 페이지</fort></b>
                </td>
            </tr>
            <tr>
                <td>아이디 : </td>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td>비밀번호 : </td>
                <td><input type="password" name="pass"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="javascript:loginForm.submit()">로그인</a>&nbsp;&nbsp;
                    <a href="joinForm.jsp">회원가입</a>
                </td>
            </tr>
        </table>
    </center>
</form>
</body>
</html>
