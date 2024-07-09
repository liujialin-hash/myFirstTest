<%@ page import="java.util.List" %>
<%@ page import="com.brcb.entity.NewsType" %>
<%@ page import="java.util.UUID" %><%--
  ~ Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: 99437
  Date: 2024/7/3
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增</title>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">--%>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            max-width: 600px;
            width: 100%;
            background-color: #ffffff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 5px;
            font-weight: bold;
        }

        input, select, textarea, button {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        textarea {
            resize: vertical;
        }

        button {
            background-color: #3498db;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 onclick="">新增</h2>
    <form action="<%=request.getContextPath()%>/jsp/news/doNewsAdd.jsp" method="post" enctype="multipart/form-data">
        <%--enctype="multipart/form-data--%>

        <label for="newsType">新闻类型</label>
        <select id="newsType" name="newsType">
            <%--查询类型--%>
            <%
                @SuppressWarnings("unchecked")
                List<NewsType> types = (List<NewsType>) session.getAttribute("newsTypes");
                if (types != null) {
                    for (NewsType type : types) {
            %>
            <option value="<%=type.getId() %>"><%=type.getName() %>
            </option>
            <%
                    }
                }
            %>
        </select>
        <input type="hidden" name="id" value="<%=UUID.randomUUID()%>" id="id">
        <label for="newsTitle">新闻标题</label>
        <input id="newsTitle" name="newsTitle">
        <label for="newsAbstract">新闻摘要</label>
        <input id="newsAbstract" name="newsAbstract">
        <label for="editor1">新闻内容</label>
        <textarea id="editor1" name="editor1" rows="4"></textarea>
        <label for="newsAuthor">作者</label>
        <input id="newsAuthor" name="newsAuthor">
        <label for="newsPig">图片</label>
        <input type="file" name="newsPig" id="newsPig">
        <button type="submit">提交</button>
        <button type="button" onclick="history.back()">返回</button>
    </form>
</div>
</body>
</html>
