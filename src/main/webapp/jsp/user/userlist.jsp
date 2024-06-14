<%@ page import="com.brcb.entity.UserInfo" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.logging.log4j.Logger" %><%--
  Created by IntelliJ IDEA.
  User: 99437
  Date: 2024/6/5
  Time: 下午2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻列表</title>
</head>
<body>
<%!
    private static final Logger logger = LogManager.getLogger();
%>

<div>
    <div>
        <form actionj="" method="post">
            新闻分类
            <select>

            </select>
            <button type="submit">GO</button>
        </form>
    </div>
    <div>
        <%--数据展示--%>
        <table>
            <thead> <%--表头--%>
            <tr>
                <td>新闻标题</td>
                <td>作者</td>
                <td>时间</td>
                <td>操作</td>
            </tr>
            </thead>
            <tbody>

            </tbody>
        </table>
    </div>
    <div>
        <%--分页--%>
    </div>
</div>
</body>

</html>
