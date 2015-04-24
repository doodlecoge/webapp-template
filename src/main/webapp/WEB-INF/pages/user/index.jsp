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
<html>
<head>
    <title>Users</title>
</head>
<body>
<c:choose>
    <c:when test="${users != null && fn:length(users) > 0}">
        <ul>
            <c:forEach var="user" items="${users}">
                <li> ${user.fullname} </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        no users
    </c:otherwise>
</c:choose>
</body>
</html>
