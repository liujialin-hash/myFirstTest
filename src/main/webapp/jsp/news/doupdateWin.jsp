<%--
  ~ Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>
<%@ page import="com.brcb.service.CateNewsService" %>
<%@ page import="com.brcb.service.impl.CateNewsServiceImpl" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="news" class="com.brcb.entity.News" scope="page"></jsp:useBean>
<%
    Logger logger = LogManager.getLogger();
        request.setCharacterEncoding("UTF-8");
    try {

        CateNewsService cateNewsService = new CateNewsServiceImpl();
        String newsType = request.getParameter("newsType");
        String newsTitle = request.getParameter("newsTitle");
        String newsAbstract = request.getParameter("newsAbstract");
        String newsText = request.getParameter("newscontent");
        String newsAuthor = request.getParameter("newsAuthor");
        String id = request.getParameter("newsId");
        if (newsType == null || newsTitle == null || newsAbstract == null || newsText == null || newsAuthor == null || id == null) {
            throw new IllegalArgumentException("Missing required parameters.");
        }
        news.setType_id(newsType);
        news.setTitle(newsTitle);
        news.setDigest(newsAbstract);
        news.setText(newsText);
        news.setAuthor(newsAuthor);
        news.setId(id);
        int i = cateNewsService.updateById(news);
        logger.info("have influenced {} digit data ", i);
        String contextPath = request.getContextPath() + "/jsp/news/updateWin.jsp?typeId=" + session.getAttribute("newsType");
        response.sendRedirect(contextPath);
    } catch (NumberFormatException e) {
        logger.error("ID 格式错误:{} ", e.getMessage(), e);
        out.println("ID 格式错误，请检查输入的数据。");
    } catch (IllegalArgumentException e) {
        logger.error("缺少必要的参数: " + e.getMessage(), e);
        out.println("缺少必要的参数，请检查输入的数据。");
    } catch (Exception e) {
        logger.error("更新新闻时发生错误: " + e.getMessage(), e);
        out.println("更新新闻时发生错误，请稍后再试。");
    }
%>