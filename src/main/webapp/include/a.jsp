<%@ page import="com.brcb.entity.UserInfo" %><%--
  ~ Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
  ~ Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
  ~ Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
  ~ Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
  ~ Vestibulum commodo. Ut rhoncus gravida arcu.
  --%>

<%--
  Created by IntelliJ IDEA.
  User: 99437
  Date: 2024/7/2
  Time: 16:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--jsp:useBean实例化对象--%>
<jsp:useBean id="user" class="com.brcb.entity.UserInfo" scope="page"></jsp:useBean>
<jsp:setProperty name="user" property="id" value="1"></jsp:setProperty>







<%
        UserInfo userInfo=new UserInfo();
    %>
