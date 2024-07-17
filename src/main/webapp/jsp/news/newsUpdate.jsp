<%@ page import="com.brcb.entity.NewsType" %>
<%@ page import="java.util.List" %>
<%@ page import="com.brcb.entity.News" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改新闻</title>
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
    <script type="text/javascript" src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
</head>
<body>
<div class="container">
    <h1>修改新闻</h1>
    <%
        String errorMessage = null;
        try {
            // 获取会话中的新闻数据
            News news = (News) session.getAttribute("cateNewsById");
            if (news == null) {
                throw new Exception("新闻数据未找到");
            }
    %>
    <form action="<%= request.getContextPath() %>/jsp/news/doupdateWin.jsp" method="post">
        <input type="hidden" name="newsId"
               value="<%= (session.getAttribute("cateNewsById")!=null) ? ((News)session.getAttribute("cateNewsById")).getId() : "" %>">
        <label for="newsType">新闻类别</label>
        <select name="newsType" id="newsType">
            <%
                String newsTypeId = (String) session.getAttribute("newsType");
                if (newsTypeId == null) {
                    newsTypeId = "0";
                }
                @SuppressWarnings("unchecked")
                List<NewsType> newsTypes = (List<NewsType>) session.getAttribute("newsTypes");
                if (newsTypes != null) {
                    for (NewsType newsTypeOne : newsTypes) {
            %>
            <option value="<%= newsTypeOne.getId() %>" <%= newsTypeId.equals(newsTypeOne.getId()) ? "selected" : "" %>>
                <%= newsTypeOne.getName() %>
            </option>
            <%
                    }
                }
            %>

        </select>

        <label for="newsTitle">新闻标题</label>
        <input type="text" id="newsTitle" name="newsTitle"
               value="<%= (session.getAttribute("cateNewsById") != null) ? ((News) session.getAttribute("cateNewsById")).getTitle() : "" %>"
               required>

        <label for="newsAbstract">新闻摘要</label>
        <textarea id="newsAbstract" name="newsAbstract" rows="3"
                  required><%= (session.getAttribute("cateNewsById") != null) ? ((News) session.getAttribute("cateNewsById")).getDigest() : "" %></textarea>

        <label for="newscontent">新闻内容</label>
        <textarea id="newscontent" name="newscontent"  class="ckeditor" cols=""
                  ><%= (session.getAttribute("cateNewsById") != null) ? ((News) session.getAttribute("cateNewsById")).getText() : "" %></textarea>

        <label for="newsAuthor">新闻作者</label>
        <input type="text" id="newsAuthor" name="newsAuthor"
               value="<%= (session.getAttribute("cateNewsById") != null) ? ((News) session.getAttribute("cateNewsById")).getAuthor() : "" %>"
               required>

        <div style="display: flex; justify-content: space-between;">
            <button type="reset">重置</button>
            <button type="submit">提交</button>
        </div>
    </form>
    <%
        } catch (Exception e) {
            errorMessage = e.getMessage();
        }
        if (errorMessage != null) {
    %>
    <div class="error"><%= errorMessage %>
    </div>
    <%
        }%>
</div>
</body>
</html>