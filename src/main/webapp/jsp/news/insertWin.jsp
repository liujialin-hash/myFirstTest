<%--
  ~ Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: 99437
  Date: 2024/7/4
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"  %>
<html>
<head>
    <title>新增成功</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/win.css">
    <script type="text/javascript">
        /*定义一个变量*/
        let countdown = 2

        function updateCountdown() {
            if (countdown > 0) {
                countdown--;
                document.getElementById("countdown").innerText = countdown;
            } else {
                window.location.href = "<%=request.getContextPath()%>/jsp/news/doNewsList.jsp?newsType=0";
            }
        }

        setInterval(updateCountdown, 1000)
    </script>
</head>
<body>
<div class="container">
    <h1>新增成功</h1>
    <p>页面将在<span id="countdown">2</span>秒后跳转</p>
</div>
</body>
</html>
