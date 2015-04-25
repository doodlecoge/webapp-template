<%--
  Created by IntelliJ IDEA.
  User: hch
  Date: 2014/5/28
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
           prefix="decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%
    String cp = request.getContextPath();
    String host = request.getServerName();
    boolean bLocal = "localhost".equalsIgnoreCase(host) ||
            "127.0.0.1".equalsIgnoreCase(host);
    pageContext.setAttribute("blocal", bLocal);
%>
<!doctype html>
<html>
<head>
    <title><decorator:title/> - Webapp Template</title>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="<%=cp%>/css/site.css" charset="utf-8">
    <link rel="stylesheet" href="<%=cp%>/css/site.mobile.css" charset="utf-8">

    <c:choose>
        <c:when test="${pageContext.getAttribute('blocal') == false}">
            <link rel="stylesheet"
                  href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
            <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        </c:when>
        <c:otherwise>
            <link rel="stylesheet" href="<%=cp%>/css/font-awesome.min.css">
            <script src="<%=cp%>/js/jquery-1.11.2.min.js"></script>
        </c:otherwise>
    </c:choose>


    <script type="text/javascript">
        if (typeof console === 'undefined') {
            console = {
                log: new Function()
            }
        }

        function dockFooter() {
            var clientHeight = document.clientHeight ||
                    document.documentElement.clientHeight;
            var height = $(document.body).height();
            var cls = 'dock_bottom';
            var body = $(document.body);
            var fh = $('#footer').outerHeight();
            if (clientHeight > height) {
                if (!$('#footer').hasClass(cls)) {
                    $('#footer').addClass(cls);
                    body.css('padding-bottom', (10 + fh) + 'px');
                }
            } else {
                if ($('#footer').hasClass(cls)) {
                    $('#footer').removeClass(cls);
                    body.css('padding-bottom', '0');
                }
            }
        }
        $(function () {
            dockFooter();
            setTimeout(dockFooter, 200);
            $(window).on('resize', dockFooter);
        });
    </script>
    <decorator:head/>
</head>
<body>
<div id="nav">
    <div class="c">
        <div class="login_info">
            <sec:authorize access="isAuthenticated()">
                <a href="<%=cp%>/user">
                    <spring:message code="menu.hi"></spring:message>, <i class="fa fa-user"></i>
                    <sec:authentication property="principal.username"/>!
                </a>
                <a href="<%=cp%>/logout">
                    <i class="fa fa-power-off"></i>
                    <spring:message code="menu.logout"></spring:message>
                </a>
            </sec:authorize>
            <sec:authorize access="isAnonymous()">
                <a href="<%=cp%>/login_page">
                    <i class="fa fa-key"></i>
                    <spring:message code="menu.login"></spring:message>
                </a>
            </sec:authorize>
        </div>

        <div class="menus">
            <a href="<%=cp%>/">
                <i class="fa fa-home"></i>
                <spring:message code="menu.home"></spring:message>
            </a>
            &nbsp;
            <a href="<%=cp%>/post">
                <i class="fa fa-newspaper-o"></i>
                <spring:message code="menu.news"></spring:message>
            </a>
        </div>

        <div style="clear: both;"></div>
    </div>
</div>
<div id="header">
    <div class="c">
        Webapp Template
    </div>
</div>

<div id="content" class="c">
    <decorator:body/>
</div>
<div id="footer">
    <div class="c">
        Copyright &copy;
        <a href="http://www.huaichao.wang">huaichao.wang</a>
        since 2014.
    </div>
</div>

<c:if test='${pageContext.getAttribute("blocal") == false}'>
    <jsp:include page="ga.jsp"></jsp:include>
</c:if>
</body>
</html>
