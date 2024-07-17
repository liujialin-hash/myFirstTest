<%@ page import="com.brcb.entity.NewsType" %>
<%@ page import="java.util.List" %>
<%@ page import="com.brcb.entity.News" %>
<%@ page import="com.brcb.service.CateNewsService" %>
<%@ page import="com.brcb.service.impl.CateNewsServiceImpl" %>
<%@ page import="com.brcb.util.Page" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新闻列表</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
    <script>
        function confirmDelete(id) {
            var flag = confirm("确认要删除吗？");
            if (flag) {
                window.location.href = "<%=request.getContextPath()%>/jsp/news/doNewsDelete.jsp?id=" + id;
            }
        }

        function navigateToAdd() {
            window.location.href = "<%=request.getContextPath()%>/jsp/news/newsAdd.jsp";
        }
    </script>
</head>
<body>
<div class="container">
    <form action="<%=request.getContextPath()%>/jsp/news/doNewsList.jsp" method="post" class="form">
        <label for="newsType">新闻分类：</label>
        <select name="newsType" id="newsType">
            <%String newsType1 = (String) session.getAttribute("newsType");%>
            <option value="0">全部</option>

            <%
                @SuppressWarnings("unchecked")
                List<NewsType> newsTypes = (List<NewsType>) session.getAttribute("newsTypes");
                if (newsTypes != null) {
                    for (NewsType newsType : newsTypes) {

            %>
            <option value="<%= newsType.getId() %>" <%= (newsType1 != null && newsType1.equals(newsType.getId())) ? "selected" : "" %>><%= newsType.getName() %>
            </option>

            <%
                    }
                }%>

        </select>
        <button type="submit">查询</button>
        <button type="button" class="add-button" onclick="navigateToAdd()">新增</button>
    </form>
    <table class="news-table">
        <thead>
        <tr>
            <th>新闻标题</th>
            <th>作者</th>
            <th>时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            @SuppressWarnings("unchecked")
            List<News> newsList = (List<News>) request.getAttribute("newsList");
            if (newsList != null) {
                for (News news : newsList) {


        %>
        <tr>
            <td><%=news.getTitle()%>
            </td>
            <td><%=news.getAuthor()%>
            </td>
            <td><%=news.getDate()%>
            </td>
            <td>
                <%--      不实际跳转             鼠标点击事件--%>
                <a href="javascript:;" onclick="confirmDelete(<%=news.getId()%>)">删除</a>
                <%--/MyTest_war/jsp/news/--%>
                <a href="<%=request.getContextPath()%>/jsp/news/donewsUpdate.jsp?id=<%=news.getId()%>">修改</a>
            </td>
        </tr>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    <div class="pagination">
        <%
            CateNewsService s = new CateNewsServiceImpl();
            Page pages = (Page) session.getAttribute("pages");
            String type = (String) session.getAttribute("newsType");
            Integer count = s.getCount(type);
        %>
        <%
            int sessionTimeout = session.getMaxInactiveInterval(); // 获取会话超时时间（秒）
        %>
        <script type="text/javascript">
            var sessionTimeout = <%= sessionTimeout * 1000 %>; // 会话超时时间（毫秒）

            setTimeout(function () {
                alert("会话已超时，请重新登录。");
                window.location.href = "<%= request.getContextPath() %>/jsp/user/login.jsp";
            }, sessionTimeout);
        </script>

        <!-- 在这里实现分页逻辑 -->
        共<%=count%>条记录&emsp;当前页<%=pages.getCurPage()%>/<%=pages.getTotalPageCount()%>页&emsp;
        <a href="<%=request.getContextPath()%>/jsp/user/mainlist.jsp?pageIndex=1&TypesId=<%=type%>">首页</a>
        <a href="<%=request.getContextPath()%>/jsp/user/mainlist.jsp?pageIndex=<%=pages.getCurPage()>1? pages.getCurPage()-1:1%>&TypesId=<%=type%>">上一页</a>&emsp;
        <a href="<%=request.getContextPath()%>/jsp/user/mainlist.jsp?pageIndex=<%=pages.getCurPage()<pages.getTotalPageCount()?pages.getCurPage()+1:pages.getTotalPageCount() %>&TypesId=<%=type%>">下一页</a>&emsp;
        <a href="<%=request.getContextPath()%>/jsp/user/mainlist.jsp?pageIndex=<%=pages.getTotalPageCount()%>&TypesId=<%=type%>">尾页</a>
        &emsp;&emsp;跳转至
        <form action="<%=request.getContextPath()%>/jsp/user/mainlist.jsp" method="get" style="display:inline;">
            <input type="text" size="5" name="pageIndex">
            <input type="hidden" name="TypesId" value="<%=type%>">
            <button type="submit" id="btnpage">GO</button>
        </form>

    </div>
</div>
</body>
</html>