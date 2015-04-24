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
    <title>Posts</title>
</head>
<body>
<c:choose>
    <c:when test="${posts != null && fn:length(posts) > 0}">
        <ul>
            <c:forEach var="post" items="${posts}">
                <li> ${post.title} </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        no posts
    </c:otherwise>
</c:choose>
</body>
</html>
