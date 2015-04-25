<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/24
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cp = request.getContextPath();
%>
<html>
<head>
    <title>Add/Edit Post</title>
    <script type="text/javascript" src="<%=cp%>/ckeditor/ckeditor.js"></script>
</head>
<body>
<c:choose>
    <c:when test="${post != null}">
        <c:set var="id" value="${post.id}"></c:set>
    </c:when>
    <c:otherwise>
        <c:set var="id" value="0"></c:set>
    </c:otherwise>
</c:choose>

<form action="<%=cp%>/post/${id}/save" method="post">
    <p>
        <label>Title:</label>
        <br/>
        <input type="text"  name="title" value="${post.title}" style="width:100%;">
    </p>

    <p>
        <label>Content:</label>
        <br/>
        <textarea id="editor" name="content">${post.content}</textarea>
    </p>

    <p>
        <button class="button">Save</button>
    </p>
</form>
<script type="text/javascript">
    CKEDITOR.replace('editor');
</script>
</body>
</html>
