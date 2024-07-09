<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <title>登录</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #00aaff 50%, #f5f5f5 50%); /* 左侧海洋，右侧海岸 */
            overflow: hidden;
            display: flex;
            justify-content: center; /* 水平居中 */
            align-items: center; /* 垂直居中 */
            height: 100vh;
            margin: 0;
            color: #333;
            position: relative;
        }

        .login-container {
            position: relative;
            background: rgba(255, 255, 255, 0.9); /* 半透明白色背景 */
            padding: 40px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1); /* 阴影效果 */
            border-radius: 12px;
            width: 350px;
            text-align: center; /* 文本居中 */
            z-index: 1;
        }

        .login-container h2 {
            margin: 0 0 25px;
            color: #00aaff; /* 标题颜色 */
        }

        .login-container label {
            display: block;
            margin-bottom: 10px;
            text-align: left;
            color: #666;
            font-weight: bold;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 20px); /* 输入框宽度 */
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background: #fff;
            color: #333;
        }

        .login-container button {
            width: 100%;
            padding: 12px;
            background: #00aaff;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .login-container button:hover {
            background: #0088cc;
        }

        .error-message {
            color: #ff6b6b;
            margin-bottom: 15px;
        }

        .waves {
            position: absolute;
            top: 0;
            left: 0;
            width: 50%; /* 海洋占据左半边 */
            height: 100%;
            overflow: hidden;
            display: flex;
            align-items: center;
            z-index: 0;
        }

        .wave {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 200%;
            height: 200px;
            background: rgba(0, 150, 255, 0.5);
            border-radius: 50%;
            opacity: 0.7;
            animation: wave 5s infinite linear;
        }

        .wave:nth-child(2) {
            background: rgba(0, 150, 255, 0.3);
            animation: wave 7s infinite linear;
        }

        .wave:nth-child(3) {
            background: rgba(0, 150, 255, 0.2);
            animation: wave 9s infinite linear;
        }

        @keyframes wave {
            0% {
                transform: translateX(-50%);
            }
            100% {
                transform: translateX(50%);
            }
        }
    </style>
    <script type="text/javascript">
        window.onload = function () {
            var u = document.getElementById("username");
            u.onblur = function () {
                if (u.value === "") {
                    alert("用户名不能为空");
                }
            }
        }
    </script>
</head>
<body>
<div class="waves">
    <div class="wave"></div>
    <div class="wave"></div>
    <div class="wave"></div>
</div>
<div class="login-container">
    <h2>用户登录</h2>
    <%
        String msg = (String) request.getAttribute("msg");
        if (msg != null) {
    %>
    <div class="error-message"><%= msg %>
    </div>
    <%
        }
    %>
    <form action="<%=request.getContextPath()%>/jsp/user/douserlogin.jsp" method="post">
        <label for="username">用户名:</label>
        <input id="username" name="username" type="text" required>
        <label for="password">密&nbsp;&nbsp;码:</label>
        <input id="password" name="password" type="password" required>
        <button type="submit">登录</button>
    </form>
</div>
</body>
</html>