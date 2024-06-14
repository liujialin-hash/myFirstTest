<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="com.brcb.entity.UserInfo" %>
<%@ page import="com.brcb.service.UserService" %>
<%@ page import="com.brcb.service.impl.UserServiceImpl" %>
<%@ page contentType="text/html; charset=GBK" language="java" %>


<%
    Logger logger = LogManager.getLogger();

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    UserService UserService = new UserServiceImpl();

    UserInfo login = null;
    try {
        login = UserService.login(username);
    } catch (Exception e) {
        throw new RuntimeException(e);
    }

    String a = "µÇÂ¼Ê§°Ü£¬ÃÜÂë´íÎó";
    String bb = "µÇÂ¼Ê§°Ü£¬ÓÃ»§²»´æÔÚ";
    if (login != null) {
        String reallyPassword = login.getPassword();
        if (!reallyPassword.equals(password)) {
            logger.error(a);
            request.setAttribute("msg", a);
            request.setAttribute("error", "Invalid username or password");
            request.getRequestDispatcher("/login.jsp").forward(request, response);

        }else {
            request.setAttribute("login", login);
            request.getRequestDispatcher("user/userlist.jsp").forward(request, response);
        }

    }else {
        session.setAttribute("msg",bb);
        response.sendRedirect("/login.jsp");
    }
%>