<%@ page import="java.io.*" %>
<%@ page import="org.apache.logging.log4j.Logger" %>
<%@ page import="org.apache.logging.log4j.LogManager" %>
<%@ page import="com.brcb.service.CateNewsService" %>
<%@ page import="com.brcb.service.impl.CateNewsServiceImpl" %>

<%@ page import="java.util.UUID" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:useBean id="news" class="com.brcb.entity.News" scope="page"></jsp:useBean>

<%
    // 设置请求的字符编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    // 获取Logger实例
    Logger logger = LogManager.getLogger();

    // 获取表单请求的boundary标志
    String boundary = "--" + request.getHeader("Content-Type").split("boundary=")[1];

    // 初始化表单字段
    String newsType = "";
    String id = "";
    String newsAuthor = "";
    String editor1 = "";
    String newsTitle = "";
    String newsAbstract = "";
    String newsPig = "";

    // 获取请求的输入流
    InputStream inputStream = request.getInputStream();
    // 将输入流包装成BufferedReader以便逐行读取
    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "UTF-8"));
    String line;
    // 用于暂存文件内容的输出流
    ByteArrayOutputStream fileOutputStream = new ByteArrayOutputStream();

    // 按行读取输入流
    while ((line = reader.readLine()) != null) {
        // 判断是否为boundary
        if (line.startsWith(boundary)) {
            if (fileOutputStream.size() > 0) {
                // 保存文件
                String fileName = UUID.randomUUID().toString();
                String filePath = application.getRealPath("/") + "uploads/" + fileName;
                try (FileOutputStream fos = new FileOutputStream(filePath)) {
                    // 将文件内容写入文件
                    fileOutputStream.writeTo(fos);
                }
                // 设置文件路径
                newsPig = fileName;
                // 重置fileOutputStream以便处理下一个文件
                fileOutputStream.reset();
            }
            // 读取Content-Disposition行
            line = reader.readLine(); // 读取 Content-Disposition
            String disposition = line;

            // 根据Content-Disposition确定表单字段
            if (disposition.contains("name=\"newsType\"")) {
                reader.readLine(); // 跳过空行
                newsType = reader.readLine(); // 读取newsType的值
            } else if (disposition.contains("name=\"id\"")) {
                reader.readLine(); // 跳过空行
                id = reader.readLine(); // 读取id的值
            } else if (disposition.contains("name=\"newsAuthor\"")) {
                reader.readLine(); // 跳过空行
                newsAuthor = reader.readLine(); // 读取newsAuthor的值
            } else if (disposition.contains("name=\"editor1\"")) {
                reader.readLine(); // 跳过空行
                editor1 = reader.readLine(); // 读取editor1的值
            } else if (disposition.contains("name=\"newsTitle\"")) {
                reader.readLine(); // 跳过空行
                newsTitle = reader.readLine(); // 读取newsTitle的值
            } else if (disposition.contains("name=\"newsAbstract\"")) {
                reader.readLine(); // 跳过空行
                newsAbstract = reader.readLine(); // 读取newsAbstract的值
            } else if (disposition.contains("name=\"newsPig\"; filename=")) {
                String fileName = disposition.split("filename=")[1].replace("\"", ""); // 获取文件名
                reader.readLine(); // 跳过Content-Type行
                reader.readLine(); // 跳过空行
                while ((line = reader.readLine()) != null && !line.startsWith(boundary)) {
                    fileOutputStream.write(line.getBytes("UTF-8")); // 将文件内容写入fileOutputStream
                    fileOutputStream.write("\r\n".getBytes("UTF-8")); // 换行
                }
            }
        }
    }

    // 设置news对象的属性
    news.setId(id);
    news.setAuthor(newsAuthor);
    news.setText(editor1);
    news.setType_id(newsType);
    news.setTitle(newsTitle);
    news.setDigest(newsAbstract);
    news.setPig_path(newsPig);
    logger.info(news); // 记录news对象信息

    // 创建CateNewsService对象并插入news对象
    CateNewsService service = new CateNewsServiceImpl();
    int insert = service.insert(news);
    if (insert == 1) {
        response.sendRedirect(request.getContextPath() + "/jsp/news/insertWin.jsp"); // 插入成功后重定向到成功页面
    } else {
        logger.error("插入失败"); // 插入失败时记录错误
    }
%>