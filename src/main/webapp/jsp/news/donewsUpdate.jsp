<%@ page import="com.brcb.service.CateNewsService" %>
<%@ page import="com.brcb.service.impl.CateNewsServiceImpl" %>
<%@ page import="com.brcb.entity.News" %><%--
  ~ Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: 99437
  Date: 2024/6/26
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id = request.getParameter("id");
    String url="/MyTest_war/jsp/news/newsUpdate.jsp";
    CateNewsService service=new CateNewsServiceImpl();
    News cateNewsById = service.getCateNewsById(id);
    session.setAttribute("cateNewsById",cateNewsById);
    response.sendRedirect(url);
%>