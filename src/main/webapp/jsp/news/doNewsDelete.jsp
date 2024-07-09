<%@ page import="com.brcb.service.CateNewsService" %>
<%@ page import="com.brcb.service.impl.CateNewsServiceImpl" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>删除新闻</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .container h1 {
            color: #4CAF50;
            margin-bottom: 20px;
        }

        .container p {
            color: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        String id = request.getParameter("id");
        CateNewsService service = new CateNewsServiceImpl();
        int result = service.deleteByCateNewsId(id);

        if (result == 1) {
    %>
    <h1>删除成功</h1>
    <p>新闻ID为<%= id %>的记录已成功删除。</p>
    <P>页面将在2秒后跳转</P>
    <script type="text/javascript">
        setTimeout(function () {
            window.location.href = '/MyTest_war/jsp/news/doNewsList.jsp';
        }, 2000);
    </script>
    <%
    } else {
    %>
    <h1>删除失败</h1>
    <p>未能删除ID为<%= id %>的新闻记录。</p>
    <P>页面将在2秒后跳转</P>
    <script type="text/javascript">
        setTimeout(function () {
            window.location.href = '/MyTest_war/jsp/news/doNewsList.jsp';
        }, 2000);
    </script>
    <%
        }
    %>
</div>
</body>
</html>