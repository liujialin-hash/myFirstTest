package com.brcb.util;

import com.brcb.util.EnumUnit.FieldTypeEnum;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.lang.reflect.Field;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class databaseHelper {


    private static final Logger logger = LogManager.getLogger(databaseHelper.class);
    /*接收一个返回值*/
    ResultSet rs = null;
    /*数据库流*/
    PreparedStatement pst = null;
    /*数据库连接*/
    Connection con = null;

    public static GetDBConf getDBConf = GetDBConf.getInstance();
    /*获取连接*/
    private final String url = getDBConf.getProperty("url");
    private final String user = getDBConf.getProperty("username");
    private final String password = getDBConf.getProperty("password");
    private final String driver = getDBConf.getProperty("driver");

    /*连接数据库的方法*/
    public Connection getCon() {
        try {
            if (con == null) {
                Class.forName(driver);
                con = DriverManager.getConnection(url, user, password);
            }
        } catch (Exception e) {
            logger.error("exception is", e);
        }
        return con;
    }

    /*一个查询*/
    public <T> List<T> selectAll(final String sql, Class<T> clazz, Object... param) {
        /*获取连接*/
        con = getCon();
        /*创建一个返回的容器*/
        List<T> tList = new ArrayList<>();

        try {
            /*将sql流化*/
            putPrepared(sql, param);
            while (rs.next()) {
                /*获取实例*/
                T t = clazz.getDeclaredConstructor().newInstance();
                Field[] declaredFields = clazz.getDeclaredFields();
                resolerResultset(t, declaredFields);
                tList.add(t);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        closeAll(con, pst, rs);
        return tList;
    }

    public <T> T selectOne(String sql, Class<T> clazz, Object... param) {
        con = getCon();
        T onlyOne = null;
        try {
            putPrepared(sql, param);
            while (rs.next()) {
                /*获取实例*/
                onlyOne = clazz.getDeclaredConstructor().newInstance();
                Field[] declaredFields = clazz.getDeclaredFields();
                resolerResultset(onlyOne, declaredFields);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        closeAll(con, pst, rs);
        return onlyOne;
    }

    private <T> void resolerResultset(T onlyOne, Field[] declaredFields) throws SQLException, IllegalAccessException {
        for (Field declaredfield : declaredFields) {
            /*暴力反射去除权限*/
            declaredfield.setAccessible(true);
            /*获取属性名*/
            String name = declaredfield.getName();
            /*获取属性类型*/
            Class<?> type = declaredfield.getType();
            logger.info("declaredfield name:{},type:{}", name, type);
            FieldTypeEnum fieldType = FieldTypeEnum.fromClass(type);
            fieldType.setField(onlyOne, rs, name, declaredfield);
        }
    }

    private void putPrepared(String sql, Object[] param) throws SQLException {
        pst = con.prepareStatement(sql);
        if (param != null && param.length > 0) {
            for (int i = 0; i < param.length; i++) {
                pst.setObject(i + 1, param[i]);
            }
        }
        rs = pst.executeQuery();
    }

    private void closeAll(Connection con, PreparedStatement pst, ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                logger.error("Failed to close ResultSet", e);
            }
        }

        if (pst != null) {
            try {
                pst.close();
            } catch (Exception e) {
                logger.error("Failed to close PreparedStatement", e);
            }
        }

        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                logger.error("Failed to close Connection", e);
            }
        }
    }

}
