/*
 * Copyright (c) 2024. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
 * Morbi non lorem porttitor neque feugiat blandit. Ut vitae ipsum eget quam lacinia accumsan.
 * Etiam sed turpis ac ipsum condimentum fringilla. Maecenas magna.
 * Proin dapibus sapien vel ante. Aliquam erat volutpat. Pellentesque sagittis ligula eget metus.
 * Vestibulum commodo. Ut rhoncus gravida arcu.
 */

package com.brcb.servlet;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class ExampleServlet extends HttpServlet {
    Logger logger = LogManager.getLogger(HttpServlet.class);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>GET Request Processed</h2>");
        out.println("<p>Welcome to the Example Servlet</p>");
        out.println("<p>Request URL: " + request.getRequestURL() + "</p>");
        out.println("</body></html>");

        // Logging the information
        logger.info("GET Request Processed");
        logger.info("Welcome to the Example Servlet");
        logger.info("Request URL: " + request.getRequestURL());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>POST Request Processed</h2>");
        out.println("<p>Form data:</p>");
        out.println("<ul>");

        // Iterate over form parameters and display them
        request.getParameterMap().forEach((name, values) -> {
            out.println("<li>" + name + ": " + String.join(", ", values) + "</li>");
            logger.info(name + ": " + String.join(", ", values));
        });

        out.println("</ul>");
        out.println("</body></html>");

        // Logging the information
        logger.info("POST Request Processed");
        logger.info("Form data processed");
    }
}