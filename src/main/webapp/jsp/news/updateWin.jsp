<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <title>修改成功</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/win.css">
    <%
        Object newsTypeId = session.getAttribute("newsType");
        String url = "/jsp/news/doNewsList.jsp";
        if (newsTypeId != null && !newsTypeId.equals("")) {
            url += "?newsType=" + newsTypeId;
        }
    %>
    <script type="text/javascript">

        <%--setTimeout(function () {--%>
        <%--    window.location.href = "<%=url%>";--%>
        <%--}, 2000);--%>
        var countdown = 2;
        function updateCountdown() {

            if (countdown > 0) {
                countdown--;
                document.getElementById("countdown").innerText = countdown;

            } else {
                window.location.href = "<%=request.getContextPath()+url%>"
            }
        }
        setInterval(updateCountdown,1000);
    </script>
</head>
<body>
<div class="container">
    <h1>数据修改成功</h1>
    <p>页面将在<span id="countdown">2</span>秒后自动跳转</p>
</div>
</body>
</html>