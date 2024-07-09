<%@ page import="com.brcb.service.CateAllNewsTypeService" %>
<%@ page import="com.brcb.service.impl.CateAllNewsTypesServiceImpl" %>
<%@ page import="com.brcb.entity.News" %>
<%@ page import="java.util.List" %>
<%@ page import="com.brcb.dao.CateNews" %>
<%@ page import="com.brcb.dao.impl.CateNewsImpl" %><%--
  ~ Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: 99437
  Date: 2024/6/25
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String turePage = "/MyTest_war/jsp/news/newsList.jsp";
    String newsType = request.getParameter("newsType");
    CateNews cate = new CateNewsImpl();
    List<News> allNewsByType = cate.getAllNewsByNewsType(newsType);
    session.setAttribute("newsList", allNewsByType);
    session.setAttribute("newsType", newsType);
    response.sendRedirect(turePage);

%>