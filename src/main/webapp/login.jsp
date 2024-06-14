<%@ page contentType="text/html; charset=GBK" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="GBK">
    <title>登录</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: url('msg/1swg9o6i.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }
        .login-container {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            border-radius: 8px;
            width: 300px;
            text-align: center;
        }
        .login-container h2 {
            margin: 0 0 15px;
        }
        .login-container label {
            display: block;
            margin-bottom: 5px;
            text-align: left;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background: rgba(255, 255, 255, 0.7);
            color: rgba(156, 82, 82, 0.91);
        }
        .login-container button {
            width: 100%;
            padding: 10px;
            background: #5cb85c;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
        }
        .login-container button:hover {
            background: #4cae4c;
        }
        .error-message {
            color: red;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>登录</h2>
    <%
        Object msg = request.getAttribute("msg");
        if (msg != null) {
            System.out.println("<div class='error-message'>" + msg + "</div>");
        }
    %>
    <form action="jsp/doUserLogin.jsp" method="post">
        <label for="username">用户名:</label>
        <input id="username" name="username" type="text" required>
        <label for="password">密码:</label>
        <input id="password" name="password" type="password" required>
        <button type="submit">登录</button>
    </form>
</div>
</body>
</html>