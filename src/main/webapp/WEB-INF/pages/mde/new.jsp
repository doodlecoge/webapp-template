<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/4/27
  Time: 15:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String cp = request.getContextPath();
    String host = request.getServerName();
    boolean bLocal = "localhost".equalsIgnoreCase(host) ||
            "127.0.0.1".equalsIgnoreCase(host);
    pageContext.setAttribute("blocal", bLocal);
%>
<html>
<head>
    <title>Markdown Editor</title>
    <link rel="stylesheet" href="<%=cp%>/codemirror/lib/codemirror.css">
    <script type="text/javascript"
            src="<%=cp%>/codemirror/lib/codemirror.js"></script>

    <c:choose>
        <c:when test="${pageContext.getAttribute('blocal') == false}">
            <link rel="stylesheet"
                  href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
            <link rel="stylesheet"
                  href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.5/styles/default.min.css">
            <script type="text/javascript"
                    src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.5/highlight.min.js"></script>
            <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
        </c:when>
        <c:otherwise>
            <link rel="stylesheet" href="<%=cp%>/css/font-awesome.min.css">
            <link rel="stylesheet" href="<%=cp%>/highlight/styles/default.css">
            <script type="text/javascript"
                    src="<%=cp%>/highlight/highlight.pack.js"></script>
            <script src="<%=cp%>/js/jquery-1.11.2.min.js"></script>
        </c:otherwise>
    </c:choose>

    <script type="text/javascript"
            src="<%=cp%>/js/marked.js"></script>

    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .CodeMirror {
            height: 100%;
        }

        #nav {
            background: #555;
            display: table;
            width: 100%;
            padding: 10px 0;
        }

        #nav a {
            color: #ccc;
            font-weight: bold;
            text-decoration: none;
            padding: 0 10px;
            display: table-cell;
            width: 1%;
            white-space: nowrap;
        }

        #nav a:hover {
            color: #f8f8f8;
        }

        #nav input {
            width: 100%;
            display: table-cell;
            border: 0;
            height: 30px;
            padding: 0 5px;
            font-size: 18px;
            color: #555;
        }

        #wrapper {
            position: absolute;
            top: 50px;
            bottom: 0;
            left: 0;
            right: 0;
        }

        #wrapper .col {
            width: 50%;
            box-sizing: border-box;
            height: 100%;
            float: left;
            position: relative;
        }

        #preview {
            height: 100%;
            width: 100%;
            box-sizing: border-box;
            top: 0;
            float: right;
            overflow-y: scroll;
            word-break: break-all;
            word-wrap: break-word;
            overflow-x: hidden;
            padding-left: 10px;
            background: #eee;
        }
    </style>
</head>
<body>
<div id="nav">
    <a href="" title="Exit">
        <i class="fa fa-reply"></i>
    </a>
    <input type="text">
    <a href="" title="Save">
        <i class="fa fa-save"></i>
    </a>
</div>
<div id="wrapper">
    <div id="editor" class="col">
        <textarea id="raw"></textarea>
    </div>
    <div id="preview" class="col">
    </div>
</div>


<script type="text/javascript">
    marked.setOptions({
        renderer: new marked.Renderer(),
        highlight: function (code) {
            return hljs.highlightAuto(code).value;
        },
        gfm: true,
        tables: true,
        breaks: false,
        pedantic: false,
        sanitize: false,
        smartLists: true,
        smartypants: false
    });

    $(function () {
        var mde = CodeMirror.fromTextArea(document.getElementById('raw'), {
            lineNumbers: true,
            lineWrapping: true,
            mode: "markdown",
            indentUnit: 4,
            indentWithTabs: true,
            extraKeys: {"Enter": "newlineAndIndentContinueMarkdownList"}
        });
        mde.on("change", function (Editor, changes) {
            var txt = mde.getValue();
            var html = marked(txt);
            $("#preview").html(html);
        });
    });
</script>
</body>
</html>
