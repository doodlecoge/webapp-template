<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/24
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cp = request.getContextPath();
%>
<html>
<head>
    <title>Users</title>
    <style>
        .avatar {
            max-width: 100px;
            max-height: 100px;
        }
    </style>
</head>
<body>
<p>
    <label>Avatar Image:</label>
    <br/>
    <img class="avatar" src="<%=cp%>/img/no_avatar.gif">
</p>

<p>
    <label>User Name:</label>
    <br/>
    <input type="text" value="${user.username}">
</p>

<p>
    <label>Full Name:</label>
    <br/>
    <input type="text" value="${user.fullname}">
</p>

<p>
    <label>Password:</label>
    <br/>
    <input type="password" value="${user.password}">
</p>

<p>
    <button class="button">Update Profile</button>
</p>
</body>
</html>
