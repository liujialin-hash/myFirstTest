<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.brcb.service.UserService" %>
<%@ page import="com.brcb.service.impl.UserServiceImpl" %>
<%@ page import="com.brcb.entity.UserInfo" %>
<%
    String errora = "登录失败，用户名错误";
    String errorb = "登录失败，密码错误";
    String errorPage = "/jsp/user/login.jsp";
    String flag = request.getParameter("flag");

    UserService userService = new UserServiceImpl();
    UserInfo login = null;
    if (flag.equals("login")) {
        /*获取输入*/
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null) {
            errora = "用户名为空";
        } else if (password == null) {
            errora = "密码为空";
        } else {
            /*调用登录接口*/
            try {
                login = userService.login(username);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        }
        /*判断登录是否成功*/
        if (login == null) {
            request.setAttribute("msg", errora);
            request.getRequestDispatcher(errorPage).forward(request, response);
        } else {
            if (!login.getPassword().equals(password)) {
                request.setAttribute("msg", errorb);
                request.getRequestDispatcher(errorPage).forward(request, response);
            } else {
                session.setAttribute("loginInfo", login);
                request.getRequestDispatcher("/jsp/user/mainlist.jsp").forward(request, response);
            }
        }
    }

%>