package com.brcb.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class GetDBConf {

    /*读取配置文件的帮助类*/
    private static Properties properties;
    private static GetDBConf getDBConf;

    private GetDBConf() {
        properties = new Properties();
        InputStream resourceAsStream = GetDBConf.class.getClassLoader().getResourceAsStream("databases/databases.properties");
        try {
            properties.load(resourceAsStream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static GetDBConf getInstance() {
        if (getDBConf == null) {
            getDBConf = new GetDBConf();
        }
        return getDBConf;
    }

    public String getProperty(String key) {
        return properties.getProperty(key);
    }


}
