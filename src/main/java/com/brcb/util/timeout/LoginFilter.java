//package com.brcb.util.timeout;
//
//import com.brcb.entity.UserInfo;
//
//import javax.servlet.*;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//
//public class LoginFilter implements Filter {
//
//    private long timeout;
//
//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        // 可以从过滤器配置中获取超时时间
//        String timeoutStr = filterConfig.getInitParameter("timeout");
//        if (timeoutStr != null) {
//            timeout = Long.parseLong(timeoutStr);
//        }
//    }
//
//    @Override
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
//            throws IOException, ServletException {
//        HttpServletRequest httpRequest = (HttpServletRequest) request;
//        HttpServletResponse httpResponse = (HttpServletResponse) response;
//        HttpSession session = httpRequest.getSession(false);
//
//        if (session == null || session.getAttribute("userInfo") == null) {
//            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
//            return;
//        }
//
//        UserInfo userInfo = (UserInfo) session.getAttribute("userInfo");
//        if (!isLoginValid(userInfo)) {
//            session.invalidate(); // 使会话无效
//            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
//            return;
//        }
//
//        chain.doFilter(request, response);
//    }
//
//    @Override
//    public void destroy() {
//    }
//
//    private boolean isLoginValid(UserInfo userInfo) {
//        if (userInfo == null) {
//            return false;
//        }
//
//        // 检查登录超时时间
//        long lastLoginMillis = userInfo.getLastLoginTime().getTime();
//        long currentMillis = System.currentTimeMillis();
//        return (currentMillis - lastLoginMillis) <= timeout;
//    }
//}