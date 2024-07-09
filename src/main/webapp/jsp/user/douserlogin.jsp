<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.brcb.service.UserService" %>
<%@ page import="com.brcb.service.impl.UserServiceImpl" %>
<%@ page import="com.brcb.entity.UserInfo" %>
<%@ page import="com.brcb.service.CateAllNewsTypeService" %>
<%@ page import="com.brcb.service.impl.CateAllNewsTypesServiceImpl" %>
<%@ page import="com.brcb.entity.NewsType" %>
<%@ page import="java.util.List" %>
<%@ page import="com.brcb.entity.News" %>
<%@ page import="com.brcb.dao.CateNews" %>
<%@ page import="com.brcb.dao.impl.CateNewsImpl" %>
<%
    /*获取输入*/
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    /*调用登录接口*/
    UserService userService = new UserServiceImpl();
    UserInfo login = null;
    try {
        login = userService.login(username);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }
    String errora = "登录失败，用户名错误";
    String errorb = "登录失败，密码错误";
    String errorPage = "/jsp/user/login.jsp";
    String turePage = "/jsp/news/newsList.jsp";
    /*判断登录是否成功*/
    if (login == null) {
        request.setAttribute("msg", errora);
        request.getRequestDispatcher(errorPage).forward(request, response);
    } else {
        if (!login.getPassword().equals(password)) {
            request.setAttribute("msg", errorb);
            request.getRequestDispatcher(errorPage).forward(request, response);
        } else {
            request.setAttribute("loginInfo", login);
            CateAllNewsTypeService cateAllNewsTypeService = new CateAllNewsTypesServiceImpl();
            List<NewsType> cateAllNewsType = cateAllNewsTypeService.getCateAllNewsType();
            session.setAttribute("newsTypes", cateAllNewsType);
            CateNews cate = new CateNewsImpl();
            List<News> allNewsByType = cate.getAllNewsByNewsType(null);
            session.setAttribute("newsList", allNewsByType);
            request.getRequestDispatcher(turePage).forward(request, response);
        }
    }

%>