<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/1/17
  Time: 14:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style type="text/css">

    </style>
</head>
<body>
<form method="post" action="login">
    <table class="login_tbl">
        <tr>
            <td>Username</td>
        </tr>
        <tr>
            <td><input type="text" name="username"></td>
        </tr>
        <tr>
            <td>Password</td>
        </tr>
        <tr>
            <td><input type="password" name="password"></td>
        </tr>
        <tr><td>&nbsp;</td></tr>
        <tr>
            <td>
                <input type="submit" value="Login"
                       class="button blue">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
