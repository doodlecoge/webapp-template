<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <title>Posts</title>
</head>
<body>
<br/>

<label>
    <a href="<%=cp%>/post/new">
        <i class="fa fa-plus-circle"></i>
        Add New Post
    </a>
</label>
<hr>
<c:choose>
    <c:when test="${posts != null && fn:length(posts) > 0}">
        <ul>
            <c:forEach var="post" items="${posts}">
                <li>
                    <fmt:formatDate value="${post.updatedAt}" var="d"
                                   pattern="yyyy-MM-dd"></fmt:formatDate>
                    [${d}]
                    <a href="<%=cp%>/post/${post.id}">
                            ${post.title}
                    </a>
                </li>
            </c:forEach>
        </ul>
    </c:when>
    <c:otherwise>
        no posts
    </c:otherwise>
</c:choose>
</body>
</html>
