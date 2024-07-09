package com.brcb.util.fileUtil;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.Properties;

public class SFTPUtil {

    // SFTP服务器信息
    private static final String SFTP_HOST = "192.168.1.5"; // 服务器地址
    private static final int SFTP_PORT = 22; // SFTP服务端口，一般为22
    private static final String SFTP_USER = "icms"; // 登录用户名
    private static final String SFTP_PASS = "icms"; // 登录密码
    private static final String SFTP_REMOTE_DIRECTORY = "/home/icms/ob"; // 远程目录路径
    private static final String SFTP_LOCAL_DIRECTORY = "E:\\testSftp"; // 本地目录路径

//    public static void main(String[] args) {
//        try {
//            // 上传文件
////            uploadFile("oceanbase-all-in-one-4.3.1.0-100000032024051615.el7.x86_64.tar.gz");
//            // 下载文件
//            downloadFile("oceanbase-all-in-one-4.3.1.0-100000032024051615.el7.x86_64.tar.gz");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }

    // 上传文件的方法
    public static void uploadFile(String fileName) throws Exception {
        Session session = null; // 会话对象
        ChannelSftp channelSftp = null; // SFTP通道对象

        try {
            // 创建JSch对象
            JSch jsch = new JSch();
            // 获取会话
            session = jsch.getSession(SFTP_USER, SFTP_HOST, SFTP_PORT);
            // 设置密码
            session.setPassword(SFTP_PASS);

            // 设置会话的配置
            Properties config = new Properties();
            config.put("StrictHostKeyChecking", "no"); // 不检查主机密钥
            session.setConfig(config);
            // 连接会话
            session.connect();

            // 打开SFTP通道
            channelSftp = (ChannelSftp) session.openChannel("sftp");
            // 连接SFTP通道
            channelSftp.connect();

            // 创建文件输入流，读取本地文件
            FileInputStream fis = new FileInputStream(SFTP_LOCAL_DIRECTORY + "/" + fileName);
            // 切换到远程目录
            channelSftp.cd(SFTP_REMOTE_DIRECTORY);
            // 上传文件
            channelSftp.put(fis, fileName);
            // 关闭文件输入流
            fis.close();

            System.out.println("File uploaded successfully - " + fileName);
        } finally {
            // 断开SFTP通道连接
            if (channelSftp != null) {
                channelSftp.disconnect();
            }
            // 断开会话连接
            if (session != null) {
                session.disconnect();
            }
        }
    }

    // 下载文件的方法
    public static void downloadFile(String fileName) throws Exception {
        Session session = null; // 会话对象
        ChannelSftp channelSftp = null; // SFTP通道对象

        try {
            // 创建JSch对象
            JSch jsch = new JSch();
            // 获取会话
            session = jsch.getSession(SFTP_USER, SFTP_HOST, SFTP_PORT);
            // 设置密码
            session.setPassword(SFTP_PASS);

            // 设置会话的配置
            Properties config = new Properties();
            config.put("StrictHostKeyChecking", "no"); // 不检查主机密钥
            session.setConfig(config);
            // 连接会话
            session.connect();

            // 打开SFTP通道
            channelSftp = (ChannelSftp) session.openChannel("sftp");
            // 连接SFTP通道
            channelSftp.connect();

            // 创建文件输出流，准备写入本地文件
            FileOutputStream fos = new FileOutputStream(SFTP_LOCAL_DIRECTORY + "/" + fileName);
            // 切换到远程目录
            channelSftp.cd(SFTP_REMOTE_DIRECTORY);
            // 下载文件
            channelSftp.get(fileName, fos);
            // 关闭文件输出流
            fos.close();

            System.out.println("File downloaded successfully - " + fileName);
        } finally {
            // 断开SFTP通道连接
            if (channelSftp != null) {
                channelSftp.disconnect();
            }
            // 断开会话连接
            if (session != null) {
                session.disconnect();
            }
        }
    }
}