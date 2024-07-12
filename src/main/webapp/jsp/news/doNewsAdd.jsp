<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="org.apache.commons.fileupload.FileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileUploadException" %>
<%@ page import="java.io.File" %>
<%@ page import="com.brcb.service.CateNewsService" %>
<%@ page import="com.brcb.service.impl.CateNewsServiceImpl" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="news" class="com.brcb.entity.News" scope="page"></jsp:useBean>

<%
    // 获取Logger实例
    Logger logger = LogManager.getLogger();

    // 初始化表单字段
    String newsType = "";
    String id = "";
    String newsAuthor = "";
    String newscontent = "";
    String newsTitle = "";
    String newsAbstract = "";
    String newsPig = "";

    // 判断表单是否是文件表单
    boolean multipartContent = ServletFileUpload.isMultipartContent(request);

    if (multipartContent) {
        // 创建一个FileItemFactory实例，用于处理文件上传
        FileItemFactory factory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(factory);

        try {
            // 解析请求，获取表单项
            List<FileItem> fileItems = upload.parseRequest(request);

            for (FileItem fileItem : fileItems) {
                if (fileItem.isFormField()) {
                    // 处理普通表单字段
                    switch (fileItem.getFieldName()) {
                        case "newsType":
                            newsType = fileItem.getString("UTF-8");
                            break;
                        case "id":
                            id = fileItem.getString("UTF-8");
                            break;
                        case "newsAuthor":
                            newsAuthor = fileItem.getString("UTF-8");
                            break;
                        case "newscontent":
                            newscontent = fileItem.getString("UTF-8");
                            break;
                        case "newsTitle":
                            newsTitle = fileItem.getString("UTF-8");
                            break;
                        case "newsAbstract":
                            newsAbstract = fileItem.getString("UTF-8");
                            break;
                    }
                } else {
                    // 处理文件上传
                    String name = fileItem.getName(); // 获取上传文件名
                    String path = request.getServletContext().getRealPath("upload"); // 获取上传文件的存储路径
                    File file = new File(path, name); // 创建文件对象，路径为path + name

                    // 创建父目录（如果不存在）
                    if (!file.getParentFile().exists()) {
                        file.getParentFile().mkdirs();
                    }

                    // 写入文件到指定路径
                    fileItem.write(file);

                    // 保存文件路径到newsPig变量
                    newsPig = file.getPath();
                }
            }
        } catch (FileUploadException e) {
            // 处理文件上传异常
            logger.error("文件上传失败", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "文件上传失败");
            return;
        } catch (Exception e) {
            // 处理文件写入异常
            logger.error("文件写入失败", e);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "文件写入失败");
            return;
        }
    }

    // 设置news对象的属性
    news.setId(id);
    news.setAuthor(newsAuthor);
    news.setText(newscontent);
    news.setType_id(newsType);
    news.setTitle(newsTitle);
    news.setDigest(newsAbstract);
    news.setPig_path(newsPig);
    logger.info(news); // 记录news对象信息

    // 处理业务逻辑，将news对象插入数据库
    CateNewsService service = new CateNewsServiceImpl();
    int insert = service.insert(news);
    if (insert == 1) {
        // 插入成功后重定向到成功页面
        response.sendRedirect(request.getContextPath() + "/jsp/news/insertWin.jsp");
    } else {
        // 插入失败时记录错误
        logger.error("插入失败");
        request.setAttribute("msg", "新增失败，请联系管理员");
        request.getRequestDispatcher(request.getContextPath() + "/jsp/news/newsAdd.jsp").forward(request, response);
    }
%>